class kotItem {
  final String serOrGoods;
  String kitchenName;
  final String itemName;
    final String parcelOrnot;
  String productImg;


  final String itemCode;
  int quantity; // Quantity for the item
  int qty; // Quantity for the item
  final int stock; // Stock of the item
  final String kotno; // Kot number for the item
  final double basicRate; // Basic rate of the item
  final double
      unitTaxableAmountBeforeDiscount; // Taxable amount before discount
  final double unitTaxableAmount; // Taxable amount after discount
  final double gstPer; // GST percentage
  final double cessPer; // Cess percentage

   final double cessAmt;
  final double gstAmt;

  kotItem({
    required this.productImg,
   required this.gstAmt,
   required this.cessAmt,
    required this.kotno,
    required this.stock,
    required this.qty,
    required this.serOrGoods,
    required this.kitchenName,
    required this.itemName,
    required this.itemCode,
    required this.quantity,
    required this.basicRate,
    required this.unitTaxableAmountBeforeDiscount,
    required this.unitTaxableAmount,
    required this.gstPer,
    required this.cessPer,
        required this.parcelOrnot,

  });

  // CopyWith method to create a modified copy of kotItem
  kotItem copyWith({
        String? kotno,

    String? parcelOrnot,
    String? serOrGoods,
    String? kitchenName,
    String? itemName,
    String? itemCode,
    int? quantity,
    int? qty,
    int? stock,
    double? basicRate,
    double? unitTaxableAmountBeforeDiscount,
    double? unitTaxableAmount,
    double? gstPer,
    double? gstAmt,
    double? cessAmt,
    double? cessPer,
  }) {
    return kotItem(
      productImg: productImg,
      parcelOrnot:parcelOrnot ?? this.parcelOrnot ,
      cessAmt: cessAmt ?? this.cessAmt,
      gstAmt: gstAmt ?? this.gstAmt,
      kotno: kotno ?? this.kotno,
      stock: stock ?? this.stock,
      qty: qty ?? this.qty,
      serOrGoods: serOrGoods ?? this.serOrGoods,
      kitchenName: kitchenName ?? this.kitchenName,
      itemName: itemName ?? this.itemName,
      itemCode: itemCode ?? this.itemCode,
      quantity: quantity ?? this.quantity,
      basicRate: basicRate ?? this.basicRate,
      unitTaxableAmountBeforeDiscount: unitTaxableAmountBeforeDiscount ??
          this.unitTaxableAmountBeforeDiscount,
      unitTaxableAmount: unitTaxableAmount ?? this.unitTaxableAmount,
      gstPer: gstPer ?? this.gstPer,
      cessPer: cessPer ?? this.cessPer,
    );
  }
}

class KotDataModel {
  final kotItem itemslist;
  final TableInfo table;

  KotDataModel({
    required this.itemslist,
    required this.table,
  });
}

class TableInfo {
  final String tableName;
  final String floor;
  final String acOrNonAc;

  TableInfo({
    required this.tableName,
    required this.floor,
    required this.acOrNonAc,
  });

  factory TableInfo.fromJson(Map<String, dynamic> json) {
    return TableInfo(
      tableName: json['TableNumber'] as String,
      floor: json['FloorMumber'] as String,
      acOrNonAc: json['TableType'] as String,
    );
  }

  TableInfo copyWith({
    String? tableName,
    String? floor,
    String? acOrNonAc,
  }) {
    return TableInfo(
      tableName: tableName ?? this.tableName,
      floor: floor ?? this.floor,
      acOrNonAc: acOrNonAc ?? this.acOrNonAc,
    );
  }
}
