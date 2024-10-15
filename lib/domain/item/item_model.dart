class OrderItem {
  final int id;
  final String orderNumber;
  final String entryDate;
  final String userName;
  final String customerId;
  final String customerName;
  final String tableName;
  final String floorNumber;
  final String startDateTime;
  final String itemCode;
  final String itemName;
  final double salePrice;
  final int qty;
  final double totalSalePrice;
  final double gst;
  final double gstAmount;
  final double inclusiveSalePrice;
  final String activeInactive;
  final String kotNo;
  final int deliveryQuantity;
  final String billNumber;
  final String unitPriceTaxNotAffect;
  final String userId;

  OrderItem({
    required this.id,
    required this.orderNumber,
    required this.entryDate,
    required this.userName,
    required this.customerId,
    required this.customerName,
    required this.tableName,
    required this.floorNumber,
    required this.startDateTime,
    required this.itemCode,
    required this.itemName,
    required this.salePrice,
    required this.qty,
    required this.totalSalePrice,
    required this.gst,
    required this.gstAmount,
    required this.inclusiveSalePrice,
    required this.activeInactive,
    required this.kotNo,
    required this.deliveryQuantity,
    required this.billNumber,
    required this.unitPriceTaxNotAffect,
    required this.userId,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['Id'],
      orderNumber: json['OrderNumber'],
      entryDate: json['EntryDate'].toString(),
      userName: json['UserName'],
      customerId: json['CustomerId'],
      customerName: json['CustomerName'],
      tableName: json['TableName'] ?? '',
      floorNumber: json['FloorNumber'] ?? '',
      startDateTime: json['StartDateTime'].toString(),
      itemCode: json['ItemCode'],
      itemName: json['ItemName'],
      salePrice: json['salePrice'],
      qty: int.parse(json['Qty']),
      totalSalePrice: json['TotalsalePrice'],
      gst: json['GST'],
      gstAmount: json['GSTAmount'],
      inclusiveSalePrice: json['inclusiceSaleprice'],
      activeInactive: json['ActiveInnactive'],
      kotNo: json['KOTNo'],
      deliveryQuantity: int.parse(json['DeliveryQuantity']),
      billNumber: json['BillNumber'] ?? '',
      unitPriceTaxNotAffect: json['unitPricetaxnotaffect'],
      userId: json['UserID'] ?? '',
    );
  }
}
