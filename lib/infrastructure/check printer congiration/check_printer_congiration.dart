import 'dart:developer';

import 'package:restaurant_kot/domain/item/kot_item_model.dart';
import 'package:restaurant_kot/domain/printer/priter_config.dart';

bool checkPrinters({
  required List<PrinterConfig> printers,
  required List<kotItem> kotItems,
  required List<kotItem> cancelKotItems,
}) {
  log('checkPrinters --');

  // Combine kotItems and cancelKotItems into one list
  List<kotItem> mergedList = [...kotItems, ...cancelKotItems];

  // Extract unique kitchenNames from kotItems
  List<String> selectedKitchens =
      mergedList.map((item) => item.kitchenName).toSet().toList();

  // Check if all selected kitchens have corresponding printers
  for (var kitchen in selectedKitchens) {
    bool printerFound =
        printers.any((printer) => printer.kitchenName == kitchen);
    if (!printerFound) {
      return false;
      // If any kitchen doesn't have a printer, return false
    }
  }

  return true; // All kitchens have printers
}
