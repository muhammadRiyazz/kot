class KitchenItem {
  final String serOrGoods;
  final String kitchenName; // Name of the kitchen
  final String itemName; // Name of the item
  final String itemCode; // Code for the item
  int quantity; // Quantity of the item
  final int qty; // Quantity of the item
  final String stock; // Quantity of the item

  final String basicRate; // Basic rate of the item
  final String unitTaxableAmountBeforeDiscount; // Taxable amount before discount
  final String unitTaxableAmount; // Taxable amount after discount
  final String totalTaxableAmount; // Total taxable amount
  final String gstPer; // GST percentage
  final String cessPer; // Cess percentage
  final String totalTaxAmount; // Total tax amount
  final String totalCessAmount; // Total cess amount
  final String totalAmount; // Total amount after all calculations

  final String dininACrate; // Rate for Dining with AC
  final String dininNonACrate; // Rate for Dining without AC

  // Constructor
  KitchenItem({
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
    required this.totalTaxableAmount,
    required this.gstPer,
    required this.cessPer,
    required this.totalTaxAmount,
    required this.totalCessAmount,
    required this.totalAmount,
    required this.dininACrate, // Add to constructor
    required this.dininNonACrate, // Add to constructor
  });

  // CopyWith method
  KitchenItem copyWith({
    String? serOrGoods,
    String? kitchenName,
    String? itemName,
    String? itemCode,
    int? quantity,
    int? qty,
    String? stock,
    String? basicRate,
    String? unitTaxableAmountBeforeDiscount,
    String? unitTaxableAmount,
    String? totalTaxableAmount,
    String? gstPer,
    String? cessPer,
    String? totalTaxAmount,
    String? totalCessAmount,
    String? totalAmount,
    String? dininACrate, // Add to copyWith method
    String? dininNonACrate, // Add to copyWith method
  }) {
    return KitchenItem(
      stock: stock ?? this.stock,
      qty: qty ?? this.qty,
      serOrGoods: serOrGoods ?? this.serOrGoods,
      kitchenName: kitchenName ?? this.kitchenName,
      itemName: itemName ?? this.itemName,
      itemCode: itemCode ?? this.itemCode,
      quantity: quantity ?? this.quantity,
      basicRate: basicRate ?? this.basicRate,
      unitTaxableAmountBeforeDiscount:
          unitTaxableAmountBeforeDiscount ?? this.unitTaxableAmountBeforeDiscount,
      unitTaxableAmount: unitTaxableAmount ?? this.unitTaxableAmount,
      totalTaxableAmount: totalTaxableAmount ?? this.totalTaxableAmount,
      gstPer: gstPer ?? this.gstPer,
      cessPer: cessPer ?? this.cessPer,
      totalTaxAmount: totalTaxAmount ?? this.totalTaxAmount,
      totalCessAmount: totalCessAmount ?? this.totalCessAmount,
      totalAmount: totalAmount ?? this.totalAmount,
      dininACrate: dininACrate ?? this.dininACrate, // Use new field
      dininNonACrate: dininNonACrate ?? this.dininNonACrate, // Use new field
    );
  }
}
