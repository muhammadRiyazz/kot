import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mssql_connection/mssql_connection.dart';
import 'package:restaurant_kot/application/BillSubmitPrint/bill_submit_print_bloc.dart';
import 'package:restaurant_kot/core/conn.dart';
import 'package:restaurant_kot/core/printer/network_printer.dart';
import 'package:restaurant_kot/domain/cus/customer_model.dart';
import 'package:restaurant_kot/domain/item/kot_item_model.dart';
import 'package:restaurant_kot/domain/printer/priter_config.dart';
import 'package:restaurant_kot/infrastructure/get_time.dart';
import 'package:restaurant_kot/infrastructure/initalfetchdata/stock_mng.dart';
import 'package:restaurant_kot/infrastructure/stock/price_calculation.dart';
import 'package:restaurant_kot/presendation/printer%20ui/kot_print.dart';
part 'kot_submit_print_event.dart';
part 'kot_submit_print_state.dart';
part 'kot_submit_print_bloc.freezed.dart';

class KotSubmitPrintBloc
    extends Bloc<KotSubmitPrintEvent, KotSubmitPrintState> {
  KotSubmitPrintBloc() : super(KotSubmitPrintState.initial()) {
    on<Parcel>((event, emit) {
      emit(state.copyWith(
          parcel: event.parcel,
          stockout: false,
          printerstatus: 0,
          submitstatus: 0));
    });

    on<SubmitAndPrint>((event, emit) async {
      emit(state.copyWith(
          isLoading: true, stockout: false, printerstatus: 0, submitstatus: 0));

      try {
        // Initialize and establish the MSSQL connection
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();
        List<kotItem> kotitems = [];

        if (state.parcel) {
          List<kotItem> updatedutems = [];

          for (var element in event.kotitems) {
            String query = '''
              SELECT 
                     [pickuprate]
              FROM  [dbo].[MainStock]
              WHERE [codeorSKU] = '${element.itemCode}' 
              ''';

            var result = await connection.getData(query);
            log(result);
            List<dynamic> jsonList = json.decode(result);
            // Ensure totalstock is treated as an integer, even if it is a double

            double basicRate = parcelRateclc(
                item: element, pickuprate: jsonList[0]['pickuprate']);
            double taxableAmount = parceltaxableAmountcalculation(
              item: element,
              pickuprate: jsonList[0]['pickuprate'],
            );

            updatedutems.add(element.copyWith(
              basicRate: basicRate,
              unitTaxableAmountBeforeDiscount: taxableAmount,
              unitTaxableAmount: taxableAmount,
            ));
          }

          kotitems = updatedutems;
        } else {
          kotitems = event.kotitems;
        }

        List<kotItem> outofStock = [];

        // Out of stock section ----- (if enabled)
        if (stockmngGoods! || stockmngService!) {
          log('stockmngGoods! || stockmngService!');

          for (var product in kotitems) {
            log(product.serOrGoods);

            if ((stockmngGoods! && product.serOrGoods == 'GOODS') ||
                (stockmngService! && product.serOrGoods == 'SER') ||
                (stockmngGoods! && stockmngService!)) {
              String productId = product.itemCode;
              int qty = product.quantity;

              String query = '''
              SELECT [Id],
                     [codeorSKU],
                     [pdtname],
                     [totalstock]
              FROM  [dbo].[MainStock]
              WHERE [codeorSKU] = '$productId' AND [totalstock] < $qty
              ''';

              var result = await connection.getData(query);
              log(result);

              if (result != '[]') {
                List<dynamic> jsonList = json.decode(result);
                // Ensure totalstock is treated as an integer, even if it is a double
                int totalstock = (jsonList[0]['totalstock'] as num).toInt();
                outofStock.add(product.copyWith(stock: totalstock));
              }
            } else {
              log('----');
            }
          }
        }

        if (outofStock.isNotEmpty) {
          emit(state.copyWith(
            isLoading: false,
            stockout: true,
            outofStock: outofStock,
          ));
        } else {
          // If stock management is not enabled

          var formattedDate = getDateTime();
          var entrydata = entyDateTime();

          //         // Fetch KOT ID
          String kotId = await _fetchKotId(connection);
          // Fetch or Create Order ID
          String orderId =
              event.currentorderid ?? await _fetchOrderId(connection);

          List<kotItem> kotitemslist = [];
          if (event.currentorderid != null && event.currentitems != null) {
            for (var product in event.currentitems!) {
              if (product.quantity > 0) {
                kotitemslist.add(
                    product.copyWith(quantity: product.qty + product.quantity));
              } else if (product.quantity < 0) {
                kotitemslist.add(product.copyWith(
                    quantity: product.qty - product.quantity.abs()));
              } else {
                kotitemslist.add(product.copyWith(quantity: product.qty));
              }
            }
          }

          kotitemslist.addAll(kotitems.where(
              (item) => !kotitemslist.any((b) => b.itemCode == item.itemCode)));

          // Add data to OrderMainDetails
          double totalAmountBeforeDisc = 0.0;
          double discount = 0.0;
          double totalTaxableAmount = 0.0;
          double totalTaxAmount = 0.0;
          double totalCessAmount = 0.0;
          double totalAmount = 0.0;

          for (var element in kotitemslist) {
            int qty = element.quantity;

            totalAmountBeforeDisc +=
                element.unitTaxableAmountBeforeDiscount * qty;
            totalTaxableAmount += element.unitTaxableAmount * qty;
            totalAmount += element.basicRate * qty;
            totalTaxAmount +=
                (element.unitTaxableAmount * qty) * (element.gstPer / 100);
            totalCessAmount +=
                (element.unitTaxableAmount * qty) * (element.cessPer / 100);
          }

          if (event.currentorderid != null && event.currentitems != null) {
            String updateQuery = '''
  UPDATE  [dbo].[OrderMainDetails]
  SET
    EntryDate = '$entrydata',
    CustomerId = '${event.selectedcustomer.cusid}',
    CustomerName = '${event.selectedcustomer.bussinessname}',
    TableName = '${event.table.tableName}',
    FloorNumber = '${event.table.floor}',
    TotalAmountBeforeDisc = $totalAmountBeforeDisc,
    Discount = $discount,
    TotalTaxableAmount = $totalTaxableAmount,
    TotalTaxAmount = $totalTaxAmount,
    TotalCessAmount = $totalCessAmount,
    TotalAmount = $totalAmount,
    StartTime = '$formattedDate',
    EndTime = '$formattedDate',
    ActiveInnactive = 'Active',
    DineInOrOther = 'Dining',
    CreditOrPaid = 'Credit',
    BillNumber = '',
    UserID = '${event.userId}'
  WHERE
    OrderNumber = '$orderId';
''';

            final resultIfUpdate = await connection.writeData(updateQuery);
            log(resultIfUpdate);
          } else {
            String insertQuery = '''
          INSERT INTO  [dbo].[OrderMainDetails] (
          OrderNumber, EntryDate, CustomerId, CustomerName, TableName,
          FloorNumber, TotalAmountBeforeDisc, Discount, TotalTaxableAmount,
          TotalTaxAmount, TotalCessAmount, TotalAmount, StartTime, EndTime,
          ActiveInnactive, DineInOrOther, CreditOrPaid, BillNumber, UserID
          ) VALUES (
          '$orderId', '$entrydata', '${event.selectedcustomer.cusid}', '${event.selectedcustomer.bussinessname}', '${event.table.tableName}',
          '${event.table.floor}', $totalAmountBeforeDisc, $discount, $totalTaxableAmount,
          $totalTaxAmount, $totalCessAmount, $totalAmount, '$formattedDate', '$formattedDate',
           'Active', 'Dining', 'Credit', '', '${event.userId}'
           )
           ''';

            // log(insertQuery);

            final resultIfInsertion = await connection.writeData(insertQuery);
            log(resultIfInsertion.toString());
          }
          if (kotitems.isNotEmpty) {
            for (var element in kotitems) {
              int qty = element.quantity;

              final double totalTaxableAmount = qty * element.unitTaxableAmount;
              final double totalTaxAmount =
                  totalTaxableAmount * (element.gstPer / 100);
              final double totalCessAmount =
                  totalTaxableAmount * (element.cessPer / 100);
              final double totalAmount = qty * element.basicRate;

              String itemInsertQuery = '''
            INSERT INTO  [dbo].[OrderItemDetailsDetails] (
            OrderNumber, KOTNumber, EntryDate, StartTime, EndTime, CustomerId, CustomerName,
            TableName, FloorNumber, Description, ItemCode, ItemName, Quantity, BasicRate,
             UnitTaxableAmountBeforeDiscount, Discount, DiscountPer, UnitTaxableAmount,
               TotalTaxableAmount, GSTPer, CessPer, TotalTaxAmount, TotalCessAmount, TotalAmount,
                DineInOrOther, Delivery,ParcelOrNot, BillNumber, KitchenName, UserID
            ) VALUES (
            '$orderId', '$kotId', '$entrydata', '$formattedDate', '$formattedDate', '${event.selectedcustomer.cusid}',
           '${event.selectedcustomer.bussinessname}', '${event.table.tableName}', '${event.table.floor}',
           '${event.note ?? ""}', '${element.itemCode}', '${element.itemName}', ${element.quantity}, ${element.basicRate},
            ${element.unitTaxableAmountBeforeDiscount}, 0.0, 0.0, ${element.unitTaxableAmount}, $totalTaxableAmount,
            ${element.gstPer}, ${element.cessPer}, $totalTaxAmount, $totalCessAmount, $totalAmount,
            'Dining', '-',  'ParcelOrNot','', '${element.kitchenName}','${event.userId}'
            )
            ''';

              // log(itemInsertQuery);
              await connection.writeData(itemInsertQuery);
            }
          }
          // Insert Order Item Details

          if (event.kotretunitems.isNotEmpty) {
            for (var element in event.kotretunitems) {
              int qty = element.qty - element.quantity.abs();
              final double totalTaxableAmount = qty * element.unitTaxableAmount;
              final double totalTaxAmount =
                  totalTaxableAmount * (element.gstPer / 100);
              final double totalCessAmount =
                  totalTaxableAmount * (element.cessPer / 100);
              final double totalAmount = qty * element.basicRate;

              String itemUpdateQuery = '''
    UPDATE  [dbo].[OrderItemDetailsDetails]
    SET 
        OrderNumber = '$orderId',
        EntryDate = '$entrydata',
        StartTime = '$formattedDate',
        EndTime = '$formattedDate',
        CustomerId = '${event.selectedcustomer.cusid}',
        CustomerName = '${event.selectedcustomer.bussinessname}',
        TableName = '${event.table.tableName}',
        FloorNumber = '${event.table.floor}',
        Description = '${event.note ?? ""}',
        Quantity = $qty,
        BasicRate = ${element.basicRate},
        UnitTaxableAmountBeforeDiscount = ${element.unitTaxableAmountBeforeDiscount},
        Discount = 0.0,
        DiscountPer = 0.0,
        UnitTaxableAmount = ${element.unitTaxableAmount},
        TotalTaxableAmount = $totalTaxableAmount,
        GSTPer = ${element.gstPer},
        CessPer = ${element.cessPer},
        TotalTaxAmount = $totalTaxAmount,
        TotalCessAmount = $totalCessAmount,
        TotalAmount = $totalAmount,
        DineInOrOther = 'Dining',
        Delivery = '-',
        ParcelOrNot = 'ParcelOrNot',
        BillNumber = '',
        KitchenName = '${element.kitchenName}',
        UserID = '${event.userId}'
        WHERE 
        KOTNumber = '${element.kotno}' AND ItemCode = '${element.itemCode}';
        ''';

              final resultitemUpdateQuery =
                  await connection.writeData(itemUpdateQuery);
              log(resultitemUpdateQuery.toString());
            }
          }
          emit(state.copyWith(
            isLoading: false,
            submitstatus: 1,
            kotNo: kotId,
            ordno: orderId,
          ));
          log('print section ----------');

          List<PrinterConfig?>? printers = event.printers;

          int printingStatus = 0;

          if (event.kotPrint) {
            Map<String, List<kotItem>> groupedItems = {};
            log(kotitems.length.toString());
            for (var item in kotitems) {
              if (!groupedItems.containsKey(item.kitchenName)) {
                groupedItems[item.kitchenName] = [];
              }
              groupedItems[item.kitchenName]!.add(item);
            }

            for (var kitchen in groupedItems.keys) {
              PrinterConfig? printer;

              log('Kitchen: $kitchen');

              // Find the printer for the kitchen
              for (var element in printers!) {
                if (element!.kitchenName == kitchen) {
                  printer = element;
                }
              }

              // Print the ticket and await the result
              final List<int> test = await kotPrintData(
                parcel: state.parcel,
                dlt: false,
                note: event.note ?? '',
                items: groupedItems[kitchen]!,
                kotNo: kotId,
                orderNo: orderId,
                tableNo: event.table.tableName,
                user: 'user',
              );

              printingStatus = await NetworkPrinter().printTicket(
                test,
                printer!.printerName,
              );

              log('Printer response---$printingStatus');
            }
          }

          if (event.cancelKotPrint) {
            Map<String, List<kotItem>> groupedcancelItems = {};
            log(kotitems.length.toString());
            for (var item in event.kotretunitems) {
              if (!groupedcancelItems.containsKey(item.kitchenName)) {
                groupedcancelItems[item.kitchenName] = [];
              }
              groupedcancelItems[item.kitchenName]!.add(item);
            }
            for (var kitchen in groupedcancelItems.keys) {
              PrinterConfig? printer;

              // Find the printer for the kitchen
              for (var element in printers!) {
                if (element!.kitchenName == kitchen) {
                  printer = element;
                }
              }

              // Print the ticket and await the result
              final List<int> test = await kotPrintData(
                parcel: state.parcel,
                dlt: false,
                note: event.note ?? '',
                items: groupedcancelItems[kitchen]!,
                kotNo: '--',
                orderNo: orderId,
                tableNo: event.table.tableName,
                user: 'user',
              );

              printingStatus = await NetworkPrinter().printTicket(
                test,
                printer!.printerName,
              );

              log('Printer response---$printingStatus');
            }
          }

          if (event.cancelKotPrint || event.kotPrint) {
            // After all the async operations, check the status
            if (printingStatus == 1) {
              log('Printer status: 2---------');
              emit(state.copyWith(
                isLoading: false,
                printerstatus: 2,
                submitstatus: 0,
              ));
            } else {
              log('Printer status: 1---------');
              emit(state.copyWith(
                isLoading: false,
                printerstatus: 1,
                submitstatus: 0,
              ));
            }
          } else {
            emit(state.copyWith(
              isLoading: false,
              printerstatus: 1,
              submitstatus: 0,
            ));
          }
        }

        // emit(state.copyWith(isLoading: false));
      } catch (e) {
        log('Error in SubmitAndPrint: $e');
        emit(state.copyWith(isLoading: false));
      }
    });

    on<CancelKOT>((event, emit) async {
      log('CancelKOT-------------------');
      emit(state.copyWith(
          isLoading: true, stockout: false, printerstatus: 0, submitstatus: 0));

      try {
        List<kotItem> cancelkotitems = event.cancelkotitems;
        List<kotItem> currentkotitems = event.currentitems;
        List<kotItem> newlist = [];

        // Initialize and establish the MSSQL connection
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();
        var formattedDate = getDateTime();
        var entrydata = entyDateTime();

        if (currentkotitems.length == cancelkotitems.length) {
          String deleteQueary = '''
           DELETE FROM  [dbo].[OrderMainDetails]
            WHERE OrderNumber = '${event.currentorderid}';
           ''';

          log(deleteQueary);
          final resultitemUpdateQuery =
              await connection.writeData(deleteQueary);
          log(resultitemUpdateQuery.toString());
        } else {
          // Add items from cancelkotitems that are not in currentkotitems
          newlist = currentkotitems.where((currentItem) {
            return !cancelkotitems.any((cancelItem) =>
                currentItem.itemCode == cancelItem.itemCode &&
                currentItem.kotno == cancelItem.kotno); // Match criteria
          }).toList();
          log(' cancelkotitems.length  ${cancelkotitems.length.toString()}');
          log('currentkotitems.length---${currentkotitems.length.toString()}');
          log("newlist.length----${newlist.length.toString()}");

          // Add data to OrderMainDetails
          double totalAmountBeforeDisc = 0.0;
          double discount = 0.0;
          double totalTaxableAmount = 0.0;
          double totalTaxAmount = 0.0;
          double totalCessAmount = 0.0;
          double totalAmount = 0.0;

          for (var element in newlist) {
            int qty = element.qty;
            log('${element.itemName}  -----   ${element.kotno}    ---${element.qty} ');
            totalAmountBeforeDisc +=
                element.unitTaxableAmountBeforeDiscount * qty;
            totalTaxableAmount += element.unitTaxableAmount * qty;
            totalAmount += element.basicRate * qty;
            totalTaxAmount =
                (element.unitTaxableAmount * qty) * (element.gstPer / 100);
            totalCessAmount =
                (element.unitTaxableAmount * qty) * (element.cessPer / 100);
          }

          String updateQuery = '''
  UPDATE  [dbo].[OrderMainDetails]
  SET
    EntryDate = '$entrydata',
    CustomerId = '${event.selectedcustomer.cusid}',
    CustomerName = '${event.selectedcustomer.bussinessname}',
    TableName = '${event.table.tableName}',
    FloorNumber = '${event.table.floor}',
    TotalAmountBeforeDisc = $totalAmountBeforeDisc,
    Discount = $discount,
    TotalTaxableAmount = $totalTaxableAmount,
    TotalTaxAmount = $totalTaxAmount,
    TotalCessAmount = $totalCessAmount,
    TotalAmount = $totalAmount,
    StartTime = '$formattedDate',
    EndTime = '$formattedDate',
    ActiveInnactive = 'Active',
    DineInOrOther = 'Dining',
    CreditOrPaid = 'Credit',
    BillNumber = '',
    UserID ='${event.userId}'
  WHERE
    OrderNumber = '${event.currentorderid}';
''';

          log(updateQuery);

          final resultIfUpdate = await connection.writeData(updateQuery);
          log(resultIfUpdate);
        }

        for (var element in cancelkotitems) {
          String itemUpdateQuery = '''
      DELETE FROM  [dbo].[OrderItemDetailsDetails]
      WHERE KOTNumber = '${element.kotno}' AND ItemCode = '${element.itemCode}';
    ''';

          log(itemUpdateQuery);
          final resultitemUpdateQuery =
              await connection.writeData(itemUpdateQuery);
          log(resultitemUpdateQuery.toString());
        }
        emit(state.copyWith(
          isLoading: false,
          submitstatus: 1,
        ));

        if (event.cancelKotPrint) {
          log('print section ----------');
          Map<String, List<kotItem>> groupedItems = {};
          for (var item in cancelkotitems) {
            if (!groupedItems.containsKey(item.kitchenName)) {
              groupedItems[item.kitchenName] = [];
            }
            groupedItems[item.kitchenName]!.add(item);
          }

          List<PrinterConfig?>? printers = event.printers;

          int printingStatus = 0;

          for (var kitchen in groupedItems.keys) {
            PrinterConfig? printer;

            log('Kitchen: $kitchen');

            // Find the printer for the kitchen
            for (var element in printers!) {
              if (element!.kitchenName == kitchen) {
                printer = element;
              }
            }

            // Print the ticket and await the result
            final List<int> test = await kotPrintData(
              parcel: false,
              dlt: true,
              note: '',
              items: groupedItems[kitchen]!,
              kotNo: '--',
              orderNo: event.currentorderid,
              tableNo: event.table.tableName,
              user: 'user',
            );

            printingStatus = await NetworkPrinter().printTicket(
              test,
              printer!.printerName,
            );

            log('Printer response---$printingStatus');
          }

          if (printingStatus == 1) {
            log('Printer status: 2---------');
            emit(state.copyWith(
              isLoading: false,
              printerstatus: 2,
              submitstatus: 0,
            ));
          } else {
            log('Printer status: 1---------');
            emit(state.copyWith(
              isLoading: false,
              printerstatus: 1,
              submitstatus: 0,
            ));
          }
        } else {
          log('Printer status: 1---------');
          emit(state.copyWith(
            isLoading: false,
            printerstatus: 1,
            submitstatus: 0,
          ));
        }
      } catch (e) {
        log(e.toString());
        emit(state.copyWith(isLoading: false, stockout: false));
      }
    });

    on<rePrint>((event, emit) async {
      emit(state.copyWith(printerstatus: 0));

      if (!event.cancel) {
        List<kotItem> kotitems = event.kotitems;

        log('print section ----------');

        List<PrinterConfig?>? printers = event.printers;

        int printingStatus = 0;

        Map<String, List<kotItem>> groupedItems = {};
        log(kotitems.length.toString());
        for (var item in kotitems) {
          if (!groupedItems.containsKey(item.kitchenName)) {
            groupedItems[item.kitchenName] = [];
          }
          groupedItems[item.kitchenName]!.add(item);
        }

        for (var kitchen in groupedItems.keys) {
          PrinterConfig? printer;

          log('Kitchen: $kitchen');

          // Find the printer for the kitchen
          for (var element in printers!) {
            if (element!.kitchenName == kitchen) {
              printer = element;
            }
          }

          // Print the ticket and await the result
          final List<int> test = await kotPrintData(
            parcel: state.parcel,
            dlt: false,
            note: event.note ?? '',
            items: groupedItems[kitchen]!,
            kotNo: state.kotNo,
            orderNo: state.ordno,
            tableNo: event.table.tableName,
            user: 'user',
          );

          printingStatus = await NetworkPrinter().printTicket(
            test,
            printer!.printerName,
          );

          log('Printer response---$printingStatus');
        }

        Map<String, List<kotItem>> groupedcancelItems = {};
        log(kotitems.length.toString());
        for (var item in event.kotretunitems) {
          if (!groupedcancelItems.containsKey(item.kitchenName)) {
            groupedcancelItems[item.kitchenName] = [];
          }
          groupedcancelItems[item.kitchenName]!.add(item);
        }
        for (var kitchen in groupedcancelItems.keys) {
          PrinterConfig? printer;

          log('Kitchen: $kitchen');

          // Find the printer for the kitchen
          for (var element in printers!) {
            if (element!.kitchenName == kitchen) {
              printer = element;
            }
          }

          // Print the ticket and await the result
          final List<int> test = await kotPrintData(
            parcel: state.parcel,
            dlt: false,
            note: event.note ?? '',
            items: groupedcancelItems[kitchen]!,
            kotNo: '--',
            orderNo: state.ordno,
            tableNo: event.table.tableName,
            user: 'user',
          );

          printingStatus = await NetworkPrinter().printTicket(
            test,
            printer!.printerName,
          );

          log('Printer response---$printingStatus');
        }

        // After all the async operations, check the status
        if (printingStatus == 1) {
          log('Printer status: 2---------');
          emit(state.copyWith(
            isLoading: false,
            printerstatus: 2,
            submitstatus: 0,
          ));
        } else {
          log('Printer status: 1---------');
          emit(state.copyWith(
            isLoading: false,
            printerstatus: 1,
            submitstatus: 0,
          ));
        }
      } else {
        log('print section ----------');
        Map<String, List<kotItem>> groupedItems = {};
        for (var item in event.cancellist) {
          if (!groupedItems.containsKey(item.kitchenName)) {
            groupedItems[item.kitchenName] = [];
          }
          groupedItems[item.kitchenName]!.add(item);
        }

        List<PrinterConfig?>? printers = event.printers;

        int printingStatus = 0;

        for (var kitchen in groupedItems.keys) {
          PrinterConfig? printer;

          log('Kitchen: $kitchen');

          // Find the printer for the kitchen
          for (var element in printers!) {
            if (element!.kitchenName == kitchen) {
              printer = element;
            }
          }

          // Print the ticket and await the result
          final List<int> test = await kotPrintData(
            parcel: state.parcel,
            dlt: false,
            note: '',
            items: groupedItems[kitchen]!,
            kotNo: '--',
            orderNo: event.currentorderid!,
            tableNo: event.table.tableName,
            user: 'user',
          );

          printingStatus = await NetworkPrinter().printTicket(
            test,
            printer!.printerName,
          );

          log('Printer response---$printingStatus');
        }

        if (printingStatus == 1) {
          log('Printer status: 2---------');
          emit(state.copyWith(
            isLoading: false,
            printerstatus: 2,
            submitstatus: 0,
          ));
        } else {
          log('Printer status: 1---------');
          emit(state.copyWith(
            isLoading: false,
            printerstatus: 1,
            submitstatus: 0,
          ));
        }
      }
    });
  }
}

Future<String> _fetchKotId(MssqlConnection connection) async {
  log('_fetchKotId cll ---------');
  try {
    String query = '''
    SELECT ISNULL(
      'KOT' + CAST((1 + MAX(CONVERT(INT, RIGHT(KOTNo, LEN(KOTNo) - 3)))) AS VARCHAR),
      'KOT100'
    ) AS KOT FROM KOTNo
    ''';
    var result = await connection.getData(query);
    log('_fetchKotId cll ---------$result');

    if (result == '[]') throw Exception("Failed to fetch KOT ID");

    List<dynamic> jsonList = json.decode(result);
    String kotId = jsonList[0]['KOT'];
    log('_fetchKotId cll ---------$kotId');

    // Insert new KOT ID into database
    String insertQuery = '''
    INSERT INTO KOTNo (KOTNo, KOTDate) VALUES ('$kotId', '${getDateTime()}')
    ''';
    await connection.writeData(insertQuery);
    return kotId;
  } catch (e) {
    log(e.toString());
    return '';
  }
}

Future<String> _fetchOrderId(MssqlConnection connection) async {
  logWithTime('_fetchOrderId  called --------');
  String query = '''
    SELECT ISNULL(
      'ORD' + CAST((1 + MAX(CONVERT(INT, RIGHT(OrderNumber, LEN(OrderNumber) - 3)))) AS VARCHAR),
      'ORD100'
    ) AS ORD FROM OrderMainDetails
    ''';
  var result = await connection.getData(query);
  logWithTime('_fetchOrderId  called --------$result');

  if (result == '[]') throw Exception("Failed to fetch Order ID");

  List<dynamic> jsonList = json.decode(result);
  return jsonList[0]['ORD'];
}
