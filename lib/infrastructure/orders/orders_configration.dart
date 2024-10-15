// // Function to fetch and convert orders
// import 'dart:convert';

// import '../../domain/orders/order_model.dart';

// Future<List<Order>> convertOrders(String ordersJson) async {
//   List<dynamic> orderItemsList = jsonDecode(ordersJson);

//   // Group items by OrderNumber
//   Map<String, List<OrderItem>> orderItemsMap = {};

//   for (var itemJson in orderItemsList) {
//     OrderItem item = OrderItem.fromJson(itemJson);
//     orderItemsMap.putIfAbsent(item.orderNumber, () => []).add(item);
//   }

//   // Create list of Order instances
//   List<Order> orders = [];

//   for (var orderEntry in orderItemsMap.entries) {
//     String orderNumber = orderEntry.key;
//     List<OrderItem> items = orderEntry.value;

//     // Use the first item in the list to get the common order properties
//     OrderItem firstItem = items.first;

//     // Create the Order object using data from the first item and the order items list
//     Order order = Order.fromJson({
//       'OrderNumber': orderNumber,
//       'EntryDate': firstItem.entryDate,
//       'UserName': firstItem.userName,
//       'CustomerId': firstItem.customerId,
//       'CustomerName': firstItem.customerName,
//       'TableName': firstItem.tableName,
//       'FloorNumber': firstItem.floorNumber,
//       'StartDateTime': firstItem.startDateTime,
//     }, items);

//     orders.add(order);
//   }

//   return orders;
// }
