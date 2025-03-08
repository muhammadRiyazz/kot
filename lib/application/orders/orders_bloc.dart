import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:mssql_connection/mssql_connection.dart';
import 'package:restaurant_kot/core/conn.dart';
import 'package:restaurant_kot/domain/cus/customer_model.dart';
import 'package:restaurant_kot/domain/item/item_model.dart';
import '../../domain/orders/order_model.dart';
part 'orders_event.dart';
part 'orders_state.dart';
part 'orders_bloc.freezed.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc() : super(OrdersState.initial()) {
      on<AllOrders>((event, emit) async {
      log('AllOrders --------------------------');
      emit(state.copyWith(
      isLoading: true, mergeisLoading: false, mergeStatus: 0));
      try {
      String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
      MssqlConnection connection = await connectionManager.getConnection();
      String ordersQuery = """
           SELECT [Id], 
           [OrderNumber], 
           [EntryDate], 
           [CustomerId], 
           [CustomerName], 
           [TableName], 
           [FloorNumber], 
           [TotalAmountBeforeDisc], 
           [Discount], 
           [TotalTaxableAmount], 
           [TotalTaxAmount], 
           [TotalCessAmount], 
           [TotalAmount], 
           [StartTime], 
           [EndTime], 
           [ActiveInnactive], 
           [DineInOrOther], 
           [CreditOrPaid], 
           [BillNumber], 
           [UserID],
           [MergedorNot],
           [MergedOrders],
           [MergedTables]
           FROM   [dbo].[OrderMainDetails]
           WHERE CAST([EntryDate] AS DATE) = '$currentDate' 
           AND [ActiveInnactive] = 'Active' AND (MergedorNot = 'Merged' OR MergedorNot = '') AND [CreditOrPaid] ='Credit' AND [UserID] = '$usernameA' AND [DineInOrOther] = 'Dining';
           """;

        // String ordersQuery =
        //     "SELECT [Id], [OrderNumber], [EntryDate], [UserName], [CustomerId], [CustomerName], "
        //     "[TableName], [FloorNumber], [StartDateTime], [ItemCode], [ItemName], [salePrice], "
        //     "[Qty], [TotalsalePrice], [GST], [GSTAmount], [inclusiceSaleprice], [ActiveInnactive], "
        //     "[KOTNo], [DeliveryQuantity], [BillNumber], [unitPricetaxnotaffect], [UserID] "
        //     "FROM  [dbo].[OrderItemDetailsDetails] "
        //     "WHERE [EntryDate] = '2024-09-10 00:00:00.000' ";
        // "WHERE [EntryDate] = '2024-09-09 00:00:00.000'"
        // AND ActiveInnactive = 'Active'
        String? ordersresult = await connection.getData(ordersQuery);
        log(ordersresult);
        List<dynamic> jsonResponse = jsonDecode(ordersresult);

        // Map the JSON to a list of Order objects
        List<Order> orders =
            jsonResponse.map((data) => Order.fromJson(data)).toList();
        // Emit state with tableModels data

        emit(state.copyWith(isLoading: false, orders: orders));
      } catch (e) {
        emit(state.copyWith(isLoading: false));
        log(e.toString());
      }
    });
    on<TableOrders>((event, emit) async {
      String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

      emit(state.copyWith(
          isLoading: true, mergeisLoading: false, mergeStatus: 0));

      try {
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();
        String ordersQuery = """
    SELECT [Id], 
           [OrderNumber], 
           [EntryDate], 
           [CustomerId], 
           [CustomerName], 
           [TableName], 
           [FloorNumber], 
           [TotalAmountBeforeDisc], 
           [Discount], 
           [TotalTaxableAmount], 
           [TotalTaxAmount], 
           [TotalCessAmount], 
           [TotalAmount], 
           [StartTime], 
           [EndTime], 
           [ActiveInnactive], 
           [DineInOrOther], 
           [CreditOrPaid], 
           [BillNumber], 
           [UserID] ,
           [MergedorNot],
           [MergedOrders],
           [MergedTables]
    FROM  [dbo].[OrderMainDetails]
 WHERE CAST([EntryDate] AS DATE) = '$currentDate'   AND [TableName] = '${event.tableNo}' AND  (MergedorNot = 'Merged' OR MergedorNot = '') AND [CreditOrPaid] ='Credit' AND [UserID] = '$usernameA' AND [DineInOrOther] = 'Dining';
""";

        String? ordersresult = await connection.getData(ordersQuery);
        log(ordersresult);
        List<dynamic> jsonResponse = jsonDecode(ordersresult);

        // Map the JSON to a list of Order objects
        List<Order> orders =
            jsonResponse.map((data) => Order.fromJson(data)).toList();
        // Emit state with tableModels data
        emit(state.copyWith(isLoading: false, tableOrders: orders));
      } catch (e) {
        emit(state.copyWith(isLoading: false));
        log(e.toString());
      }
    });

    on<Longpress>((event, emit) async {
      try {
        // Create a mutable copy of the list
        List<Order> items = List.from(state.isSelected);

        if (!items.contains(event.item)) {
          items.add(event.item);
        }
        emit(state.copyWith(isMultiSelectMode: true, isSelected: items));
        log(' length ---${items.length}');
      } catch (e) {
        log(e.toString());
      }
    });

    on<Clearitem>((event, emit) async {
      try {
        emit(state.copyWith(isMultiSelectMode: false, isSelected: []));
      } catch (e) {
        log(e.toString());
      }
    });

    on<Ontap>((event, emit) async {
      try {
        // Create a mutable copy of the list
        List<Order> items = List.from(state.isSelected);

        if (items.contains(event.item)) {
          items.remove(event.item);
        } else {
          items.add(event.item);
        }
        emit(state.copyWith(
          isMultiSelectMode: items.isEmpty ? false : true,
          isSelected: items,
        ));

        log(' length ---${items.length}');
      } catch (e) {
        log(e.toString());
      }
    });

    on<MergeAndPrint>((event, emit) async {
      emit(state.copyWith(
        mergeisLoading: true,
        mergeStatus: 0,
      ));
      log('MergeAndPrint---- calling');
      try {
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();

        List<Order> orders = List.from(state.isSelected);

        if (orders.isEmpty) {
          log('No orders selected for merging.');
          return;
        }

        // Find the lowest order by order number
        Order lowestOrder = orders.reduce((current, next) {
          int currentNum = int.parse(
              current.orderNumber.substring(3)); // Remove first 3 characters
          int nextNum = int.parse(
              next.orderNumber.substring(3)); // Remove first 3 characters
          return (currentNum < nextNum) ? current : next;
        });

        log('Lowest order number: ${lowestOrder.orderNumber}');

        // Prepare concatenated values for tables and orders to merge
        String newMergedTables = orders
            .where((element) => element.orderNumber != lowestOrder.orderNumber)
            .map((element) => element.tableName)
            .join(',');

        String newMergedOrders = orders
            .where((element) => element.orderNumber != lowestOrder.orderNumber)
            .map((element) => element.orderNumber)
            .join(',');

        // Single query to update the lowest order with concatenated values
        String updateLowestOrderQuery = """
        UPDATE [dbo].[OrderMainDetails]
        SET 
        [MergedorNot] = 'Merged',
        [MergedTables] = COALESCE(NULLIF([MergedTables], ''), '') 
                          + CASE WHEN [MergedTables] IS NOT NULL AND [MergedTables] <> '' THEN ',' ELSE '' END 
                          + '$newMergedTables',
        [MergedOrders] = COALESCE(NULLIF([MergedOrders], ''), '') 
                          + CASE WHEN [MergedOrders] IS NOT NULL AND [MergedOrders] <> '' THEN ',' ELSE '' END 
                          + '$newMergedOrders'
        WHERE [OrderNumber] = '${lowestOrder.orderNumber}';
        """;

        await connection.writeData(updateLowestOrderQuery);

        // Update the database for all orders being merged
        for (var order in orders) {
          if (order.orderNumber != lowestOrder.orderNumber) {
            // Update order item details
            String updateItemDetailsQuery = """
            UPDATE [dbo].[OrderItemDetailsDetails]
            SET 
            [OrderNumber] = '${lowestOrder.orderNumber}',
            [MergedOldOrderNumber] = '${order.orderNumber}',
            [MergedOldTableNumber] = '${order.tableName}'
             WHERE [OrderNumber] = '${order.orderNumber}';
             """;

            await connection.writeData(updateItemDetailsQuery);

            // Update main order details for merged orders
            String updateOrderQuery = """
            UPDATE [dbo].[OrderMainDetails]
            SET 
            [MergedorNot] = '${lowestOrder.orderNumber}',
            [MergedOrders] = '',
            [MergedTables] = ''
            WHERE [OrderNumber] = '${order.orderNumber}';
            """;

            await connection.writeData(updateOrderQuery);
          }
        }

        // Query to retrieve order item details for the lowest order
        String ordersItemQuery = """
      SELECT [Id], [OrderNumber], [KOTNumber], [EntryDate], [StartTime], [EndTime], 
             [CustomerId], [CustomerName], [TableName], [FloorNumber], [Description], 
             [ItemCode], [ItemName], [Quantity], [BasicRate], 
             [UnitTaxableAmountBeforeDiscount], [Discount], [UnitTaxableAmount], 
             [TotalTaxableAmount], [GSTPer], [CessPer], [TotalTaxAmount], 
             [TotalCessAmount], [TotalAmount], [DineInOrOther], [Delivery], 
             [BillNumber], [KitchenName], [UserID]
      FROM [dbo].[OrderItemDetailsDetails]
      WHERE [OrderNumber] = '${lowestOrder.orderNumber}';
    """;

        String? ordersItemResult = await connection.getData(ordersItemQuery);
        log(ordersItemResult);

        List<dynamic> ordersItemResultJson = jsonDecode(ordersItemResult);

        // Map the JSON to a list of OrderItem objects
        List<OrderItem> items = ordersItemResultJson
            .map((data) => OrderItem.fromJson(data))
            .toList();

        double totalTaxableAmount = 0.00;
        double totalTaxAmount = 0.00;
        double totalCessAmount = 0.00;
        double totalAmount = 0.00;

        for (var item in items) {
          totalAmount += item.totalAmount;
          totalCessAmount += item.totalCessAmount;
          totalTaxAmount += item.totalTaxAmount;
          totalTaxableAmount += item.totalTaxableAmount;
        }

        // Update the totals in the main order details
        String updateOrderQuery = """
      UPDATE [dbo].[OrderMainDetails]
      SET 
        [TotalAmountBeforeDisc] = '$totalTaxableAmount',
        [TotalTaxableAmount] = '$totalTaxableAmount',
        [TotalTaxAmount] = '$totalTaxAmount',
        [TotalCessAmount] = '$totalCessAmount',
        [TotalAmount] = '$totalAmount'
      WHERE [OrderNumber] = '${lowestOrder.orderNumber}';
    """;

        await connection.writeData(updateOrderQuery);

        log('MergeAndPrint completed successfully.');
        emit(state.copyWith(
            mergeisLoading: false,
            mergeStatus: 1,
            isMultiSelectMode: false,
            isSelected: []));
      } catch (e, stackTrace) {
        emit(state.copyWith(
          mergeisLoading: false,
          mergeStatus: 2,
          isMultiSelectMode: false,
        ));
        log('Error in MergeAndPrint: $e');
        log('StackTrace: $stackTrace');
      }
    });
  }
}



 // List<Orders> orderslist = [];

        // for (var element in orders) {
        //   String ordersitemQuery = """
        //  SELECT [Id], [OrderNumber], [KOTNumber], [EntryDate], [StartTime], [EndTime], [CustomerId], [CustomerName],
        //  [TableName], [FloorNumber], [Description], [ItemCode], [ItemName], [Quantity], [BasicRate],
        //  [UnitTaxableAmountBeforeDiscount], [Discount], [UnitTaxableAmount], [TotalTaxableAmount], [GSTPer],
        //  [CessPer], [TotalTaxAmount], [TotalCessAmount], [TotalAmount], [DineInOrOther], [Delivery],
        //  [BillNumber], [KitchenName], [UserID]
        //  FROM  [dbo].[OrderItemDetailsDetails]
        //  WHERE [OrderNumber] = '${element.orderNumber}';
        //  """;

        //   String? ordersitemresult = await connection.getData(ordersitemQuery);
        //   log(ordersitemresult);
        //   List<dynamic> ordersitemresultjson = jsonDecode(ordersitemresult);

        //   // // Map the JSON to a list of Order objects
        //   List<OrderItem> items = ordersitemresultjson
        //       .map((data) => OrderItem.fromJson(data))
        //       .toList();

        //   orderslist.add(Orders(itemList: items, order: element));

        // }

        // double tax = 0.00;

        // double cess = 0.00;
        // double netAmount = 0.00;
        // double taxable = 0.00;

        // for (var element in orderslist) {
        //   tax = tax + element.order.totalTaxAmount;
        //   cess = cess + element.order.totalCessAmount;
        //   netAmount = netAmount + element.order.totalAmount;
        //   taxable = taxable + element.order.totalTaxableAmount;
        // }

        // PrinterConfig printer = event.printer;

        // int printingStatus = 0;

        // final List<int> test = await mergebillPrintData(
        //     tax: tax,
        //     cess: cess,
        //     netAmount: netAmount,
        //     taxable: taxable,
        //     orders: orderslist);

        // printingStatus = await NetworkPrinter().printTicket(
        //   test,
        //   printer.printerName,
        // );

        // log('Printer response---$printingStatus');

        // if (printingStatus == 1) {
        //   log('Printer status: 2---------');
        //   emit(state.copyWith(
        //     isLoading: false,
        //     printerstatus: 2,
        //   ));
        // } else {
        //   log('Printer status: 1---------');
        //   emit(state.copyWith(
        //     isLoading: false,
        //     printerstatus: 1,
        //   ));
        // }






 