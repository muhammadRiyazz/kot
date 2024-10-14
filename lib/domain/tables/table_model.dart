class TableModel {
  final String tableName;
  final String floorName;
  final String tableType;
  final int orderCount;
  final DateTime? firstOrderTime;
  final double totalOrderPrice;
  final bool isEmpty;

  TableModel({
    required this.tableName,
    required this.floorName,
    required this.tableType,
    required this.orderCount,
    this.firstOrderTime,
    required this.totalOrderPrice,
    required this.isEmpty,
  });

  @override
  String toString() {
    return 'TableModel(tableName: $tableName, floorName: $floorName, tableType: $tableType, orderCount: $orderCount, firstOrderTime: $firstOrderTime, totalOrderPrice: $totalOrderPrice, isEmpty: $isEmpty)';
  }
}
