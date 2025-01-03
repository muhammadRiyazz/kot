import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:mssql_connection/mssql_connection.dart';
import 'package:restaurant_kot/core/conn.dart';
import 'package:restaurant_kot/domain/cus/customer_model.dart';
import 'package:restaurant_kot/infrastructure/get_time.dart';

import '../../domain/orders/order_model.dart';

part 'orders_event.dart';
part 'orders_state.dart';
part 'orders_bloc.freezed.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc() : super(OrdersState.initial()) {
    on<AllOrders>((event, emit) async {
      log('AllOrders --------------------------');
      emit(state.copyWith(
        isLoading: true,
      ));

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
           [UserID]
    FROM  [dbo].[OrderMainDetails]
    WHERE CAST([EntryDate] AS DATE) = '$currentDate' 
          AND [ActiveInnactive] = 'Active' AND [CreditOrPaid] ='Credit' AND [UserID] = '$usernameA';
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
        isLoading: true,
      ));

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
           [UserID]
    FROM  [dbo].[OrderMainDetails]
 WHERE CAST([EntryDate] AS DATE) = '$currentDate'   AND [TableName] = '${event.tableNo}' AND [CreditOrPaid] ='Credit' AND [UserID] = '$usernameA';
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
  }
}
