import 'package:flutter_esc_pos_utils/flutter_esc_pos_utils.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_kot/domain/cus/customer_model.dart';
import 'package:restaurant_kot/domain/item/kot_item_model.dart';

Future<List<int>> kotPrintData({
  required List<kotItem> items,
  required String tableNo,
  required String orderNo,
  required String kotNo,
  required String user,
  required String note
}) async {
  final profile = await CapabilityProfile.load();
  final generator = Generator(PaperSize.mm80, profile);
  List<int> bytes = [];

  // Header
  bytes += generator.text(
    'KOT',
    styles: const PosStyles(
      align: PosAlign.center,
      width: PosTextSize.size2,
      height: PosTextSize.size2,
      bold: true,
    ),
  );
  bytes += generator.text(
    '- D I N I N G -',
    styles: const PosStyles(
      align: PosAlign.center,
      bold: true,
    ),
  );

  bytes += generator.hr(len: 48); // Full width horizontal rule

  // Date and Time
  bytes += generator.row([
    PosColumn(
      text: DateFormat('dd/MM/yyyy').format(DateTime.now()),
      width: 6,
      styles: const PosStyles(bold: true),
    ),
    PosColumn(
      text: DateFormat('hh:mm a').format(DateTime.now()),
      width: 6,
      styles: const PosStyles(bold: true, align: PosAlign.right),
    ),
  ]);
  bytes += generator.hr(len: 48);

  // Order Info
  bytes += generator.row([
    PosColumn(
      text: 'Order No',
      width: 6,
      styles: const PosStyles(bold: true),
    ),
    PosColumn(
      text: orderNo,
      width: 6,
      styles: const PosStyles(bold: true, align: PosAlign.right),
    ),
  ]);
  bytes += generator.row([
    PosColumn(
      text: 'KOT',
      width: 6,
      styles: const PosStyles(bold: true),
    ),
    PosColumn(
      text: kotNo == '--' ? 'Cancel KOT' : kotNo,
      width: 6,
      styles: const PosStyles(bold: true, align: PosAlign.right),
    ),
  ]);
  bytes += generator.row([
    PosColumn(
      text: 'Waiter',
      width: 6,
      styles: const PosStyles(bold: true),
    ),
    PosColumn(
      text: usernameA??'',
      width: 6,
      styles: const PosStyles(bold: true, align: PosAlign.right),
    ),
  ]);
  bytes += generator.row([
    PosColumn(
      text: 'Table',
      width: 6,
      styles: const PosStyles(bold: true),
    ),
    PosColumn(
      text: tableNo,
      width: 6,
      styles: const PosStyles(bold: true, align: PosAlign.right),
    ),
  ]);
  bytes += generator.hr(len: 48);

  // Item Header
  bytes += generator.row([
    PosColumn(
      text: 'Item Name',
      width: 8,
      styles: const PosStyles(bold: true),
    ),
    PosColumn(
      text: 'Qty',
      width: 4,
      styles: const PosStyles(bold: true, align: PosAlign.right),
    ),
  ]);
  bytes += generator.hr(len: 48);

  // Item List
  for (var item in items) {
    // First row: Item name and quantity
    bytes += generator.row([
      PosColumn(
        text:
            kotNo == '--' ? '${item.itemName} - ${item.kotno}' : item.itemName,
        width: 8,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: item.quantity == 0 ? 'Cancel' : item.quantity.toString(),
        width: 4,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);
  }

  bytes += generator.hr(len: 48);

    note==''?null:bytes += generator.text(
    note,
    styles: const PosStyles(
      align: PosAlign.center,
      bold: false,
    ),
  );

 note==''?null: bytes += generator.hr(len: 48);

  // Footer Note
  bytes += generator.text(
    'As per experts in food hygiene and safety,',
    styles: const PosStyles(
      align: PosAlign.center,
      bold: true,
    ),
  );
  bytes += generator.text(
    'consume food products within 2 hours of purchase.',
    styles: const PosStyles(
      align: PosAlign.center,
      bold: true,
    ),
  );

  // Feed and cut
  bytes += generator.feed(2);
  bytes += generator.cut();

  return bytes;
}
