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
import 'package:restaurant_kot/infrastructure/initalfetchdata/taxtype.dart';
import 'package:restaurant_kot/infrastructure/stock/price_calculation.dart';
import 'package:restaurant_kot/presendation/printer%20ui/kot_print.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
        log('Initializing MSSQL connection...');
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();
        List<kotItem> kotitems = [];

        if (state.parcel) {
          log('Parcel mode enabled. Processing items...');
          List<kotItem> updatedutems = [];

          for (var element in event.kotitems) {
            log('Processing item: ${element.itemCode}');
            try {
              String query = '''
            SELECT 
                   [pickuprate]
            FROM  [dbo].[MainStock]
            WHERE [codeorSKU] = '${element.itemCode}' 
            ''';

              var result = await connection.getData(query);
              log('Query result: $result');
              List<dynamic> jsonList = json.decode(result);
              double basicRate;
              double taxableAmount;
              if (element.updated) {
                basicRate = element.basicRate;
                taxableAmount = element.unitTaxableAmount;
              } else {
                basicRate = parcelRateclc(
                    item: element, pickuprate: jsonList[0]['pickuprate']);
                taxableAmount = parceltaxableAmountcalculation(
                  item: element,
                  pickuprate: jsonList[0]['pickuprate'],
                );
              }

              updatedutems.add(element.copyWith(
                basicRate: basicRate,
                unitTaxableAmountBeforeDiscount: taxableAmount,
                unitTaxableAmount: taxableAmount,
              ));
            } catch (e) {
              log('Error processing item ${element.itemCode}: $e');
              rethrow;
            }
          }

          kotitems = updatedutems;
        } else {
          log('Parcel mode disabled. Using original items.');

          if (event.currentorderid != null && event.currentitems != null) {
            List<kotItem> updatedutems = [];

            for (var element in event.kotitems) {
              log('Processing item: ${element.itemCode}');
              try {
                String query = '''
            SELECT 
                   [DininACrate],
                   [DininNonACrate]

            FROM  [dbo].[MainStock]
            WHERE [codeorSKU] = '${element.itemCode}' 
            ''';

                var result = await connection.getData(query);
                log('Query result: $result');
                List<dynamic> jsonList = json.decode(result);
                double basicRate;
                double taxableAmount;
                if (element.updated) {
                  basicRate = element.basicRate;
                  taxableAmount = element.unitTaxableAmount;
                } else {
                  if (getCategory(element.itemCode) == 'GOODS') {
                    basicRate = element.basicRate;
                    taxableAmount = element.unitTaxableAmount;
                  } else {
                    basicRate = safeParseDouble(event.table.acOrNonAc == 'AC'
                        ? jsonList[0]['DininACrate']
                        : jsonList[0]['DininNonACrate']);

                    taxableAmount = parceltaxableAmountcalculation(
                      item: element,
                      pickuprate: event.table.acOrNonAc == 'AC'
                          ? jsonList[0]['DininACrate']
                          : jsonList[0]['DininNonACrate'],
                    );
                  }
                }

                updatedutems.add(element.copyWith(
                  basicRate: basicRate,
                  unitTaxableAmountBeforeDiscount: taxableAmount,
                  unitTaxableAmount: taxableAmount,
                ));
              } catch (e) {
                log('Error processing item ${element.itemCode}: $e');
                rethrow;
              }
            }

            kotitems = updatedutems;
          } else {
            kotitems = event.kotitems;
          }
        }

        List<kotItem> outofStock = [];
        if (stockmngGoods != null && stockmngService != null) {
          if (stockmngGoods! || stockmngService!) {
            log('Stock management enabled. Checking stock...');
            for (var product in kotitems) {
              log('Checking stock for product: ${product.itemCode}');
              try {
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
                  log('Stock check result: $result');

                  if (result != '[]') {
                    List<dynamic> jsonList = json.decode(result);
                    int totalstock = (jsonList[0]['totalstock'] as num).toInt();
                    outofStock.add(product.copyWith(stock: totalstock));
                  }
                } else {
                  log('Stock management not applicable for this product.');
                }
              } catch (e) {
                log('Error checking stock for product ${product.itemCode}: $e');
                rethrow;
              }
            }
          }
        }

        if (outofStock.isNotEmpty) {
          log('Out of stock items found. Emitting state...');
          emit(state.copyWith(
            isLoading: false,
            stockout: true,
            outofStock: outofStock,
          ));
        } else {
          log('---------');
          log('No out of stock items. Proceeding with order...');
          try {
            var formattedDate = getDateTime();
            var entrydata = entyDateTime();

            String kotId = await _fetchKotId(connection);
            String orderId =
                event.currentorderid ?? await _fetchOrderId(connection);

            List<kotItem> kotitemslist = [];
            if (event.currentorderid != null && event.currentitems != null) {
              log('Updating existing order items...');
              for (var product in event.currentitems!) {
                //   try {
                //     if (product.quantity > 0) {
                //       kotitemslist.add(product.copyWith(
                //           quantity: product.qty + product.quantity));
                //     } else if (product.quantity < 0) {
                //       kotitemslist.add(product.copyWith(
                //           quantity: product.qty - product.quantity.abs()));
                //     } else {
                kotitemslist.add(product.copyWith(quantity: product.qty));
                //     }
                //   } catch (e) {
                //     log('Error updating item ${product.itemCode}: $e');
                //     rethrow;
                //   }
              }

              // if (state.parcel) {
              //   kotitemslist.addAll(event.currentitems!);
              // }

              // kotitemslist.addAll(event.currentitems!);
              // kotitemslist.addAll(kotitems);
            } else {
              // kotitemslist.addAll(kotitems.where((item) =>
              //     !kotitemslist.any((b) => b.itemCode == item.itemCode)));
            }
            kotitemslist.addAll(kotitems);

            log('start     0 0 0 0  0 --------------');

            for (var element in kotitemslist) {
              log(element.itemName);
              log('${element.qty}  --  ${element.quantity}');
            }
            if (event.kotretunitems.isNotEmpty) {
              for (var product in event.kotretunitems) {
                for (var item in kotitemslist) {
                  if (item.itemCode == product.itemCode &&
                      item.parcelOrnot == product.parcelOrnot) {
                    log(product.quantity.toString());

                    log('calculating --------------');
                    item.quantity -=
                        product.quantity.abs(); // Update quantity directly
                  }
                }
              }
            }
            for (var element in kotitemslist) {
              log(element.itemName);
              log('${element.qty}  --  ${element.quantity}');
            }
            double totalAmountBeforeDisc = 0.0;
            double discount = 0.0;
            double totalTaxableAmount = 0.0;
            double totalTaxAmount = 0.0;
            double totalCessAmount = 0.0;
            double totalAmount = 0.0;

            for (var element in kotitemslist) {
              try {
                int qty = element.quantity;

                totalAmountBeforeDisc +=
                    element.unitTaxableAmountBeforeDiscount * qty;
                totalTaxableAmount += element.unitTaxableAmount * qty;
                totalAmount += inc!
                    ? element.basicRate * qty
                    : element.basicRate * qty +
                        ((element.unitTaxableAmount * qty) *
                                (element.gstPer / 100) +
                            (element.unitTaxableAmount * qty) *
                                (element.cessPer / 100));
                totalTaxAmount +=
                    (element.unitTaxableAmount * qty) * (element.gstPer / 100);
                totalCessAmount +=
                    (element.unitTaxableAmount * qty) * (element.cessPer / 100);
              } catch (e) {
                log('Error calculating amounts for item ${element.itemCode}: $e');
                rethrow;
              }
            }

            if (event.currentorderid != null && event.currentitems != null) {
              log('Updating existing order in database...');
              try {
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
    BillNumber = '${event.billNumber}',
    UserID = '${event.userId}'
  WHERE
    OrderNumber = '$orderId';
''';

                final resultIfUpdate = await connection.writeData(updateQuery);
                log('Update result: $resultIfUpdate');
              } catch (e) {
                log('Error updating order in database: $e');
                rethrow;
              }
            } else {
              log('Creating new order in database...');
              try {
                String updateQuery = '''
  UPDATE [dbo].[OrderMainDetails]
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
    UserID = '${event.userId}',
    MergedorNot = '',
    MergedOrders = '',
    MergedTables = ''

    WHERE OrderNumber = '$orderId'
    ''';

                final resultIfUpdate = await connection.writeData(updateQuery);
                log('Update result: $resultIfUpdate');
              } catch (e) {
                log('Error creating new order in database: $e');
                rethrow;
              }
            }

            if (kotitems.isNotEmpty) {
              log('Inserting order item details...');
              for (var element in kotitems) {
                try {
                  int qty = element.quantity;

                  final double totalTaxableAmount =
                      qty * element.unitTaxableAmount;
                  final double totalTaxAmount =
                      totalTaxableAmount * (element.gstPer / 100);
                  final double totalCessAmount =
                      totalTaxableAmount * (element.cessPer / 100);
                  final double totalAmount = inc!
                      ? qty * element.basicRate
                      : (qty * element.basicRate) +
                          totalCessAmount +
                          totalTaxAmount;

                  String itemInsertQuery = '''
INSERT INTO [dbo].[OrderItemDetailsDetails] (
    OrderNumber, KOTNumber, EntryDate, StartTime, EndTime, CustomerId, CustomerName,
    TableName, FloorNumber, ItemCode, ItemName, Quantity, BasicRate,
    UnitTaxableAmountBeforeDiscount, Discount, DiscountPer, UnitTaxableAmount,
    TotalTaxableAmount, GSTPer, CessPer, TotalTaxAmount, TotalCessAmount, TotalAmount,
    DineInOrOther, Delivery, ParcelOrNot, BillNumber, KitchenName, UserID, MergedOldOrderNumber,KOTNote,
    MergedOldTableNumber
) VALUES (
    '$orderId', '$kotId', '$entrydata', '$formattedDate', '$formattedDate', '${event.selectedcustomer.cusid}',
    '${event.selectedcustomer.bussinessname}', '${event.table.tableName}', '${event.table.floor}',
    '${element.itemCode}', '${element.itemName}', ${element.quantity}, ${element.basicRate},
    ${element.unitTaxableAmountBeforeDiscount}, 0.0, 0.0, ${element.unitTaxableAmount}, $totalTaxableAmount,
    ${element.gstPer}, ${element.cessPer}, $totalTaxAmount, $totalCessAmount, $totalAmount,
    'Dining', '-', ${state.parcel ? "'Parcel'" : "''"}, '', '${element.kitchenName}', '${event.userId}', '-','${event.note ?? '-'}' ,'-'
)
''';

                  await connection.writeData(itemInsertQuery);
                } catch (e) {
                  log('Error inserting item ${element.itemCode}: $e');
                  rethrow;
                }
              }
            }

            if (event.kotretunitems.isNotEmpty) {
              log('Updating returned items...');
              for (var element in event.kotretunitems) {
                try {
                  int qty = element.qty - element.quantity.abs();
                  final double totalTaxableAmount =
                      qty * element.unitTaxableAmount;
                  final double totalTaxAmount =
                      totalTaxableAmount * (element.gstPer / 100);
                  final double totalCessAmount =
                      totalTaxableAmount * (element.cessPer / 100);
                  final double totalAmount = inc!
                      ? qty * element.basicRate
                      : (qty * element.basicRate) +
                          totalCessAmount +
                          totalTaxAmount;
                  String itemUpdateQuery = '''
UPDATE [dbo].[OrderItemDetailsDetails]
SET 
    OrderNumber = '$orderId',
    EntryDate = '$entrydata',
    StartTime = '$formattedDate',
    EndTime = '$formattedDate',
    CustomerId = '${event.selectedcustomer.cusid}',
    CustomerName = '${event.selectedcustomer.bussinessname}',
    TableName = '${event.table.tableName}',
    FloorNumber = '${event.table.floor}',
    Quantity = $qty,
    BasicRate = ${element.basicRate},
    UnitTaxableAmountBeforeDiscount = ${element.unitTaxableAmountBeforeDiscount},
    Discount = 0.0,
    DiscountPer = 0.0,
    UnitTaxableAmount = ${element.unitTaxableAmount},
    TotalTaxableAmount = $totalTaxableAmount,
    GSTPer = ${element.gstPer},
    CessPer = ${element.cessPer},
    TotalTaxAmount = $totalTaxAmount ,
    TotalCessAmount = $totalCessAmount ,
    TotalAmount = $totalAmount ,
    DineInOrOther = 'Dining',
    Delivery = '-',
    ParcelOrNot = '${element.parcelOrnot}',
    BillNumber = '',
    KitchenName = '${element.kitchenName}',
    UserID = '${event.userId}'
WHERE 
    KOTNumber = '${element.kotno}' AND ItemCode = '${element.itemCode}';
''';

                  final resultitemUpdateQuery =
                      await connection.writeData(itemUpdateQuery);
                  log('Update result: $resultitemUpdateQuery');
                } catch (e) {
                  log('Error updating returned item ${element.itemCode}: $e');
                  rethrow;
                }
              }
            }

            emit(state.copyWith(
              isLoading: false,
              submitstatus: 1,
              kotNo: kotId,
              ordno: orderId,
            ));
            log('Print section ----------');
            final prefs = await SharedPreferences.getInstance();
            bool allkitchenprint = prefs.getBool('allkitchenprint') ?? false;
            log('allkitchenprint. ---- $allkitchenprint');

            List<PrinterConfig?>? printers = event.printers;
            int printingStatus = 0;

            // ---------------------- KOT PRINT ----------------------
            if (event.kotPrint) {
              log('Printing KOT...');

              // Skip KOT printing if allkitchenprint is true but no kotitems
              if (allkitchenprint && kotitems.isEmpty) {
                log('No KOT items to print for all kitchen. Skipping...');
              } else {
                Map<String, List<kotItem>> groupedItems = {};

                if (allkitchenprint) {
                  // Group all items under each kitchen printer except 'Bill'
                  for (var printer in printers!) {
                    if (printer == null ||
                        printer.kitchenName.trim().toLowerCase() == 'bill')
                      continue;

                    // Only add if kotitems are available
                    if (kotitems.isNotEmpty) {
                      groupedItems[printer.kitchenName] = kotitems;
                    }
                  }
                } else {
                  // Group items by their kitchen name
                  for (var item in kotitems) {
                    if (!groupedItems.containsKey(item.kitchenName)) {
                      groupedItems[item.kitchenName] = [];
                    }
                    groupedItems[item.kitchenName]!.add(item);
                  }
                }

                // Debug log for grouped items
                groupedItems.forEach((kitchen, items) {
                  log('Kitchen: $kitchen');
                  for (var item in items) {
                    log('  - Item: ${item.itemName}, Qty: ${item.quantity}');
                  }
                });

                for (var kitchen in groupedItems.keys) {
                  PrinterConfig? printer;

                  for (var element in printers!) {
                    if (element != null && element.kitchenName == kitchen) {
                      printer = element;
                      break;
                    }
                  }

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

                  if (printer != null) {
                    printingStatus = await NetworkPrinter().printTicket(
                      test,
                      printer.printerName,
                    );
                    log('Printer response---$printingStatus');
                  } else {
                    log('No printer found for kitchen: $kitchen');
                  }
                }
              }
            }

// ---------------------- CANCEL KOT PRINT ----------------------
            if (event.cancelKotPrint) {
              log('Printing canceled KOT...');

              // Skip cancel KOT printing if allkitchenprint is true but no items
              if (allkitchenprint && event.kotretunitems.isEmpty) {
                log('No cancel items to print for all kitchen. Skipping...');
              } else {
                Map<String, List<kotItem>> groupedcancelItems = {};

                if (allkitchenprint) {
                  for (var printer in printers!) {
                    if (printer == null ||
                        printer.kitchenName.trim().toLowerCase() == 'bill')
                      continue;

                    // Only add if there are actual cancel items
                    if (event.kotretunitems.isNotEmpty) {
                      groupedcancelItems[printer.kitchenName] =
                          event.kotretunitems;
                    }
                  }
                } else {
                  for (var item in event.kotretunitems) {
                    if (!groupedcancelItems.containsKey(item.kitchenName)) {
                      groupedcancelItems[item.kitchenName] = [];
                    }
                    groupedcancelItems[item.kitchenName]!.add(item);
                  }
                }

                for (var kitchen in groupedcancelItems.keys) {
                  PrinterConfig? printer;

                  for (var element in printers!) {
                    if (element != null && element.kitchenName == kitchen) {
                      printer = element;
                      break;
                    }
                  }

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

                  if (printer != null) {
                    printingStatus = await NetworkPrinter().printTicket(
                      test,
                      printer.printerName,
                    );
                    log('Printer response---$printingStatus');
                  } else {
                    log('No printer found for kitchen: $kitchen');
                  }
                }
              }
            }

// ---------------------- UPDATE PRINTER STATUS ----------------------
            if (event.cancelKotPrint || event.kotPrint) {
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

            // if (event.kotPrint) {
            //   log('Printing KOT...');
            //   Map<String, List<kotItem>> groupedItems = {};
            //   for (var item in kotitems) {
            //     if (!groupedItems.containsKey(item.kitchenName)) {
            //       groupedItems[item.kitchenName] = [];
            //     }
            //     groupedItems[item.kitchenName]!.add(item);
            //   }

            //   for (var kitchen in groupedItems.keys) {
            //     PrinterConfig? printer;

            //     for (var element in printers!) {
            //       if (element!.kitchenName == kitchen) {
            //         printer = element;
            //       }
            //     }

            //     final List<int> test = await kotPrintData(
            //       parcel: state.parcel,
            //       dlt: false,
            //       note: event.note ?? '',
            //       items: groupedItems[kitchen]!,
            //       kotNo: kotId,
            //       orderNo: orderId,
            //       tableNo: event.table.tableName,
            //       user: 'user',
            //     );

            //     printingStatus = await NetworkPrinter().printTicket(
            //       test,
            //       printer!.printerName,
            //     );

            //     log('Printer response---$printingStatus');
            //   }
            // }

            // if (event.cancelKotPrint) {
            //   log('Printing canceled KOT...');
            //   Map<String, List<kotItem>> groupedcancelItems = {};
            //   for (var item in event.kotretunitems) {
            //     if (!groupedcancelItems.containsKey(item.kitchenName)) {
            //       groupedcancelItems[item.kitchenName] = [];
            //     }
            //     groupedcancelItems[item.kitchenName]!.add(item);
            //   }
            //   for (var kitchen in groupedcancelItems.keys) {
            //     PrinterConfig? printer;

            //     for (var element in printers!) {
            //       if (element!.kitchenName == kitchen) {
            //         printer = element;
            //       }
            //     }

            //     final List<int> test = await kotPrintData(
            //       parcel: state.parcel,
            //       dlt: false,
            //       note: event.note ?? '',
            //       items: groupedcancelItems[kitchen]!,
            //       kotNo: '--',
            //       orderNo: orderId,
            //       tableNo: event.table.tableName,
            //       user: 'user',
            //     );

            //     printingStatus = await NetworkPrinter().printTicket(
            //       test,
            //       printer!.printerName,
            //     );

            //     log('Printer response---$printingStatus');
            //   }
            // }
          } catch (e) {
            log('Error in order processing: $e');
            rethrow;
          }
        }
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
    BillNumber ='${event.billNumber}',
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
  logWithTime('_insertAndFetchOrderId called --------');
  String query = '''
    INSERT INTO OrderMainDetails (OrderNumber)
    OUTPUT Inserted.OrderNumber
    VALUES (
      (
        SELECT ISNULL(
          'ORD' + CAST((1 + MAX(CONVERT(INT, RIGHT(OrderNumber, LEN(OrderNumber) - 3)))) AS VARCHAR),
          'ORD100'
        )
        FROM OrderMainDetails
      )
    )
  ''';

  var result = await connection.getData(query);
  logWithTime('_insertAndFetchOrderId result -------- $result');

  if (result == '[]') throw Exception("Failed to insert and fetch Order ID");

  List<dynamic> jsonList = json.decode(result);
  return jsonList[0]['OrderNumber'];
}
