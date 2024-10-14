import 'dart:convert';

import 'package:restaurant_kot/domain/tables/table_model.dart';

List<TableModel> tabeledata(String tablesJson, String ordersJson) {
  // Decode the tables and orders JSON
  List<dynamic> tables = jsonDecode(tablesJson);
  List<dynamic> orders = jsonDecode(ordersJson);

  // Map tables to the TableModel
  List<TableModel> tableModels = tables.map((table) {
    String tableName = table['TableNumber'];
    String floorName = table['FloorMumber'];
    String tableType = table['TableType'];

    // Filter orders for the current table
    List<dynamic> tableOrders =
        orders.where((order) => order['TableName'] == tableName).toList();

    // Check if the table has orders
    bool isEmpty = tableOrders.isEmpty;

    // Calculate order count
    int orderCount = tableOrders.length;

    // Find the first order time (if any orders exist)
    DateTime? firstOrderTime;
    if (!isEmpty) {
      firstOrderTime = DateTime.parse(
          tableOrders.first['StartDateTime'] ?? DateTime.now().toString());
    }

    // Sum the total order price
    double totalOrderPrice = tableOrders.fold(
        0.0,
        (sum, order) =>
            sum + (order['TotalAmount'] != null ? order['TotalAmount'] : 0.0));

    // If no orders exist, set default values
    if (isEmpty) {
      firstOrderTime = DateTime.parse("0000-00-00 00:00:00");
      totalOrderPrice = 0.0;
      orderCount = 0;
    }

    return TableModel(
      tableName: tableName,
      floorName: floorName,
      tableType: tableType,
      orderCount: orderCount,
      firstOrderTime: firstOrderTime,
      totalOrderPrice: totalOrderPrice,
      isEmpty: isEmpty,
    );
  }).toList();
  // Sort the tables: non-empty tables first, empty tables last
  tableModels.sort((a, b) {
    if (a.isEmpty && !b.isEmpty) {
      return 1; // Empty tables go last
    } else if (!a.isEmpty && b.isEmpty) {
      return -1; // Non-empty tables go first
    } else {
      return 0; // If both are the same, keep the same order
    }
  });
  // Ensure that the function returns the list of TableModel
  return tableModels;
}
