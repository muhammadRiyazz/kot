class Product {
     int changedQty; // Change to final for immutability

  final String id;
  final String codeOrSKU;
  final String category;
  final String productName;
  final String hsnCode;
  final String description;
  final String purchaseAmount;
  final String purchaseAmountWithTax;
  final String saleAmount;
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
        required this.changedQty,

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
    return Product(changedQty: 0,
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
      aliasNameId: json['AliasNameID'] ?? '',
      initialQuantity: json['InitialQuantity']?.toString() ?? '',
      pCategoryType: json['PCatType'] ?? '',
      brandType: json['BrandType'] ?? '',
      rePackingApplicable: json['RePackingApplicable'] ?? '',
      rePackingTo: json['RePackingTo']?.toString() ?? '',
      rePackingBalance: json['RePackingBalance']?.toString() ?? '',
      bulkItemQuantity: json['BulkItemQuantity']?.toString() ?? '',
      balanceRePackingItemUnit: json['BalanceRePackingItemUnit']?.toString() ?? '',
      rePackingItemUnit: json['RePackingItemUnit']?.toString() ?? '',
      rePackingItemOf: json['RePackingItemOf']?.toString() ?? '',
      saleAmountWithTaxAC: json['SaleAMountWithTaxAC']?.toString() ?? '',
      printerName: json['PrinterName'] ?? '',
      dineInACRate: json['DineinACRate']?.toString() ?? '',
      dineInNonACRate: json['DineinNonACRate']?.toString() ?? '',
      deliveryRate: json['DeliveryRate']?.toString() ?? '',
      pickUpRate: json['PickUpRate']?.toString() ?? '',
    );
  }
}
