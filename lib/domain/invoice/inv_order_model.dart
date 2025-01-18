class InvoicesList {
  String? cusid;
  String? cusname;
  String? cusnameAddress;
  String? custorcontact;
  String? cusnameGSTNumber;
  String? custominvno;
  String? invoicedate;
  String? description;
  double? totalamount;
  double? totaltaxamount;
  double? discountamount;
  double? totalHaveToPayAmount;
  double? totalPaidAmount;
  double? balance;
  String? customerType;
  String? creditOrCleared;
  String? invTypeState;
  String? tableNumber;
  double? subTotal;
  double? billDiscPER;
  double? billDiscTotal;
  double? invNetAmount;
  double? invTotalTaxAmount;
  double? totalCessAmount;
  String? parcelOrNot;
  String? billAC;
  String? orderNumber;
  String? userID;
  String? mergedOrNot;

  InvoicesList({
    this.mergedOrNot,
    this.cusid,
    this.cusname,
    this.cusnameAddress,
    this.custorcontact,
    this.cusnameGSTNumber,
    this.custominvno,
    this.invoicedate,
    this.description,
    this.totalamount,
    this.totaltaxamount,
    this.discountamount,
    this.totalHaveToPayAmount,
    this.totalPaidAmount,
    this.balance,
    this.customerType,
    this.creditOrCleared,
    this.invTypeState,
    this.tableNumber,
    this.subTotal,
    this.billDiscPER,
    this.billDiscTotal,
    this.invNetAmount,
    this.invTotalTaxAmount,
    this.totalCessAmount,
    this.parcelOrNot,
    this.billAC,
    this.orderNumber,
    this.userID,
  });

  factory InvoicesList.fromJson(Map<String, dynamic> json) {
    return InvoicesList(
      mergedOrNot: json['Merged'] ?? '',
      cusid: json['cusid'],
      cusname: json['cusname'],
      cusnameAddress: json['cusnameAddress'],
      custorcontact: json['custorcontact'],
      cusnameGSTNumber: json['cusnameGSTNumber'],
      custominvno: json['custominvno'],
      invoicedate: json['Invoicedate'],
      description: json['description'],
      totalamount: (json['totalamount'] as num?)?.toDouble(),
      totaltaxamount: (json['totaltaxamount'] as num?)?.toDouble(),
      discountamount: (json['Discountamount'] as num?)?.toDouble(),
      totalHaveToPayAmount: (json['TotalHavetoPayamount'] as num?)?.toDouble(),
      totalPaidAmount: (json['totalpaidamount'] as num?)?.toDouble(),
      balance: (json['balance'] as num?)?.toDouble(),
      customerType: json['CustomerTYPE'],
      creditOrCleared: json['CreditOrCleared'],
      invTypeState: json['INVtypeState'],
      tableNumber: json['TableNumber'],
      subTotal: (json['SubTotal'] as num?)?.toDouble(),
      billDiscPER: (json['BillDiscPER'] as num?)?.toDouble(),
      billDiscTotal: (json['BillDiscTotal'] as num?)?.toDouble(),
      invNetAmount: (json['INVnetAmount'] as num?)?.toDouble(),
      invTotalTaxAmount: (json['INVtotalTAXAmnt'] as num?)?.toDouble(),
      totalCessAmount: (json['TotalCessAmount'] as num?)?.toDouble(),
      parcelOrNot: json['ParcelOrNot'],
      billAC: json['BillAC'],
      orderNumber: json['OrderNumber'],
      userID: json['UserID'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cusid': cusid,
      'cusname': cusname,
      'cusnameAddress': cusnameAddress,
      'custorcontact': custorcontact,
      'cusnameGSTNumber': cusnameGSTNumber,
      'custominvno': custominvno,
      'Invoicedate': invoicedate,
      'description': description,
      'totalamount': totalamount,
      'totaltaxamount': totaltaxamount,
      'Discountamount': discountamount,
      'TotalHavetoPayamount': totalHaveToPayAmount,
      'totalpaidamount': totalPaidAmount,
      'balance': balance,
      'CustomerTYPE': customerType,
      'CreditOrCleared': creditOrCleared,
      'INVtypeState': invTypeState,
      'TableNumber': tableNumber,
      'SubTotal': subTotal,
      'BillDiscPER': billDiscPER,
      'BillDiscTotal': billDiscTotal,
      'INVnetAmount': invNetAmount,
      'INVtotalTAXAmnt': invTotalTaxAmount,
      'TotalCessAmount': totalCessAmount,
      'ParcelOrNot': parcelOrNot,
      'BillAC': billAC,
      'OrderNumber': orderNumber,
      'UserID': userID,
    };
  }
}

class InvoiceItem {
  String? invoiceno;
  String? invdate;
  String? terms;
  String? ordereference;
  String? cusid;
  String? invoiceto;
  String? invaddress;
  String? shipto;
  String? shipaddr;
  String? gstno;
  String? email;
  String? smsno;
  String? customerType;
  String? pdtcode;
  String? pdtname;
  String? hsnCode;
  String? discp;
  double? pcs;
  double? qty;
  double? freeQty;
  double? unitPrice;
  double? itemMRP;
  double? amount;
  double? itemDiscPer;
  double? itemDiscAmount;
  double? grossValueAfterItemDisc;
  double? itemBillDiscPer;
  double? itemBillDiscAmount;
  double? itemTotalNetAmount;
  double? gst;
  double? gstAmount;
  double? totalAmount;
  double? venIGST;
  double? venIGSTAmount;
  double? venCGST;
  double? venCGSTAmount;
  double? venSGST;
  double? venSGSTAmount;
  double? cessPercentage;
  double? cessAmount;
  double? itemUnitSaleRate;
  String? parcelOrNot;
  String? orderNumber;
  String? kotNumber;
  String? userId;

  InvoiceItem({
    this.invoiceno,
    this.invdate,
    this.terms,
    this.ordereference,
    this.cusid,
    this.invoiceto,
    this.invaddress,
    this.shipto,
    this.shipaddr,
    this.gstno,
    this.email,
    this.smsno,
    this.customerType,
    this.pdtcode,
    this.pdtname,
    this.hsnCode,
    this.discp,
    this.pcs,
    this.qty,
    this.freeQty,
    this.unitPrice,
    this.itemMRP,
    this.amount,
    this.itemDiscPer,
    this.itemDiscAmount,
    this.grossValueAfterItemDisc,
    this.itemBillDiscPer,
    this.itemBillDiscAmount,
    this.itemTotalNetAmount,
    this.gst,
    this.gstAmount,
    this.totalAmount,
    this.venIGST,
    this.venIGSTAmount,
    this.venCGST,
    this.venCGSTAmount,
    this.venSGST,
    this.venSGSTAmount,
    this.cessPercentage,
    this.cessAmount,
    this.itemUnitSaleRate,
    this.parcelOrNot,
    this.orderNumber,
    this.kotNumber,
    this.userId,
  });
  factory InvoiceItem.fromJson(Map<String, dynamic> json) {
    double? parseDouble(dynamic value) {
      if (value == null) return null;
      if (value is num) return value.toDouble();
      if (value is String) return double.tryParse(value);
      return null;
    }

    return InvoiceItem(
      invoiceno: json['invoiceno'],
      invdate: json['invdate'],
      terms: json['terms'],
      ordereference: json['ordereference'],
      cusid: json['cusid'],
      invoiceto: json['invoiceto'],
      invaddress: json['invaddress'],
      shipto: json['shipto'],
      shipaddr: json['shipaddr'],
      gstno: json['gstno'],
      email: json['email'],
      smsno: json['smsno'],
      customerType: json['CustomerTYPE'],
      pdtcode: json['pdtcode'],
      pdtname: json['pdtname'],
      hsnCode: json['HSNCode'],
      discp: json['discp '],
      pcs: parseDouble(json['pcs']),
      qty: parseDouble(json['qty']),
      freeQty: parseDouble(json['Freeqty']),
      unitPrice: parseDouble(json['unitprice']),
      itemMRP: parseDouble(json['itemMRP']),
      amount: parseDouble(json['Amount']),
      itemDiscPer: parseDouble(json['ItemDiscPer']),
      itemDiscAmount: parseDouble(json['ItemDiscAmount']),
      grossValueAfterItemDisc: parseDouble(json['GrossValueAftrITMDisc']),
      itemBillDiscPer: parseDouble(json['ItemBillDiscPER']),
      itemBillDiscAmount: parseDouble(json['ItemBillDiscAmount']),
      itemTotalNetAmount: parseDouble(json['ItemTotalNETAmount']),
      gst: parseDouble(json['gst']),
      gstAmount: parseDouble(json['gstamount']),
      totalAmount: parseDouble(json['Totalamount']),
      venIGST: parseDouble(json['venIGST']),
      venIGSTAmount: parseDouble(json['venIGSTamnt']),
      venCGST: parseDouble(json['venCGST']),
      venCGSTAmount: parseDouble(json['venCGSTamnt']),
      venSGST: parseDouble(json['venSGST']),
      venSGSTAmount: parseDouble(json['venSGSTamnt']),
      cessPercentage: parseDouble(json['CessPercentage']),
      cessAmount: parseDouble(json['CessAmount']),
      itemUnitSaleRate: parseDouble(json['ItemUnitSaleRate']),
      parcelOrNot: json['ParcelOrNot'],
      orderNumber: json['OrderNumber'],
      kotNumber: json['KOTNumber'],
      userId: json['UserID'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'invoiceno': invoiceno,
      'invdate': invdate,
      'terms': terms,
      'ordereference': ordereference,
      'cusid': cusid,
      'invoiceto': invoiceto,
      'invaddress': invaddress,
      'shipto': shipto,
      'shipaddr': shipaddr,
      'gstno': gstno,
      'email': email,
      'smsno': smsno,
      'CustomerTYPE': customerType,
      'pdtcode': pdtcode,
      'pdtname': pdtname,
      'HSNCode': hsnCode,
      'discp ': discp,
      'pcs': pcs,
      'qty': qty,
      'Freeqty': freeQty,
      'unitprice': unitPrice,
      'itemMRP': itemMRP,
      'Amount': amount,
      'ItemDiscPer': itemDiscPer,
      'ItemDiscAmount': itemDiscAmount,
      'GrossValueAftrITMDisc': grossValueAfterItemDisc,
      'ItemBillDiscPER': itemBillDiscPer,
      'ItemBillDiscAmount': itemBillDiscAmount,
      'ItemTotalNETAmount': itemTotalNetAmount,
      'gst': gst,
      'gstamount': gstAmount,
      'Totalamount': totalAmount,
      'venIGST': venIGST,
      'venIGSTamnt': venIGSTAmount,
      'venCGST': venCGST,
      'venCGSTamnt': venCGSTAmount,
      'venSGST': venSGST,
      'venSGSTamnt': venSGSTAmount,
      'CessPercentage': cessPercentage,
      'CessAmount': cessAmount,
      'ItemUnitSaleRate': itemUnitSaleRate,
      'ParcelOrNot': parcelOrNot,
      'OrderNumber': orderNumber,
      'KOTNumber': kotNumber,
      'UserID': userId,
    };
  }
}
