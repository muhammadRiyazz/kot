class KitchenItem {
  final String kitchenName; // Name of the kitchen
  final String itemName; // Name of the item
  final String itemCode; // Code for the item
  final int quantity; // Quantity of the item
  final double basicRate; // Basic rate of the item
  final double
      unitTaxableAmountBeforeDiscount; // Taxable amount before discount
  final double unitTaxableAmount; // Taxable amount after discount
  final double totalTaxableAmount; // Total taxable amount
  final double gstPer; // GST percentage
  final double cessPer; // Cess percentage
  final double totalTaxAmount; // Total tax amount
  final double totalCessAmount; // Total cess amount
  final double totalAmount; // Total amount after all calculations

  // Constructor
  KitchenItem({
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
  });
}
