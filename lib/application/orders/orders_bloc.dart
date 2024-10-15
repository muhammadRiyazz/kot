import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mssql_connection/mssql_connection.dart';
import 'package:restaurant_kot/core/conn.dart';
import 'package:restaurant_kot/infrastructure/orders/orders_configration.dart';

import '../../domain/orders/order_model.dart';

part 'orders_event.dart';
part 'orders_state.dart';
part 'orders_bloc.freezed.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc() : super(OrdersState.initial()) {
    on<AllOrders>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));

      try {
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();

        String ordersQuery =
            "SELECT [Id], [OrderNumber], [EntryDate], [UserName], [CustomerId], [CustomerName], "
            "[TableName], [FloorNumber], [StartDateTime], [ItemCode], [ItemName], [salePrice], "
            "[Qty], [TotalsalePrice], [GST], [GSTAmount], [inclusiceSaleprice], [ActiveInnactive], "
            "[KOTNo], [DeliveryQuantity], [BillNumber], [unitPricetaxnotaffect], [UserID] "
            "FROM [Restaurant].[dbo].[OrderItemDetailsDetails] "
            "WHERE [EntryDate] = '10/09/2024 00:00:00' AND [ActiveInnactive] = 'Active'";
        // "WHERE [EntryDate] = '2024-09-09 00:00:00.000'"
        // AND ActiveInnactive = 'Active'
        String? ordersresult = await connection.getData(ordersQuery);
        log(ordersresult);
    List<Order> orders=   await convertOrders(ordersresult);
        // Emit state with tableModels data
        emit(state.copyWith(
          isLoading: false,orders: orders
        ));
      } catch (e) {
        emit(state.copyWith(isLoading: false));
        log(e.toString());
      }
    });
  }
}
