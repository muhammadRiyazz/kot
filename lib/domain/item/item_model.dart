class OrderItem {
  final int id;
  final String orderNumber;
  final String kotNumber;
  final String entryDate;
  final String startTime;
  final String endTime;
  final String customerId;
  final String customerName;
  final String tableName;
  final String floorNumber;
  final String description;
  final String itemCode;
  final String itemName;
  final double quantity; // Change this to double
  final double basicRate;
  final double unitTaxableAmountBeforeDiscount;
  final double discount;
  final double unitTaxableAmount;
  final double totalTaxableAmount;
  final double gstPer;
  final double cessPer;
  final double totalTaxAmount;
  final double totalCessAmount;
  final double totalAmount;
  final String dineInOrOther;
  final String delivery;
  final String billNumber;
  final String kitchenName;
  final String userId;

  // Adding `changedQty` for mutable quantity tracking if needed
  final int changedQty;

  OrderItem({
    required this.id,
    required this.orderNumber,
    required this.kotNumber,
    required this.entryDate,
    required this.startTime,
    required this.endTime,
    required this.customerId,
    required this.customerName,
    required this.tableName,
    required this.floorNumber,
    required this.description,
    required this.itemCode,
    required this.itemName,
    required this.quantity, // Keep as double
    required this.basicRate,
    required this.unitTaxableAmountBeforeDiscount,
    required this.discount,
    required this.unitTaxableAmount,
    required this.totalTaxableAmount,
    required this.gstPer,
    required this.cessPer,
    required this.totalTaxAmount,
    required this.totalCessAmount,
    required this.totalAmount,
    required this.dineInOrOther,
    required this.delivery,
    required this.billNumber,
    required this.kitchenName,
    required this.userId,
    this.changedQty = 0, // Default value for changedQty
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['Id'],
      orderNumber: json['OrderNumber'],
      kotNumber: json['KOTNumber'],
      entryDate: json['EntryDate'].toString(),
      startTime: json['StartTime'].toString(),
      endTime: json['EndTime'].toString(),
      customerId: json['CustomerId'],
      customerName: json['CustomerName'],
      tableName: json['TableName'] ?? '',
      floorNumber: json['FloorNumber'] ?? '',
      description: json['Description'] ?? '',
      itemCode: json['ItemCode'],
      itemName: json['ItemName'],
      quantity: (json['Quantity'] as num).toDouble(), // Convert to double
      basicRate: (json['BasicRate'] as num).toDouble(), // Convert to double
      unitTaxableAmountBeforeDiscount: (json['UnitTaxableAmountBeforeDiscount'] as num).toDouble(), // Convert to double
      discount: (json['Discount'] as num).toDouble(), // Convert to double
      unitTaxableAmount: (json['UnitTaxableAmount'] as num).toDouble(), // Convert to double
      totalTaxableAmount: (json['TotalTaxableAmount'] as num).toDouble(), // Convert to double
      gstPer: (json['GSTPer'] as num).toDouble(), // Convert to double
      cessPer: (json['CessPer'] as num).toDouble(), // Convert to double
      totalTaxAmount: (json['TotalTaxAmount'] as num).toDouble(), // Convert to double
      totalCessAmount: (json['TotalCessAmount'] as num).toDouble(), // Convert to double
      totalAmount: (json['TotalAmount'] as num).toDouble(), // Convert to double
      dineInOrOther: json['DineInOrOther'] ?? '',
      delivery: json['Delivery'] ?? '',
      billNumber: json['BillNumber'] ?? '',
      kitchenName: json['KitchenName'] ?? '',
      userId: json['UserID'] ?? '',
    );
  }

  OrderItem copyWith({
    int? changedQty,
    // Add other fields if needed...
  }) {
    return OrderItem(
      id: id,
      orderNumber: orderNumber,
      kotNumber: kotNumber,
      entryDate: entryDate,
      startTime: startTime,
      endTime: endTime,
      customerId: customerId,
      customerName: customerName,
      tableName: tableName,
      floorNumber: floorNumber,
      description: description,
      itemCode: itemCode,
      itemName: itemName,
      quantity: quantity,
      basicRate: basicRate,
      unitTaxableAmountBeforeDiscount: unitTaxableAmountBeforeDiscount,
      discount: discount,
      unitTaxableAmount: unitTaxableAmount,
      totalTaxableAmount: totalTaxableAmount,
      gstPer: gstPer,
      cessPer: cessPer,
      totalTaxAmount: totalTaxAmount,
      totalCessAmount: totalCessAmount,
      totalAmount: totalAmount,
      dineInOrOther: dineInOrOther,
      delivery: delivery,
      billNumber: billNumber,
      kitchenName: kitchenName,
      userId: userId,
      changedQty: changedQty ?? this.changedQty, // Update `changedQty`
    );
  }
}
