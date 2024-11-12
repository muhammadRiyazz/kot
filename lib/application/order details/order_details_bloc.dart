import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mssql_connection/mssql_connection.dart';
import 'package:restaurant_kot/application/stock/stock_bloc.dart';
import 'package:restaurant_kot/core/conn.dart';
import 'package:restaurant_kot/domain/item/item_model.dart';
import 'package:restaurant_kot/domain/item/kot_item_model.dart';

part 'order_details_event.dart';
part 'order_details_state.dart';
part 'order_details_bloc.freezed.dart';

class OrderDetailsBloc extends Bloc<OrderDetailsEvent, OrderDetailsState> {
  OrderDetailsBloc() : super(OrderDetailsState.initial()) {
    List<KitchenItem> orderItems = [];
    on<OrderDetails>((event, emit) async {
      emit(state.copyWith(isLoading: true, toAddItems: []));

      try {
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();
        String ordersitemQuery = """
  SELECT [Id], [OrderNumber], [KOTNumber], [EntryDate], [StartTime], [EndTime], [CustomerId], [CustomerName],
         [TableName], [FloorNumber], [Description], [ItemCode], [ItemName], [Quantity], [BasicRate],
         [UnitTaxableAmountBeforeDiscount], [Discount], [UnitTaxableAmount], [TotalTaxableAmount], [GSTPer],
         [CessPer], [TotalTaxAmount], [TotalCessAmount], [TotalAmount], [DineInOrOther], [Delivery],
         [BillNumber], [KitchenName], [UserID]
  FROM [Restaurant].[dbo].[OrderItemDetailsDetails]
  WHERE CAST(EntryDate AS DATE) = '2024-10-23' AND [OrderNumber] = '${event.orderNo}';
""";

        String? ordersitemresult = await connection.getData(ordersitemQuery);
        log(ordersitemresult);
        List<dynamic> ordersitemresultjson = jsonDecode(ordersitemresult);

        // // Map the JSON to a list of Order objects
        List<OrderItem> items = ordersitemresultjson
            .map((data) => OrderItem.fromJson(data))
            .toList();
        List<KitchenItem> neworderItems = [];
        for (var element in items) {
          neworderItems.add(KitchenItem(dininACrate: '0',dininNonACrate: '0',
              qty: element.quantity.toInt(),
              stock: '0',
              serOrGoods: getCategory(element.itemCode),
              kitchenName: element.kitchenName,
              itemName: element.itemName,
              itemCode: element.itemCode,
              quantity: 0,
              basicRate: '0.0',
              unitTaxableAmountBeforeDiscount: '0.0',
              unitTaxableAmount: '0.0',
              totalTaxableAmount: '0.0',
              gstPer: '0.0',
              cessPer: '0.0',
              totalTaxAmount: '0.0',
              totalCessAmount: '0.0',
              totalAmount: '0.0'));
        }
                orderItems = neworderItems;

        //       // Emit state with tableModels data
        emit(state.copyWith(isLoading: false, orderitems: orderItems));
      } catch (e) {
        emit(state.copyWith(isLoading: false));
        log(e.toString());
      }
    });

    on<CancelQty>((event, emit) async {
      try {
        List<KitchenItem> items =
            List.from(state.orderitems); // Create a new copy of the list
        if (items.any(
            (existingItem) => existingItem.itemCode == event.currentItemid)) {
          log('currentItem ${event.currentItemid}');

          final index =
              items.indexWhere((i) => i.itemCode == event.currentItemid);
          log('existingItem ${items[index].itemName}');
          log(items[index].quantity.toString());
          // Check current quantity
          if (items[index].qty != items[index].quantity.abs() ||
              !items[index].quantity.isNegative) {
            // If qty is greater than 0, decrement it
            items[index] = items[index].copyWith(
              quantity: items[index].quantity - 1, // Keep the changedQty as is
            );
          }
          List<KitchenItem> filterdlist = items
              .where((item) => item.quantity != 0 && item.quantity > 0)
              .toList();
          List<KitchenItem> cancelitems = items
              .where((item) => item.quantity != 0 && item.quantity < 0)
              .toList();
          emit(state.copyWith(
              orderitems: items,
              toAddItems: filterdlist,
              toCancelItems: cancelitems)); // Emit the new state
        }
      } catch (e) {
        log(e.toString());
      }
    });
  on<ItemAction>((event, emit) async {
  log('StockBloc  -- ItemAction');

  // Creating new lists to avoid direct state modification
  List<KitchenItem> cancelKitchenItem = List.from(state.toCancelItems);
  List<KitchenItem> kotKItem = List.from(state.toAddItems);
  List<KitchenItem> orderItems = List.from(state.orderitems);

  if (event.from == 'cancellist') {
    cancelKitchenItem.removeWhere((element) => event.item.itemCode == element.itemCode);
  } else if (event.from == 'kotlist') {
    kotKItem.removeWhere((element) => event.item.itemCode == element.itemCode);
  }

  // Updating quantities in orderItems list
  orderItems = orderItems.map((element) {
    if (element.itemCode == event.item.itemCode) {
      return element.copyWith(quantity: 0);
    }
    return element;
  }).toList();

  emit(state.copyWith(
    orderitems: orderItems,
    toCancelItems: cancelKitchenItem,
    toAddItems: kotKItem,
  ));
});

    on<ClearItemSelection>((event, emit) async {
      try {
        emit(state.copyWith(
            toCancelItems: [],
            orderitems: orderItems,
            toAddItems: [])); // Emit the new state
      } catch (e) {
        log(e.toString());
      }
    });

    on<AddQty>((event, emit) async {
      try {
        List<KitchenItem> items =
            List.from(state.orderitems); // Create a new copy
        if (items.any(
            (existingItem) => existingItem.itemCode == event.currentItemid)) {
          final index =
              items.indexWhere((i) => i.itemCode == event.currentItemid);

          // Create a new instance with the updated changedQty
          items[index] =
              items[index].copyWith(quantity: items[index].quantity + 1);

          List<KitchenItem> filterdlist = items
              .where((item) => item.quantity != 0 && item.quantity > 0)
              .toList();
          List<KitchenItem> cancelitems = items
              .where((item) => item.quantity != 0 && item.quantity < 0)
              .toList();
          emit(state.copyWith(
              orderitems: items,
              toAddItems: filterdlist,
              toCancelItems: cancelitems)); // Emit the new state
        }
      } catch (e) {
        log(e.toString());
      }
    });
  }
}
