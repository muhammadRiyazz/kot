
// // Model class for OrderItem
// class OrderItem {
//   final int id;
//   final String orderNumber;
//   final String entryDate;
//   final String userName;
//   final String customerId;
//   final String customerName;
//   final String tableName;
//   final String floorNumber;
//   final String startDateTime;
//   final String itemCode;
//   final String itemName;
//   final double salePrice;
//   final int qty;
//   final double totalSalePrice;
//   final double gst;
//   final double gstAmount;
//   final double inclusiveSalePrice;
//   final String activeInactive;
//   final String kotNo;
//   final int deliveryQuantity;
//   final String billNumber;
//   final String unitPriceTaxNotAffect;
//   final String userId;

//   OrderItem({
//     required this.id,
//     required this.orderNumber,
//     required this.entryDate,
//     required this.userName,
//     required this.customerId,
//     required this.customerName,
//     required this.tableName,
//     required this.floorNumber,
//     required this.startDateTime,
//     required this.itemCode,
//     required this.itemName,
//     required this.salePrice,
//     required this.qty,
//     required this.totalSalePrice,
//     required this.gst,
//     required this.gstAmount,
//     required this.inclusiveSalePrice,
//     required this.activeInactive,
//     required this.kotNo,
//     required this.deliveryQuantity,
//     required this.billNumber,
//     required this.unitPriceTaxNotAffect,
//     required this.userId,
//   });

//   factory OrderItem.fromJson(Map<String, dynamic> json) {
//     return OrderItem(
//       id: json['Id'],
//       orderNumber: json['OrderNumber'],
//       entryDate: json['EntryDate'].toString(),
//       userName: json['UserName'],
//       customerId: json['CustomerId'],
//       customerName: json['CustomerName'],
//       tableName: json['TableName'] ?? '',
//       floorNumber: json['FloorNumber'] ?? '',
//       startDateTime: json['StartDateTime'].toString(),
//       itemCode: json['ItemCode'],
//       itemName: json['ItemName'],
//       salePrice: json['salePrice'],
//       qty: int.parse(json['Qty']),
//       totalSalePrice: json['TotalsalePrice'],
//       gst: json['GST'],
//       gstAmount: json['GSTAmount'],
//       inclusiveSalePrice: json['inclusiceSaleprice'],
//       activeInactive: json['ActiveInnactive'],
//       kotNo: json['KOTNo'],
//       deliveryQuantity: int.parse(json['DeliveryQuantity']),
//       billNumber: json['BillNumber'] ?? '',
//       unitPriceTaxNotAffect: json['unitPricetaxnotaffect'],
//       userId: json['UserID'] ?? '',
//     );
//   }
// }

// // Model class for Order
// class Order {
//   final String orderNumber;
//   final String entryDate;
//   final String userName;
//   final String customerId;
//   final String customerName;
//   final String tableName;
//   final String floorNumber;
//   final String startDateTime;
//   final List<OrderItem> items;
//   final double totalAmount; // Add total amount for the order

//   Order({
//     required this.orderNumber,
//     required this.entryDate,
//     required this.userName,
//     required this.customerId,
//     required this.customerName,
//     required this.tableName,
//     required this.floorNumber,
//     required this.startDateTime,
//     required this.items,
//     required this.totalAmount, // Initialize total amount
//   });

//   factory Order.fromJson(Map<String, dynamic> json, List<OrderItem> items) {
//     double totalAmount = items.fold(0.0, (sum, item) => sum + item.totalSalePrice); // Calculate total amount
//     return Order(
//       orderNumber: json['OrderNumber'],
//       entryDate: json['EntryDate'].toString(),
//       userName: json['UserName'],
//       customerId: json['CustomerId'],
//       customerName: json['CustomerName'],
//       tableName: json['TableName'] ?? '',
//       floorNumber: json['FloorNumber'] ?? '',
//       startDateTime:json['StartDateTime'].toString(),
//       items: items,
//       totalAmount: totalAmount, // Set total amount
//     );
//   }
// }

class Order {
  final int id;
  final String orderNumber;
  final String entryDate;
  final String userName;
  final String customerId;
  final String customerName;
  final String tableName;
  final String floorNumber;
  final double taxableAmount;
  final double discount;
  final double totalAmount;
  final String startDateTime;
  final String activeInnactive;
  final String dineInOrOther;
  final String? creditOrPaid;
  final String? billNumber;
  final String? paidOrNot;
  final String? userId;

  Order({
    required this.id,
    required this.orderNumber,
    required this.entryDate,
    required this.userName,
    required this.customerId,
    required this.customerName,
    required this.tableName,
    required this.floorNumber,
    required this.taxableAmount,
    required this.discount,
    required this.totalAmount,
    required this.startDateTime,
    required this.activeInnactive,
    required this.dineInOrOther,
    this.creditOrPaid,
    this.billNumber,
    this.paidOrNot,
    this.userId,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['Id'],
      orderNumber: json['OrderNumber'],
      entryDate: json['EntryDate'],
      userName: json['UserName'],
      customerId: json['CustomerId'],
      customerName: json['CustomerName'],
      tableName: json['TableName'],
      floorNumber: json['FloorNumber'],
      taxableAmount: json['TaxableAmount'],
      discount: json['Discount'],
      totalAmount: json['TotalAmount'],
      startDateTime: json['StartDateTime'],
      activeInnactive: json['ActiveInnactive'],
      dineInOrOther: json['DineInOrOther'],
      creditOrPaid: json['CreditOrPaid'],
      billNumber: json['BillNumber'],
      paidOrNot: json['paidornot'],
      userId: json['UserID'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'OrderNumber': orderNumber,
      'EntryDate': entryDate,
      'UserName': userName,
      'CustomerId': customerId,
      'CustomerName': customerName,
      'TableName': tableName,
      'FloorNumber': floorNumber,
      'TaxableAmount': taxableAmount,
      'Discount': discount,
      'TotalAmount': totalAmount,
      'StartDateTime': startDateTime,
      'ActiveInnactive': activeInnactive,
      'DineInOrOther': dineInOrOther,
      'CreditOrPaid': creditOrPaid,
      'BillNumber': billNumber,
      'paidornot': paidOrNot,
      'UserID': userId,
    };
  }
}
