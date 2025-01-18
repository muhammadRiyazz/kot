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

import 'package:restaurant_kot/domain/item/item_model.dart';

class Order {
  final int id;
  final String orderNumber;
  final String entryDate;
  final String customerId;
  final String customerName;
  final String tableName;
  final String floorNumber;
  final double totalAmountBeforeDisc;
  final double discount;
  final double totalTaxableAmount;
  final double totalTaxAmount;
  final double totalCessAmount;
  final double totalAmount;
  final String startTime;
  final String endTime;
  final String activeInnactive;
  final String dineInOrOther;
  final String creditOrPaid;
  final String billNumber;
  final String userId;
  final String mergedorNot;
  final String mergedOrders;
  final String mergedTables;

  Order({
    required this.mergedorNot,
    required this.mergedOrders,
    required this.mergedTables,
    required this.id,
    required this.orderNumber,
    required this.entryDate,
    required this.customerId,
    required this.customerName,
    required this.tableName,
    required this.floorNumber,
    required this.totalAmountBeforeDisc,
    required this.discount,
    required this.totalTaxableAmount,
    required this.totalTaxAmount,
    required this.totalCessAmount,
    required this.totalAmount,
    required this.startTime,
    required this.endTime,
    required this.activeInnactive,
    required this.dineInOrOther,
    required this.creditOrPaid,
    required this.billNumber,
    required this.userId,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      mergedOrders: json['MergedOrders'] ?? '',
      mergedTables: json['MergedTables'] ?? '',
      mergedorNot: json['MergedorNot'] ?? '',
      id: json['Id'] ?? 0,
      orderNumber: json['OrderNumber'] ?? '',
      entryDate: json['EntryDate'] ?? '',
      customerId: json['CustomerId'] ?? '',
      customerName: json['CustomerName'] ?? '',
      tableName: json['TableName'] ?? '',
      floorNumber: json['FloorNumber'] ?? '',
      totalAmountBeforeDisc:
          (json['TotalAmountBeforeDisc'] as num?)?.toDouble() ?? 0.0,
      discount: (json['Discount'] as num?)?.toDouble() ?? 0.0,
      totalTaxableAmount:
          (json['TotalTaxableAmount'] as num?)?.toDouble() ?? 0.0,
      totalTaxAmount: (json['TotalTaxAmount'] as num?)?.toDouble() ?? 0.0,
      totalCessAmount: (json['TotalCessAmount'] as num?)?.toDouble() ?? 0.0,
      totalAmount: (json['TotalAmount'] as num?)?.toDouble() ?? 0.0,
      startTime: json['StartTime'] ?? '',
      endTime: json['EndTime'] ?? '',
      activeInnactive: json['ActiveInnactive'] ?? '',
      dineInOrOther: json['DineInOrOther'] ?? '',
      creditOrPaid: json['CreditOrPaid'] ?? '',
      billNumber: json['BillNumber'] ?? '',
      userId: json['UserID'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'OrderNumber': orderNumber,
      'EntryDate': entryDate,
      'CustomerId': customerId,
      'CustomerName': customerName,
      'TableName': tableName,
      'FloorNumber': floorNumber,
      'TotalAmountBeforeDisc': totalAmountBeforeDisc,
      'Discount': discount,
      'TotalTaxableAmount': totalTaxableAmount,
      'TotalTaxAmount': totalTaxAmount,
      'TotalCessAmount': totalCessAmount,
      'TotalAmount': totalAmount,
      'StartTime': startTime,
      'EndTime': endTime,
      'ActiveInnactive': activeInnactive,
      'DineInOrOther': dineInOrOther,
      'CreditOrPaid': creditOrPaid,
      'BillNumber': billNumber,
      'UserID': userId,
    };
  }
}

class Orders {
  final Order order;
  final List<OrderItem> itemList;

  Orders({
    required this.order,
    required this.itemList,
  });
}
