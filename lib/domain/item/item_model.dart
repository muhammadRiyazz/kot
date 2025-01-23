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
  final double quantity;
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
  final String parcelOrnot;
  final String? productImg; // Add productImg as nullable

  // Constructor
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
    required this.quantity,
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
    required this.parcelOrnot,
    this.productImg, // Optional field
  });

  // Factory method
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
      quantity: (json['Quantity'] as num).toDouble(),
      basicRate: (json['BasicRate'] as num).toDouble(),
      unitTaxableAmountBeforeDiscount: (json['UnitTaxableAmountBeforeDiscount'] as num).toDouble(),
      discount: (json['Discount'] as num).toDouble(),
      unitTaxableAmount: (json['UnitTaxableAmount'] as num).toDouble(),
      totalTaxableAmount: (json['TotalTaxableAmount'] as num).toDouble(),
      gstPer: (json['GSTPer'] as num).toDouble(),
      cessPer: (json['CessPer'] as num).toDouble(),
      totalTaxAmount: (json['TotalTaxAmount'] as num).toDouble(),
      totalCessAmount: (json['TotalCessAmount'] as num).toDouble(),
      totalAmount: (json['TotalAmount'] as num).toDouble(),
      dineInOrOther: json['DineInOrOther'] ?? '',
      delivery: json['Delivery'] ?? '',
      billNumber: json['BillNumber'] ?? '',
      kitchenName: json['KitchenName'] ?? '',
      userId: json['UserID'] ?? '',
      parcelOrnot: json['ParcelOrNot'] ?? '',
      productImg:  json['productImg'], // Map the new field
    );
  }
}
