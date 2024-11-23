class Product {
  int changedQty; // Mutable field for changed quantity
  final String price;
  final String id;
  final String codeOrSKU;
  final String category;
  final String productName;
  final String hsnCode;
  final String description;
  final String purchaseAmount;
  final String purchaseAmountWithTax;
  String saleAmount;
  final String saleAmountWithTax;
  final String profit;
  final String pcs;
  final String tax;
  final String saleTaxAmount;
  final String stockControl;
  final String totalStock;
  final String lowStock;
  final String warehouse;
  final String vendorName;
  final String vendorInvoice;
  final String vendorContactName;
  final String vendorTax;
  final String purchaseTaxAmount;
  final String vendorImg;
  final String vendorTotalAmount;
  final String vendorTotalTaxAmount;
  final String privateNote;
  final String date; // Keep date as String for now
  final String productImg;
  final String status;
  final String lossOrGain;
  final String vendorId;
  final String hsnCode1;
  final String vendorIGST;
  final String vendorIGSTAmount;
  final String vendorCGST;
  final String vendorCGSTAmount;
  final String vendorSGST;
  final String vendorSGSTAmount;
  final String serOrGoods;
  final String itemMRP;
  final String saleInclusiveOrExclusive;
  final String purchaseInclusiveOrExclusive;
  final String initialCost;
  final String avgCost;
  final String measurementsUnit;
  final String saleInclusive;
  final String purchaseInclusive;
  final String barcodeId;
  final String supplierName;
  final String cessBasedOnQuantityOrValue;
  final String cessRate;
  final String categoryType;
  final String categoryBrand;
  final String categoryModelNo;
  final String categoryColor;
  final String categorySize;
  final String categoryPartNumber;
  final String categorySerialNumber;
  final String aliasNameId;
  final String initialQuantity;
  final String pCategoryType;
  final String brandType;
  final String rePackingApplicable;
  final String rePackingTo;
  final String rePackingBalance;
  final String bulkItemQuantity;
  final String balanceRePackingItemUnit;
  final String rePackingItemUnit;
  final String rePackingItemOf;
  final String saleAmountWithTaxAC;
  final String printerName;
  final String dineInACRate;
  final String dineInNonACRate;
  final String deliveryRate;
  final String pickUpRate;

  Product({
    required this.id,
    this.changedQty = 0, // Default value for mutable field
    required this.price,
    required this.codeOrSKU,
    required this.category,
    required this.productName,
    required this.hsnCode,
    required this.description,
    required this.purchaseAmount,
    required this.purchaseAmountWithTax,
    required this.saleAmount,
    required this.saleAmountWithTax,
    required this.profit,
    required this.pcs,
    required this.tax,
    required this.saleTaxAmount,
    required this.stockControl,
    required this.totalStock,
    required this.lowStock,
    required this.warehouse,
    required this.vendorName,
    required this.vendorInvoice,
    required this.vendorContactName,
    required this.vendorTax,
    required this.purchaseTaxAmount,
    required this.vendorImg,
    required this.vendorTotalAmount,
    required this.vendorTotalTaxAmount,
    required this.privateNote,
    required this.date, // Keeping date as string
    required this.productImg,
    required this.status,
    required this.lossOrGain,
    required this.vendorId,
    required this.hsnCode1,
    required this.vendorIGST,
    required this.vendorIGSTAmount,
    required this.vendorCGST,
    required this.vendorCGSTAmount,
    required this.vendorSGST,
    required this.vendorSGSTAmount,
    required this.serOrGoods,
    required this.itemMRP,
    required this.saleInclusiveOrExclusive,
    required this.purchaseInclusiveOrExclusive,
    required this.initialCost,
    required this.avgCost,
    required this.measurementsUnit,
    required this.saleInclusive,
    required this.purchaseInclusive,
    required this.barcodeId,
    required this.supplierName,
    required this.cessBasedOnQuantityOrValue,
    required this.cessRate,
    required this.categoryType,
    required this.categoryBrand,
    required this.categoryModelNo,
    required this.categoryColor,
    required this.categorySize,
    required this.categoryPartNumber,
    required this.categorySerialNumber,
    required this.aliasNameId,
    required this.initialQuantity,
    required this.pCategoryType,
    required this.brandType,
    required this.rePackingApplicable,
    required this.rePackingTo,
    required this.rePackingBalance,
    required this.bulkItemQuantity,
    required this.balanceRePackingItemUnit,
    required this.rePackingItemUnit,
    required this.rePackingItemOf,
    required this.saleAmountWithTaxAC,
    required this.printerName,
    required this.dineInACRate,
    required this.dineInNonACRate,
    required this.deliveryRate,
    required this.pickUpRate,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      changedQty: 0, // Default value
      price: json['saleamnt']?.toString() ?? '',
      id: json['Id']?.toString() ?? '',
      codeOrSKU: json['codeorSKU'] ?? '',
      category: json['category'] ?? '',
      productName: json['pdtname'] ?? '',
      hsnCode: json['HSNCode'] ?? '',
      description: json['description'] ?? '',
      purchaseAmount: json['puramnt']?.toString() ?? '',
      purchaseAmountWithTax: json['puramntwithtax']?.toString() ?? '',
      saleAmount: json['saleamnt']?.toString() ?? '',
      saleAmountWithTax: json['saleamntwithtax']?.toString() ?? '',
      profit: json['profit']?.toString() ?? '',
      pcs: json['pcs']?.toString() ?? '',
      tax: json['tax']?.toString() ?? '',
      saleTaxAmount: json['saletaxamnt']?.toString() ?? '',
      stockControl: json['stockcontrol'] ?? '',
      totalStock: json['totalstock']?.toString() ?? '',
      lowStock: json['lowstock']?.toString() ?? '',
      warehouse: json['warehouse'] ?? '',
      vendorName: json['vendername'] ?? '',
      vendorInvoice: json['venderinvoice'] ?? '',
      vendorContactName: json['vendercontactname'] ?? '',
      vendorTax: json['vendertax']?.toString() ?? '',
      purchaseTaxAmount: json['purtaxamnt']?.toString() ?? '',
      vendorImg: json['venderimg'] ?? '',
      vendorTotalAmount: json['vendertotalamnt']?.toString() ?? '',
      vendorTotalTaxAmount: json['vendertotaltaxamnt']?.toString() ?? '',
      privateNote: json['privatenote'] ?? '',
      date: json['Date']?.toString() ?? '', // Keeping as string
      productImg: json['productimg'] ?? '',
      status: json['status'] ?? '',
      lossOrGain: json['lossorgain'] ?? '',
      vendorId: json['vendorid'] ?? '',
      hsnCode1: json['hsncode1'] ?? '',
      vendorIGST: json['venIGST']?.toString() ?? '',
      vendorIGSTAmount: json['venIGSTamnt']?.toString() ?? '',
      vendorCGST: json['venCGST']?.toString() ?? '',
      vendorCGSTAmount: json['venCGSTamnt']?.toString() ?? '',
      vendorSGST: json['venSGST']?.toString() ?? '',
      vendorSGSTAmount: json['venSGSTamnt']?.toString() ?? '',
      serOrGoods: json['SERorGOODS'] ?? '',
      itemMRP: json['itemMRP']?.toString() ?? '',
      saleInclusiveOrExclusive: json['SaleincluORexclussive'] ?? '',
      purchaseInclusiveOrExclusive: json['PurchaseincluORexclussive'] ?? '',
      initialCost: json['InitialCost']?.toString() ?? '',
      avgCost: json['AvgCost']?.toString() ?? '',
      measurementsUnit: json['MessurmentsUnit'] ?? '',
      saleInclusive: json['SincluorExclu'] ?? '',
      purchaseInclusive: json['PincluorExclu'] ?? '',
      barcodeId: json['BarcodeID'] ?? '',
      supplierName: json['SupplierName'] ?? '',
      cessBasedOnQuantityOrValue: json['CessBasedonQntyorValue'] ?? '',
      cessRate: json['CessRate']?.toString() ?? '',
      categoryType: json['CatType'] ?? '',
      categoryBrand: json['CatBrand'] ?? '',
      categoryModelNo: json['CatModelNo'] ?? '',
      categoryColor: json['CatColor'] ?? '',
      categorySize: json['CatSize'] ?? '',
      categoryPartNumber: json['CatPartNumber'] ?? '',
      categorySerialNumber: json['CatSerialNumber'] ?? '',
      aliasNameId: json['AliasNameId'] ?? '',
      initialQuantity: json['InitialQuantity'] ?? '',
      pCategoryType: json['PCatType'] ?? '',
      brandType: json['BrandType'] ?? '',
      rePackingApplicable: json['RePackingApplicable'] ?? '',
      rePackingTo: json['RePackingTo'] ?? '',
      rePackingBalance: json['RePackingBalance'] ?? '',
      bulkItemQuantity: json['BulkItemQnty'] ?? '',
      balanceRePackingItemUnit: json['BalanceRePackingItemUnit'] ?? '',
      rePackingItemUnit: json['RePackingItemUnit'] ?? '',
      rePackingItemOf: json['RePackingItemof'] ?? '',
      saleAmountWithTaxAC: json['saleamntwithtaxAC']?.toString() ?? '',
      printerName: json['PrinterName'] ?? '',
      dineInACRate: json['DininACrate']?.toString() ?? '',
      dineInNonACRate: json['DininNonACrate']?.toString() ?? '',
      deliveryRate: json['Deliveryrate']?.toString() ?? '',
      pickUpRate: json['pickuprate']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'changedQty': changedQty,
      'price': price,
      'id': id,
      'codeOrSKU': codeOrSKU,
      'category': category,
      'productName': productName,
      'hsnCode': hsnCode,
      'description': description,
      'purchaseAmount': purchaseAmount,
      'purchaseAmountWithTax': purchaseAmountWithTax,
      'saleAmount': saleAmount,
      'saleAmountWithTax': saleAmountWithTax,
      'profit': profit,
      'pcs': pcs,
      'tax': tax,
      'saleTaxAmount': saleTaxAmount,
      'stockControl': stockControl,
      'totalStock': totalStock,
      'lowStock': lowStock,
      'warehouse': warehouse,
      'vendorName': vendorName,
      'vendorInvoice': vendorInvoice,
      'vendorContactName': vendorContactName,
      'vendorTax': vendorTax,
      'purchaseTaxAmount': purchaseTaxAmount,
      'vendorImg': vendorImg,
      'vendorTotalAmount': vendorTotalAmount,
      'vendorTotalTaxAmount': vendorTotalTaxAmount,
      'privateNote': privateNote,
      'date': date,
      'productImg': productImg,
      'status': status,
      'lossOrGain': lossOrGain,
      'vendorId': vendorId,
      'hsnCode1': hsnCode1,
      'vendorIGST': vendorIGST,
      'vendorIGSTAmount': vendorIGSTAmount,
      'vendorCGST': vendorCGST,
      'vendorCGSTAmount': vendorCGSTAmount,
      'vendorSGST': vendorSGST,
      'vendorSGSTAmount': vendorSGSTAmount,
      'serOrGoods': serOrGoods,
      'itemMRP': itemMRP,
      'saleInclusiveOrExclusive': saleInclusiveOrExclusive,
      'purchaseInclusiveOrExclusive': purchaseInclusiveOrExclusive,
      'initialCost': initialCost,
      'avgCost': avgCost,
      'measurementsUnit': measurementsUnit,
      'saleInclusive': saleInclusive,
      'purchaseInclusive': purchaseInclusive,
      'barcodeId': barcodeId,
      'supplierName': supplierName,
      'cessBasedOnQuantityOrValue': cessBasedOnQuantityOrValue,
      'cessRate': cessRate,
      'categoryType': categoryType,
      'categoryBrand': categoryBrand,
      'categoryModelNo': categoryModelNo,
      'categoryColor': categoryColor,
      'categorySize': categorySize,
      'categoryPartNumber': categoryPartNumber,
      'categorySerialNumber': categorySerialNumber,
      'aliasNameId': aliasNameId,
      'initialQuantity': initialQuantity,
      'pCategoryType': pCategoryType,
      'brandType': brandType,
      'rePackingApplicable': rePackingApplicable,
      'rePackingTo': rePackingTo,
      'rePackingBalance': rePackingBalance,
      'bulkItemQuantity': bulkItemQuantity,
      'balanceRePackingItemUnit': balanceRePackingItemUnit,
      'rePackingItemUnit': rePackingItemUnit,
      'rePackingItemOf': rePackingItemOf,
      'saleAmountWithTaxAC': saleAmountWithTaxAC,
      'printerName': printerName,
      'dineInACRate': dineInACRate,
      'dineInNonACRate': dineInNonACRate,
      'deliveryRate': deliveryRate,
      'pickUpRate': pickUpRate,
    };
  }

  Product copyWith({
    int? changedQty,
    String? price,
    String? id,
    String? codeOrSKU,
    String? category,
    String? productName,
    String? hsnCode,
    String? description,
    String? purchaseAmount,
    String? purchaseAmountWithTax,
    String? saleAmount,
    String? saleAmountWithTax,
    String? profit,
    String? pcs,
    String? tax,
    String? saleTaxAmount,
    String? stockControl,
    String? totalStock,
    String? lowStock,
    String? warehouse,
    String? vendorName,
    String? vendorInvoice,
    String? vendorContactName,
    String? vendorTax,
    String? purchaseTaxAmount,
    String? vendorImg,
    String? vendorTotalAmount,
    String? vendorTotalTaxAmount,
    String? privateNote,
    String? date,
    String? productImg,
    String? status,
    String? lossOrGain,
    String? vendorId,
    String? hsnCode1,
    String? vendorIGST,
    String? vendorIGSTAmount,
    String? vendorCGST,
    String? vendorCGSTAmount,
    String? vendorSGST,
    String? vendorSGSTAmount,
    String? serOrGoods,
    String? itemMRP,
    String? saleInclusiveOrExclusive,
    String? purchaseInclusiveOrExclusive,
    String? initialCost,
    String? avgCost,
    String? measurementsUnit,
    String? saleInclusive,
    String? purchaseInclusive,
    String? barcodeId,
    String? supplierName,
    String? cessBasedOnQuantityOrValue,
    String? cessRate,
    String? categoryType,
    String? categoryBrand,
    String? categoryModelNo,
    String? categoryColor,
    String? categorySize,
    String? categoryPartNumber,
    String? categorySerialNumber,
    String? aliasNameId,
    String? initialQuantity,
    String? pCategoryType,
    String? brandType,
    String? rePackingApplicable,
    String? rePackingTo,
    String? rePackingBalance,
    String? bulkItemQuantity,
    String? balanceRePackingItemUnit,
    String? rePackingItemUnit,
    String? rePackingItemOf,
    String? saleAmountWithTaxAC,
    String? printerName,
    String? dineInACRate,
    String? dineInNonACRate,
    String? deliveryRate,
    String? pickUpRate,
  }) {
    return Product(
      id: id ?? this.id,
      changedQty: changedQty ?? this.changedQty,
      price: price ?? this.price,
      codeOrSKU: codeOrSKU ?? this.codeOrSKU,
      category: category ?? this.category,
      productName: productName ?? this.productName,
      hsnCode: hsnCode ?? this.hsnCode,
      description: description ?? this.description,
      purchaseAmount: purchaseAmount ?? this.purchaseAmount,
      purchaseAmountWithTax:
          purchaseAmountWithTax ?? this.purchaseAmountWithTax,
      saleAmount: saleAmount ?? this.saleAmount,
      saleAmountWithTax: saleAmountWithTax ?? this.saleAmountWithTax,
      profit: profit ?? this.profit,
      pcs: pcs ?? this.pcs,
      tax: tax ?? this.tax,
      saleTaxAmount: saleTaxAmount ?? this.saleTaxAmount,
      stockControl: stockControl ?? this.stockControl,
      totalStock: totalStock ?? this.totalStock,
      lowStock: lowStock ?? this.lowStock,
      warehouse: warehouse ?? this.warehouse,
      vendorName: vendorName ?? this.vendorName,
      vendorInvoice: vendorInvoice ?? this.vendorInvoice,
      vendorContactName: vendorContactName ?? this.vendorContactName,
      vendorTax: vendorTax ?? this.vendorTax,
      purchaseTaxAmount: purchaseTaxAmount ?? this.purchaseTaxAmount,
      vendorImg: vendorImg ?? this.vendorImg,
      vendorTotalAmount: vendorTotalAmount ?? this.vendorTotalAmount,
      vendorTotalTaxAmount: vendorTotalTaxAmount ?? this.vendorTotalTaxAmount,
      privateNote: privateNote ?? this.privateNote,
      date: date ?? this.date,
      productImg: productImg ?? this.productImg,
      status: status ?? this.status,
      lossOrGain: lossOrGain ?? this.lossOrGain,
      vendorId: vendorId ?? this.vendorId,
      hsnCode1: hsnCode1 ?? this.hsnCode1,
      vendorIGST: vendorIGST ?? this.vendorIGST,
      vendorIGSTAmount: vendorIGSTAmount ?? this.vendorIGSTAmount,
      vendorCGST: vendorCGST ?? this.vendorCGST,
      vendorCGSTAmount: vendorCGSTAmount ?? this.vendorCGSTAmount,
      vendorSGST: vendorSGST ?? this.vendorSGST,
      vendorSGSTAmount: vendorSGSTAmount ?? this.vendorSGSTAmount,
      serOrGoods: serOrGoods ?? this.serOrGoods,
      itemMRP: itemMRP ?? this.itemMRP,
      saleInclusiveOrExclusive:
          saleInclusiveOrExclusive ?? this.saleInclusiveOrExclusive,
      purchaseInclusiveOrExclusive:
          purchaseInclusiveOrExclusive ?? this.purchaseInclusiveOrExclusive,
      initialCost: initialCost ?? this.initialCost,
      avgCost: avgCost ?? this.avgCost,
      measurementsUnit: measurementsUnit ?? this.measurementsUnit,
      saleInclusive: saleInclusive ?? this.saleInclusive,
      purchaseInclusive: purchaseInclusive ?? this.purchaseInclusive,
      barcodeId: barcodeId ?? this.barcodeId,
      supplierName: supplierName ?? this.supplierName,
      cessBasedOnQuantityOrValue:
          cessBasedOnQuantityOrValue ?? this.cessBasedOnQuantityOrValue,
      cessRate: cessRate ?? this.cessRate,
      categoryType: categoryType ?? this.categoryType,
      categoryBrand: categoryBrand ?? this.categoryBrand,
      categoryModelNo: categoryModelNo ?? this.categoryModelNo,
      categoryColor: categoryColor ?? this.categoryColor,
      categorySize: categorySize ?? this.categorySize,
      categoryPartNumber: categoryPartNumber ?? this.categoryPartNumber,
      categorySerialNumber: categorySerialNumber ?? this.categorySerialNumber,
      aliasNameId: aliasNameId ?? this.aliasNameId,
      initialQuantity: initialQuantity ?? this.initialQuantity,
      pCategoryType: pCategoryType ?? this.pCategoryType,
      brandType: brandType ?? this.brandType,
      rePackingApplicable: rePackingApplicable ?? this.rePackingApplicable,
      rePackingTo: rePackingTo ?? this.rePackingTo,
      rePackingBalance: rePackingBalance ?? this.rePackingBalance,
      bulkItemQuantity: bulkItemQuantity ?? this.bulkItemQuantity,
      balanceRePackingItemUnit:
          balanceRePackingItemUnit ?? this.balanceRePackingItemUnit,
      rePackingItemUnit: rePackingItemUnit ?? this.rePackingItemUnit,
      rePackingItemOf: rePackingItemOf ?? this.rePackingItemOf,
      saleAmountWithTaxAC: saleAmountWithTaxAC ?? this.saleAmountWithTaxAC,
      printerName: printerName ?? this.printerName,
      dineInACRate: dineInACRate ?? this.dineInACRate,
      dineInNonACRate: dineInNonACRate ?? this.dineInNonACRate,
      deliveryRate: deliveryRate ?? this.deliveryRate,
      pickUpRate: pickUpRate ?? this.pickUpRate,
    );
  }
}
