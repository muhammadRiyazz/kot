import 'package:flutter_esc_pos_utils/flutter_esc_pos_utils.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_kot/domain/cus/customer_model.dart';
import 'package:restaurant_kot/domain/item/kot_item_model.dart';

Future<List<int>> billPrintData({
  required List<kotItem> items,
  required String tableNo,
  required String invoiceNo,
  required String orderNo,
  required double taxable,
  required double netAmount,
  required double tax,
  required double cess,
  required String mergedorNot,
  String? mergedOrders,
  String? mergedTables,
}) async {
  final cGst = tax / 2;
  final sGst = tax / 2;

  final profile = await CapabilityProfile.load();
  final generator = Generator(PaperSize.mm80, profile);
  List<int> bytes = [];

// Header with increased font size
  bytes += generator.text(
    infoCustomer!.cmpname,
    styles: const PosStyles(
      align: PosAlign.center,
      bold: true,
      height: PosTextSize.size2, // Increase font height
      width: PosTextSize.size2, // Increase font width
    ),
  );

  bytes += generator.text(
    infoCustomer!.cmpadd,
    styles: const PosStyles(
      align: PosAlign.center,
      bold: false,
      height: PosTextSize.size1, // Default font size
      width: PosTextSize.size1, // Default font size
    ),
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
      text: 'Order No',
      width: 4,
      styles: const PosStyles(bold: true),
    ),
    PosColumn(
      text: mergedorNot == 'Merged' ? '$orderNo,$mergedOrders' : orderNo,
      width: 8,
      styles: const PosStyles(align: PosAlign.right, bold: true),
    ),
  ]);
  bytes += generator.row([
    PosColumn(
      text: 'Table',
      width: 4,
      styles: const PosStyles(bold: true),
    ),
    PosColumn(
      text: mergedorNot == 'Merged' ? '$tableNo,$mergedTables' : tableNo,
      width: 8,
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
      text: usernameA ?? '--',
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
      text: 'Rate',
      width: 2,
      styles: const PosStyles(bold: true, align: PosAlign.right),
    ),
    PosColumn(
      text: 'Qty',
      width: 2,
      styles: const PosStyles(bold: true, align: PosAlign.right),
    ),
    PosColumn(
      text: 'Amount',
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
        text: item.basicRate.toString(),
        width: 2,
        styles: const PosStyles(align: PosAlign.right),
      ),
      PosColumn(
        text: item.qty.toString(),
        width: 2,
        styles: const PosStyles(align: PosAlign.right),
      ),
      PosColumn(
        text: (item.qty * item.basicRate).toStringAsFixed(2),
        width: 2,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);
  }
  bytes += generator.hr(len: 48);
  bytes += generator.feed(1);

  tax < 1
      ? null
      : bytes += generator.row([
          PosColumn(
            text: 'Taxable Amount',
            width: 8,
            styles: const PosStyles(align: PosAlign.left, bold: true),
          ),
          PosColumn(
            text: taxable.toStringAsFixed(2),
            width: 4,
            styles: const PosStyles(align: PosAlign.right, bold: true),
          ),
        ]);
  bytes += generator.row([
    PosColumn(
      text: 'Discount',
      width: 8,
      styles: const PosStyles(align: PosAlign.left, bold: true),
    ),
    PosColumn(
      text: '0.00',
      width: 4,
      styles: const PosStyles(align: PosAlign.right, bold: true),
    ),
  ]);
  tax < 1
      ? null
      : bytes += generator.row([
          PosColumn(
            text: 'CGST',
            width: 8,
            styles: const PosStyles(align: PosAlign.left, bold: true),
          ),
          PosColumn(
            text: cGst.toStringAsFixed(2),
            width: 4,
            styles: const PosStyles(align: PosAlign.right, bold: true),
          ),
        ]);
  tax < 1
      ? null
      : bytes += generator.row([
          PosColumn(
            text: 'SGST',
            width: 8,
            styles: const PosStyles(align: PosAlign.left, bold: true),
          ),
          PosColumn(
            text: sGst.toStringAsFixed(2),
            width: 4,
            styles: const PosStyles(align: PosAlign.right, bold: true),
          ),
        ]);
  tax < 1
      ? null
      : bytes += generator.row([
          PosColumn(
            text: 'Cess',
            width: 8,
            styles: const PosStyles(align: PosAlign.left, bold: true),
          ),
          PosColumn(
            text: cess.toStringAsFixed(2),
            width: 4,
            styles: const PosStyles(align: PosAlign.right, bold: true),
          ),
        ]);
  bytes += generator.hr(len: 48);

  bytes += generator.row([
    PosColumn(
      text: 'Net Amount',
      width: 8,
      styles: const PosStyles(
        bold: true,
        align: PosAlign.left,
        height: PosTextSize.size2, // Double height
        width: PosTextSize.size2, // Double width
      ),
    ),
    PosColumn(
      text: netAmount.toStringAsFixed(2),
      width: 4,
      styles: const PosStyles(
        bold: true,
        align: PosAlign.right,
        height: PosTextSize.size2, // Double height
        width: PosTextSize.size2, // Double width
      ),
    ),
  ]);
  // final sanitizedInvoiceNo = invoiceNo.replaceAll(
  //     RegExp(r'[^A-Za-z0-9]'), ''); // Removes unsupported characters

// Convert sanitized invoiceNo to ASCII codes
  // final invoiceNoList = sanitizedInvoiceNo.codeUnits;

// bytes += generator.barcode(
//   Barcode.code128(invoiceNoList), // Convert to ASCII values
//   width: BarcodeWidth.medium, // Adjust width as needed
//   height: 50, // Adjust height as needed
//   align: PosAlign.center, // Center the barcode
// );

// Optional: Add some text below the barcode
  // bytes += generator.text(
  //   'Invoice No: $invoiceNo',
  //   styles: const PosStyles(align: PosAlign.center, bold: true),
  // );
  bytes += generator.hr(len: 48);

  // Footer

  bytes += generator.text(
    infoCustomer!.billFooterText,
    styles: const PosStyles(align: PosAlign.center),
  );
  bytes += generator.text(
    'Thank You! Visit Again!',
    styles: const PosStyles(align: PosAlign.center, bold: true),
  );

  // Feed and cut
  bytes += generator.feed(2);
  bytes += generator.cut();

  return bytes;
}
