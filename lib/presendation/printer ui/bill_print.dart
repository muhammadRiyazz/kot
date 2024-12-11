import 'package:flutter_esc_pos_utils/flutter_esc_pos_utils.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_kot/domain/cus/customer_model.dart';
import 'package:restaurant_kot/domain/item/kot_item_model.dart';

Future<List<int>> billPrintData({
  required List<kotItem> items,
  required String tableNo,
  required String invoiceNo,
}) async {
  final profile = await CapabilityProfile.load();
  final generator = Generator(PaperSize.mm80, profile);
  List<int> bytes = [];

  // Header
  bytes += generator.text(
    infoCustomer!.cmpname,
    styles: const PosStyles(align: PosAlign.center, bold: true),
  );
 
  bytes += generator.text(
    infoCustomer!.cmpadd,
    styles: const PosStyles(align: PosAlign.center, bold: false),
  );
 
  bytes += generator.text(
infoCustomer!.companyContactNo,
    styles: const PosStyles(align: PosAlign.center),
  );
  bytes += generator.text(
   infoCustomer!.cmpgstno,
    styles: const PosStyles(align: PosAlign.center, bold: true),
  );
  bytes += generator.hr(len: 48);

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

  // Invoice Details
  bytes += generator.row([
    PosColumn(
      text: 'Invoice No',
      width: 6,
      styles: const PosStyles(bold: true),
    ),
    PosColumn(
      text: invoiceNo,
      width: 6,
      styles: const PosStyles(align: PosAlign.right, bold: true),
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
      styles: const PosStyles(align: PosAlign.right, bold: true),
    ),
  ]);
  bytes += generator.row([
    PosColumn(
      text: 'Waiter',
      width: 6,
      styles: const PosStyles(bold: true),
    ),
    PosColumn(
      text: usernameA??'--',
      width: 6,
      styles: const PosStyles(align: PosAlign.right, bold: true),
    ),
  ]);
  bytes += generator.hr(len: 48);

  // Items Header
  bytes += generator.row([
    PosColumn(
      text: 'Item Name',
      width: 6,
      styles: const PosStyles(bold: true),
    ),
    PosColumn(
      text: 'Qty',
      width: 2,
      styles: const PosStyles(bold: true, align: PosAlign.right),
    ),
    PosColumn(
      text: 'Rate',
      width: 2,
      styles: const PosStyles(bold: true, align: PosAlign.right),
    ),
    PosColumn(
      text: 'Total',
      width: 2,
      styles: const PosStyles(bold: true, align: PosAlign.right),
    ),
  ]);
  bytes += generator.hr(len: 48);

  // Items List
  for (var item in items) {
    bytes += generator.row([
      PosColumn(
        text: item.itemName,
        width: 6,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: item.qty.toString(),
        width: 2,
        styles: const PosStyles(align: PosAlign.right),
      ),
      PosColumn(
        text: item.basicRate.toStringAsFixed(2),
        width: 2,
        styles: const PosStyles(align: PosAlign.right),
      ),
      PosColumn(
        text: (item.quantity * item.basicRate).toStringAsFixed(2),
        width: 2,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);
  }
  bytes += generator.hr(len: 48);

  // Summary
  double taxableAmount = items.fold(
      0.0, (sum, item) => sum + (item.quantity * item.basicRate));
  double cgst = taxableAmount * 0.025;
  double sgst = taxableAmount * 0.025;

  bytes += generator.row([
    PosColumn(
      text: 'Taxable Amount',
      width: 8,
      styles: const PosStyles(align: PosAlign.left),
    ),
    PosColumn(
      text: taxableAmount.toStringAsFixed(2),
      width: 4,
      styles: const PosStyles(align: PosAlign.right),
    ),
  ]);
  bytes += generator.row([
    PosColumn(
      text: 'CGST (2.5%)',
      width: 8,
      styles: const PosStyles(align: PosAlign.left),
    ),
    PosColumn(
      text: cgst.toStringAsFixed(2),
      width: 4,
      styles: const PosStyles(align: PosAlign.right),
    ),
  ]);
  bytes += generator.row([
    PosColumn(
      text: 'SGST (2.5%)',
      width: 8,
      styles: const PosStyles(align: PosAlign.left),
    ),
    PosColumn(
      text: sgst.toStringAsFixed(2),
      width: 4,
      styles: const PosStyles(align: PosAlign.right),
    ),
  ]);
  bytes += generator.hr(len: 48);

  bytes += generator.row([
    PosColumn(
      text: 'Net Amount',
      width: 8,
      styles: const PosStyles(bold: true, align: PosAlign.left),
    ),
    PosColumn(
      text: (taxableAmount + cgst + sgst).toStringAsFixed(2),
      width: 4,
      styles: const PosStyles(bold: true, align: PosAlign.right),
    ),
  ]);
  bytes += generator.hr(len: 48);

  // Footer
  bytes += generator.text(
    'Thank You! Visit Again!',
    styles: const PosStyles(align: PosAlign.center, bold: true),
  );
  bytes += generator.text(
    'Consume food within 2 hours of purchase.',
    styles: const PosStyles(align: PosAlign.center),
  );

  // Feed and cut
  bytes += generator.feed(2);
  bytes += generator.cut();

  return bytes;
}
