import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mssql_connection/mssql_connection.dart';
import 'package:restaurant_kot/core/conn.dart';
import 'package:restaurant_kot/domain/cus/customer_model.dart';
import 'package:restaurant_kot/domain/item/kot_item_model.dart';
import 'package:restaurant_kot/infrastructure/get_time.dart';
import 'package:restaurant_kot/infrastructure/initalfetchdata/stock_mng.dart';

part 'kot_submit_print_event.dart';
part 'kot_submit_print_state.dart';
part 'kot_submit_print_bloc.freezed.dart';

class KotSubmitPrintBloc
    extends Bloc<KotSubmitPrintEvent, KotSubmitPrintState> {
  KotSubmitPrintBloc() : super(KotSubmitPrintState.initial()) {
    on<Parcel>((event, emit) {
      emit(state.copyWith(parcel: event.parcel, stockout: false));
    });

    on<SubmitAndPrint>((event, emit) async {
      emit(state.copyWith(isLoading: true, stockout: false));

      try {
        List<kotItem> kotitems = event.kotitems;

        // Initialize and establish the MSSQL connection
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();

        // Out of stock section ----- (if enabled)
        if (stockmngGoods! || stockmngService!) {
          log('stockmngGoods! || stockmngService!');
          List<kotItem> outofStock = [];

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
              FROM [Restaurant].[dbo].[MainStock]
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

          if (outofStock.isNotEmpty) {
            emit(state.copyWith(
              isLoading: false,
              stockout: true,
              outofStock: outofStock,
            ));
          }
        } else {
          // If stock management is not enabled

          var formattedDate = getDateTime();
          log("formattedDate ---- ---- ---- $formattedDate");

          // // // Next KOT ID fetching

          String kotId = '';
          if (kotitems.isNotEmpty) {
            String kotIdPrefix = "KOT";
            String kotIdQuery = '''
                SELECT ISNULL(
                  '$kotIdPrefix' + CAST((1 + MAX(CONVERT(INT, RIGHT(KOTNo, LEN(KOTNo) - 3)))) AS VARCHAR),
                  '$kotIdPrefix' + '100'
                ) AS KOT
                FROM KOTNo
              ''';

            var kotIdResult = await connection.getData(kotIdQuery);
            log('KOT ID Result: $kotIdResult');

            if (kotIdResult == '[]') {
              throw Exception("Failed to fetch KOT ID");
            }

            List<dynamic> jsonListkot = json.decode(kotIdResult);
            kotId = jsonListkot[0]['KOT'];

            // // Insert the new KOTId into KOTNo
            String insertKotQuery = '''
          INSERT INTO KOTNo (KOTNo, KOTDate)
          VALUES ('$kotId', '$formattedDate')
          ''';
            await connection.writeData(insertKotQuery);
          }

          String orderId = '';

          if (event.currentorderid == null) {
            String orderIdPrefix = "ORD";
            String orderIdQuery = '''
                SELECT ISNULL(
                  '$orderIdPrefix' + CAST((1 + MAX(CONVERT(INT, RIGHT(OrderNumber, LEN(OrderNumber) - 3)))) AS VARCHAR),
                  '$orderIdPrefix' + '100'
                ) AS ORD
                FROM OrderMainDetails
              ''';

            var orderIdResult = await connection.getData(orderIdQuery);
            log('Order ID Result: $orderIdResult');

            if (orderIdResult == '[]') {
              throw Exception("Failed to fetch Order ID");
            }

            List<dynamic> jsonListOrderId = json.decode(orderIdResult);
            orderId = jsonListOrderId[0]['ORD'];
          } else {
            orderId = event.currentorderid!;
          }

          List<kotItem> kotitemslist = [];
          if (event.currentorderid != null && event.currentitems != null) {
            log('event.currentorderid != null');
            log(event.currentitems!.length.toString());
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

          for (var element in kotitemslist) {
            log('${element.itemCode}-------${element.itemName}----------${element.quantity}');
          }
          log('-------------------');
          for (var element in event.kotretunitems) {
            log('${element.itemCode}-------${element.itemName}----------${element.quantity}');
          }

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
            totalTaxAmount = totalTaxableAmount * (element.gstPer / 100);
            totalCessAmount = totalTaxableAmount * (element.cessPer / 100);
          }

          if (event.currentorderid != null && event.currentitems != null) {
            String updateQuery = '''
  UPDATE [Restaurant].[dbo].[OrderMainDetails]
  SET
    EntryDate = '$formattedDate',
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
    CreditOrPaid = 'CreditOrPaid',
    BillNumber = '-',
    UserID = 'UserID'
  WHERE
    OrderNumber = '$orderId';
''';

            log(updateQuery);

            final resultIfUpdate = await connection.writeData(updateQuery);
            log(resultIfUpdate);
          } else {
            String insertQuery = '''
          INSERT INTO [Restaurant].[dbo].[OrderMainDetails] (
          OrderNumber, EntryDate, CustomerId, CustomerName, TableName,
          FloorNumber, TotalAmountBeforeDisc, Discount, TotalTaxableAmount,
          TotalTaxAmount, TotalCessAmount, TotalAmount, StartTime, EndTime,
          ActiveInnactive, DineInOrOther, CreditOrPaid, BillNumber, UserID
          ) VALUES (
          '$orderId', '$formattedDate', '${event.selectedcustomer.cusid}', '${event.selectedcustomer.bussinessname}', '${event.table.tableName}',
          '${event.table.floor}', $totalAmountBeforeDisc, $discount, $totalTaxableAmount,
          $totalTaxAmount, $totalCessAmount, $totalAmount, '$formattedDate', '$formattedDate',
           'Active', 'Dining', 'CreditOrPaid', '-', 'UserID'
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
            INSERT INTO [Restaurant].[dbo].[OrderItemDetailsDetails] (
            OrderNumber, KOTNumber, EntryDate, StartTime, EndTime, CustomerId, CustomerName,
            TableName, FloorNumber, Description, ItemCode, ItemName, Quantity, BasicRate,
             UnitTaxableAmountBeforeDiscount, Discount, DiscountPer, UnitTaxableAmount,
               TotalTaxableAmount, GSTPer, CessPer, TotalTaxAmount, TotalCessAmount, TotalAmount,
                DineInOrOther, Delivery,ParcelOrNot, BillNumber, KitchenName, UserID
            ) VALUES (
            '$orderId', '$kotId', '$formattedDate', '$formattedDate', '$formattedDate', '${event.selectedcustomer.cusid}',
           '${event.selectedcustomer.bussinessname}', '${event.table.tableName}', '${event.table.floor}',
           '${event.note ?? ""}', '${element.itemCode}', '${element.itemName}', ${element.quantity}, ${element.basicRate},
            ${element.unitTaxableAmountBeforeDiscount}, 0.0, 0.0, ${element.unitTaxableAmount}, $totalTaxableAmount,
            ${element.gstPer}, ${element.cessPer}, $totalTaxAmount, $totalCessAmount, $totalAmount,
            'Dining', '-',  'ParcelOrNot','-', '${element.kitchenName}', 'UserID'
            )
            ''';

              // log(itemInsertQuery);
              await connection.writeData(itemInsertQuery);
            }
          }
          // Insert Order Item Details

          if (event.kotretunitems.isNotEmpty) {
            log('event.kotretunitems.isNotEmpty====');
            for (var element in event.kotretunitems) {
              int qty = element.qty - element.quantity.abs();
              log('$qty  ----- element.quantity');
              final double totalTaxableAmount = qty * element.unitTaxableAmount;
              final double totalTaxAmount =
                  totalTaxableAmount * (element.gstPer / 100);
              final double totalCessAmount =
                  totalTaxableAmount * (element.cessPer / 100);
              final double totalAmount = qty * element.basicRate;

              String itemUpdateQuery = '''
    UPDATE [Restaurant].[dbo].[OrderItemDetailsDetails]
    SET 
        OrderNumber = '$orderId',
        EntryDate = '$formattedDate',
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
        BillNumber = '-',
        KitchenName = '${element.kitchenName}',
        UserID = 'UserID'
    WHERE 
        KOTNumber = '${element.kotno}' AND ItemCode = '${element.itemCode}';
''';

              log(itemUpdateQuery);
              final resultitemUpdateQuery =
                  await connection.writeData(itemUpdateQuery);
              log(resultitemUpdateQuery.toString());
            }
          }
        }

        emit(state.copyWith(isLoading: false));
      } catch (e) {
        log('Error in SubmitAndPrint: $e');
        emit(state.copyWith(isLoading: false));
      }
    });

    on<CancelKOT>((event, emit) async {
      log('CancelKOT-------------------');
      emit(state.copyWith(isLoading: true, stockout: false));

      try {
        List<kotItem> cancelkotitems = event.cancelkotitems;
        List<kotItem> currentkotitems = event.currentitems;
        List<kotItem> newlist = [];

// Add items from cancelkotitems that are not in currentkotitems
        newlist = currentkotitems.where((currentItem) {
          return !cancelkotitems.any((cancelItem) =>
              currentItem.itemCode == cancelItem.itemCode &&
              currentItem.kotno == cancelItem.kotno); // Match criteria
        }).toList();
        log(' cancelkotitems.length  ${cancelkotitems.length.toString()}');
        log('currentkotitems.length---${currentkotitems.length.toString()}');
        log("newlist.length----${newlist.length.toString()}");

        // Initialize and establish the MSSQL connection
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();
        var formattedDate = getDateTime();

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
          totalTaxAmount = totalTaxableAmount * (element.gstPer / 100);
          totalCessAmount = totalTaxableAmount * (element.cessPer / 100);
        }

        String updateQuery = '''
  UPDATE [Restaurant].[dbo].[OrderMainDetails]
  SET
    EntryDate = '$formattedDate',
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
    CreditOrPaid = 'CreditOrPaid',
    BillNumber = '-',
    UserID = 'UserID'
  WHERE
    OrderNumber = '${event.currentorderid}';
''';

        log(updateQuery);

        final resultIfUpdate = await connection.writeData(updateQuery);
        log(resultIfUpdate);

        for (var element in cancelkotitems) {
          String itemUpdateQuery = '''
      DELETE FROM [Restaurant].[dbo].[OrderItemDetailsDetails]
      WHERE KOTNumber = '${element.kotno}' AND ItemCode = '${element.itemCode}';
    ''';

          log(itemUpdateQuery);
          final resultitemUpdateQuery =
              await connection.writeData(itemUpdateQuery);
          log(resultitemUpdateQuery.toString());
        }

        emit(state.copyWith(isLoading: false, stockout: false));
      } catch (e) {
        log(e.toString());
        emit(state.copyWith(isLoading: false, stockout: false));
      }
    });
  }
}
