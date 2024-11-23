class kotItem {
  final String serOrGoods;
  String kitchenName; // Name of the kitchen
  final String itemName; // Name of the item
  final String itemCode; // Code for the item
  int quantity; // Quantity of the item
  final int qty; // Quantity of the item
  final int stock; // Quantity of the item
   final String kotno; // Name of the kitchen

  final double basicRate; // Basic rate of the item
  final double
      unitTaxableAmountBeforeDiscount; // Taxable amount before discount
  final double unitTaxableAmount; // Taxable amount after discount
  final double gstPer; // GST percentage
  final double cessPer; // Cess percentage

  // final double dininACrate; // Rate for Dining with AC
  // final double dininNonACrate; // Rate for Dining without AC

  // Constructor
  kotItem({
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

    // required this.dininACrate, // Add to constructor
    // required this.dininNonACrate, // Add to constructor
  });

  // CopyWith method
  kotItem copyWith({
        String? kotno,

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
    double? cessPer,

    // double? dininACrate, // Add to copyWith method
    // double? dininNonACrate, // Add to copyWith method
  }) {
    return kotItem(
      kotno: kotno ??this.kotno,
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
      // dininACrate: dininACrate ?? this.dininACrate, // Use new field
      // dininNonACrate: dininNonACrate ?? this.dininNonACrate, // Use new field
    );
  }
}

class TableInfo {
  final String tableName; // Name of the table
  final String floor; // Floor where the table is located
  final String acOrNonAc; // Whether the table is AC or Non-AC

  // Constructor
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
  // CopyWith method for TableInfo
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

class KotDataModel {
  final kotItem itemslist; 
  final TableInfo table; 


  KotDataModel({
    required this.itemslist,
    required this.table,

    // required this.dininACrate, // Add to constructor
    // required this.dininNonACrate, // Add to constructor
  });
}
