import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mssql_connection/mssql_connection.dart';
import 'package:restaurant_kot/core/conn.dart';
import 'package:restaurant_kot/domain/item/item_model.dart';

part 'order_details_event.dart';
part 'order_details_state.dart';
part 'order_details_bloc.freezed.dart';

class OrderDetailsBloc extends Bloc<OrderDetailsEvent, OrderDetailsState> {
  OrderDetailsBloc() : super(OrderDetailsState.initial()) {
    on<OrderDetails>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));

      try {
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();
        String ordersitemQuery =
            "SELECT [Id], [OrderNumber], [EntryDate], [UserName], [CustomerId], [CustomerName], "
            "[TableName], [FloorNumber], [StartDateTime], [ItemCode], [ItemName], [salePrice], "
            "[Qty], [TotalsalePrice], [GST], [GSTAmount], [inclusiceSaleprice], [ActiveInnactive], "
            "[KOTNo], [DeliveryQuantity], [BillNumber], [unitPricetaxnotaffect], [UserID] "
            "FROM [Restaurant].[dbo].[OrderItemDetailsDetails] "
            "WHERE [EntryDate] = 'Sep 10 2024 12:00AM' AND [OrderNumber] = '${event.orderNo}'  ";
        String? ordersitemresult = await connection.getData(ordersitemQuery);
        // log(ordersitemresult);
        List<dynamic> ordersitemresultjson = jsonDecode(ordersitemresult);

        // // Map the JSON to a list of Order objects
        List<OrderItem> items = ordersitemresultjson
            .map((data) => OrderItem.fromJson(data))
            .toList();
        //       // Emit state with tableModels data
        emit(state.copyWith(isLoading: false, orderitems: items));
      } catch (e) {
        emit(state.copyWith(isLoading: false));
        log(e.toString());
      }
    });

    on<CancelQty>((event, emit) async {
      try {
        List<OrderItem> items =
            List.from(state.orderitems); // Create a new copy of the list
        if (items
            .any((existingItem) => existingItem.id == event.currentItem.id)) {
          log('currentItem ${event.currentItem.itemName}');

          final index = items.indexWhere((i) => i.id == event.currentItem.id);
          log('existingItem ${items[index].itemName}');
          log(items[index].changedQty.toString());
          // Check current quantity
          if (items[index].qty != items[index].changedQty.abs() ||
              !items[index].changedQty.isNegative) {
            // If qty is greater than 0, decrement it
            items[index] = items[index].copyWith(
              changedQty:
                  items[index].changedQty - 1, // Keep the changedQty as is
            );
          }
      List<OrderItem> filterdlist = items.where((item) => item.changedQty != 0&&item.changedQty > 0).toList();

          emit(state.copyWith(orderitems: items,toAddItems: filterdlist)); // Emit the new state
        }
      } catch (e) {
        log(e.toString());
      }
    });

    on<AddQty>((event, emit) async {
      try {
        List<OrderItem> items =
            List.from(state.orderitems); // Create a new copy
        if (items
            .any((existingItem) => existingItem.id == event.currentItem.id)) {
          final index = items.indexWhere((i) => i.id == event.currentItem.id);

          // Create a new instance with the updated changedQty
          items[index] =
              items[index].copyWith(changedQty: items[index].changedQty + 1);

      List<OrderItem> filterdlist = items.where((item) => item.changedQty != 0&&item.changedQty > 0).toList();

          emit(state.copyWith(orderitems: items,toAddItems: filterdlist)); // Emit the new state
        }
      } catch (e) {
        log(e.toString());
      }
    });
  }
}
