import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:mssql_connection/mssql_connection.dart';
import 'package:restaurant_kot/core/conn.dart';
import 'package:restaurant_kot/domain/item/item_model.dart';
import 'package:restaurant_kot/domain/item/kot_item_model.dart';
import 'package:restaurant_kot/infrastructure/stock/price_calculation.dart';

part 'order_details_event.dart';
part 'order_details_state.dart';
part 'order_details_bloc.freezed.dart';

class OrderDetailsBloc extends Bloc<OrderDetailsEvent, OrderDetailsState> {
  OrderDetailsBloc() : super(OrderDetailsState.initial()) {
    List<kotItem> orderItems = [];
    on<OrderDetails>((event, emit) async {
      emit(state.copyWith(isLoading: true, toAddItems: []));

      String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

      try {
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();

        // Updated SQL query with LEFT JOIN
        String ordersitemQuery = """
      SELECT oid.[Id], oid.[OrderNumber], oid.[KOTNumber], oid.[EntryDate], oid.[StartTime], oid.[EndTime], 
             oid.[CustomerId], oid.[CustomerName], oid.[TableName], oid.[FloorNumber], oid.[Description], 
             oid.[ItemCode], oid.[ItemName], oid.[Quantity], oid.[BasicRate], 
             oid.[UnitTaxableAmountBeforeDiscount], oid.[Discount], oid.[UnitTaxableAmount], 
             oid.[TotalTaxableAmount], oid.[GSTPer], oid.[CessPer], oid.[TotalTaxAmount], 
             oid.[TotalCessAmount], oid.[TotalAmount], oid.[DineInOrOther], oid.[Delivery], 
             oid.[BillNumber], oid.[KitchenName], oid.[UserID], 
             oid.[ParcelOrNot], ms.[productImg]
      FROM [dbo].[OrderItemDetailsDetails] oid
      LEFT JOIN [dbo].[MainStock] ms ON oid.[ItemCode] = ms.[codeorSKU]
      WHERE CAST(oid.[EntryDate] AS DATE) = '$currentDate' 
        AND oid.[OrderNumber] = '${event.orderNo}';
    """;

        String? ordersitemresult = await connection.getData(ordersitemQuery);
        log(ordersitemresult);

        List<dynamic> ordersitemresultjson = jsonDecode(ordersitemresult);

        // Parse JSON to `OrderItem`
        List<OrderItem> items = ordersitemresultjson
            .map((data) => OrderItem.fromJson(data))
            .toList();

        // Map `OrderItem` to `kotItem`
        List<kotItem> neworderItems = items.map((element) {
          return kotItem(updated: false,
            productImg:  element.productImg ?? '', // Include product image
            parcelOrnot: element.parcelOrnot,
            cessAmt: element.totalCessAmount,
            gstAmt: element.totalTaxAmount,
            kotno: element.kotNumber,
            stock: 0,
            qty: element.quantity.toInt(),
            serOrGoods: getCategory(element.itemCode),
            kitchenName: element.kitchenName,
            itemName: element.itemName,
            itemCode: element.itemCode,
            quantity: 0,
            basicRate: element.basicRate,
            unitTaxableAmountBeforeDiscount:
                element.unitTaxableAmountBeforeDiscount,
            unitTaxableAmount: element.unitTaxableAmount,
            gstPer: element.gstPer,
            cessPer: element.cessPer,
          );
        }).toList();

        orderItems = neworderItems;

        emit(state.copyWith(isLoading: false, orderitems: orderItems));
      } catch (e) {
        emit(state.copyWith(isLoading: false));
        log(e.toString());
      }
    });

    on<CancelQty>((event, emit) async {
      try {
        // Create a new copy of the list
        List<kotItem> items = List.from(state.orderitems);

        // Determine the condition based on whether kotno is null
        bool itemExists = event.kotno != null
            ? items.any((existingItem) =>
                existingItem.itemCode == event.currentItemid &&
                existingItem.kotno == event.kotno)
            : items.any(
                (existingItem) => existingItem.itemCode == event.currentItemid);

        if (itemExists) {
          // Find the index of the item
          final index = event.kotno != null
              ? items.indexWhere((i) =>
                  i.itemCode == event.currentItemid && i.kotno == event.kotno)
              : items.indexWhere((i) => i.itemCode == event.currentItemid);

          log('currentItem ${event.currentItemid}');
          log('existingItem ${items[index].itemName}');
          log(items[index].quantity.toString());

          // Check current quantity and decrement if conditions are met
          if (items[index].qty != items[index].quantity.abs() ||
              !items[index].quantity.isNegative) {
            items[index] = items[index].copyWith(
              quantity: items[index].quantity - 1,
            );
          }

          // Filter the lists
          List<kotItem> filteredList =
              items.where((item) => item.quantity > 0).toList();
          List<kotItem> cancelItems =
              items.where((item) => item.quantity < 0).toList();

          // Emit the new state
          emit(state.copyWith(
            orderitems: items,
            toAddItems: filteredList,
            toCancelItems: cancelItems,
          ));
        }
      } catch (e) {
        log(e.toString());
      }
    });

    on<ItemAction>((event, emit) async {
      log('StockBloc  -- ItemAction');

      // Creating new lists to avoid direct state modification
      List<kotItem> cancelKitchenItem = List.from(state.toCancelItems);
      List<kotItem> kotKItem = List.from(state.toAddItems);
      List<kotItem> orderItems = List.from(state.orderitems);

      if (event.from == 'cancellist') {
        cancelKitchenItem
            .removeWhere((element) => event.item.itemCode == element.itemCode);
      } else if (event.from == 'kotlist') {
        kotKItem
            .removeWhere((element) => event.item.itemCode == element.itemCode);
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

//     on<AddQty>((event, emit) async {
//       try {
//         List<kotItem> items = List.from(state.orderitems); // Create a new copy

//         // Check if an item with both the same itemCode and itemName exists
//         if(event.kotno==null){
//      if (items.any((existingItem) =>
//             existingItem.itemCode == event.currentItemid )) {

//           final index = items.indexWhere((i) =>
//               i.itemCode == event.currentItemid );

//           // Create a new instance with the updated quantity
//           items[index] =
//               items[index].copyWith(quantity: items[index].quantity + 1);

//           // Filter the list for toAddItems and toCancelItems
//           List<kotItem> filteredList = items
//               .where((item) => item.quantity != 0 && item.quantity > 0)
//               .toList();
//           List<kotItem> cancelItems = items
//               .where((item) => item.quantity != 0 && item.quantity < 0)
//               .toList();

//           // Emit the new state
//           emit(state.copyWith(
//             orderitems: items,
//             toAddItems: filteredList,
//             toCancelItems: cancelItems,
//           ));
//         }
//         }else{
// if (items.any((existingItem) =>
//             existingItem.itemCode == event.currentItemid &&
//             existingItem.kotno == event.kotno)) {

//           final index = items.indexWhere((i) =>
//               i.itemCode == event.currentItemid &&
//               i.kotno == event.kotno);

//           // Create a new instance with the updated quantity
//           items[index] =
//               items[index].copyWith(quantity: items[index].quantity + 1);

//           // Filter the list for toAddItems and toCancelItems
//           List<kotItem> filteredList = items
//               .where((item) => item.quantity != 0 && item.quantity > 0)
//               .toList();
//           List<kotItem> cancelItems = items
//               .where((item) => item.quantity != 0 && item.quantity < 0)
//               .toList();

//           // Emit the new state
//           emit(state.copyWith(
//             orderitems: items,
//             toAddItems: filteredList,
//             toCancelItems: cancelItems,
//           ));
//         }

//         }
//       } catch (e) {
//         log(e.toString());
//       }
//     });
    on<AddQty>((event, emit) async {
      try {
        List<kotItem> items = List.from(state.orderitems); // Create a new copy

        // Determine the condition for item existence
        bool itemExists = event.kotno == null
            ? items.any(
                (existingItem) => existingItem.itemCode == event.currentItemid)
            : items.any((existingItem) =>
                existingItem.itemCode == event.currentItemid &&
                existingItem.kotno == event.kotno);

        if (itemExists) {
          // Find the index of the item to update
          final index = event.kotno == null
              ? items.indexWhere((i) => i.itemCode == event.currentItemid)
              : items.indexWhere((i) =>
                  i.itemCode == event.currentItemid && i.kotno == event.kotno);

          // Update the item's quantity
          items[index] =
              items[index].copyWith(quantity: items[index].quantity + 1);

          // Filter the lists for toAddItems and toCancelItems
          List<kotItem> filteredList =
              items.where((item) => item.quantity > 0).toList();
          List<kotItem> cancelItems =
              items.where((item) => item.quantity < 0).toList();

          // Emit the new state
          emit(state.copyWith(
            orderitems: items,
            toAddItems: filteredList,
            toCancelItems: cancelItems,
          ));
        }
      } catch (e) {
        log(e.toString());
      }
    });
  }
}
