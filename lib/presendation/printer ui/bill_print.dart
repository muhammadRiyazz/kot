import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'package:flutter_esc_pos_utils/flutter_esc_pos_utils.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_kot/domain/cus/customer_model.dart';
import 'package:restaurant_kot/domain/item/kot_item_model.dart';
import 'package:restaurant_kot/infrastructure/initalfetchdata/bill_design_mng.dart';
import 'package:restaurant_kot/infrastructure/initalfetchdata/sound_printer.dart';
import 'package:restaurant_kot/infrastructure/initalfetchdata/taxtype.dart';

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
  required String cutumer,
  String? mergedOrders,
  String? mergedTables,
}) async {
  final cGst = tax / 2;
  final sGst = tax / 2;

  final profile = await CapabilityProfile.load();
  final generator = Generator(PaperSize.mm80, profile);
  List<int> bytes = [];
 if (isSoundEnabled! && soundOption != 'After Printing') {
      bytes += generator.beep(
        n: 4,
        duration: PosBeepDuration.beep50ms,
      );
    }
  if (addLogo != null) {
    if (addLogo == true) {
      // Add the restaurant logo
      final logoImage = await _getNetworkImage();
      if (logoImage != null) {
        // Resize the image to the full width of the paper
        const paperWidth = 48 *
            12; // 48mm paper width, 8 dots per mm (common for 80mm printers)
        final resizedLogoImage = img.copyResize(
          logoImage,
          width: paperWidth,
        );

        // Add the resized image to the print bytes
        bytes += generator.image(resizedLogoImage);
        bytes += generator.feed(1); // Add some space after the logo
      } else {
        log('logoImage --- is null ----');
      }
    }
  }
  if (addName != null) {
    if (addName == true) {
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
    }
  }

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
      text: 'Invoice To :',
      width: 4,
      styles: const PosStyles(bold: true),
    ),
    PosColumn(
      text: cutumer,
      width: 8,
      styles: const PosStyles(
        align: PosAlign.left,
      ),
    ),
  ]);

  bytes += generator.row([
    PosColumn(
      text: 'Invoice No :',
      width: 4,
      styles: const PosStyles(bold: true),
    ),
    PosColumn(
      text: invoiceNo,
      width: 8,
      styles: const PosStyles(
        align: PosAlign.left,
      ),
    ),
  ]);

  bytes += generator.row([
    PosColumn(
      text: 'Order No :',
      width: 4,
      styles: const PosStyles(bold: true),
    ),
    PosColumn(
      text: mergedorNot == 'Merged' ? '$orderNo,$mergedOrders' : orderNo,
      width: 8,
      styles: const PosStyles(
        align: PosAlign.left,
      ),
    ),
  ]);
  bytes += generator.row([
    PosColumn(
      text: 'Table :',
      width: 4,
      styles: const PosStyles(bold: true),
    ),
    PosColumn(
      text: mergedorNot == 'Merged' ? '$tableNo,$mergedTables' : tableNo,
      width: 8,
      styles: const PosStyles(
        align: PosAlign.left,
      ),
    ),
  ]);
  bytes += generator.row([
    PosColumn(
      text: 'Waiter :',
      width: 4,
      styles: const PosStyles(bold: true),
    ),
    PosColumn(
      text: usernameA ?? '--',
      width: 8,
      styles: const PosStyles(
        align: PosAlign.left,
      ),
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
  infoCustomer!.gSTScheme == 'unregistered' ||
          infoCustomer!.gSTScheme == 'GSTComposition'
      ? null
      : bytes += generator.hr(len: 48);
  infoCustomer!.gSTScheme == 'unregistered' ? null : bytes += generator.feed(1);

  infoCustomer!.gSTScheme == 'unregistered' ||
          infoCustomer!.gSTScheme == 'GSTComposition'
      ? null
      : tax < 1
          ? null
          : bytes += generator.row([
              PosColumn(
                text: 'Taxable Amount : ${taxable.toStringAsFixed(2)}',
                width: 12,
                styles: PosStyles(
                  // height: PosTextSize.size2,
                  // width: PosTextSize.size1,
                  bold: true,
                  align: inc! ? PosAlign.left : PosAlign.right,
                ),
              ),
            ]);

  //       ]);
  infoCustomer!.gSTScheme == 'unregistered' ||
          infoCustomer!.gSTScheme == 'GSTComposition'
      ? null
      : tax < 1
          ? null
          : bytes += generator.row([
              PosColumn(
                text: 'CGST : ${cGst.toStringAsFixed(2)}',
                width: 12,
                styles: PosStyles(
                  bold: true,

                  align: inc! ? PosAlign.left : PosAlign.right,
                  // bold: true
                ),
              ),
            ]);
  infoCustomer!.gSTScheme == 'unregistered' ||
          infoCustomer!.gSTScheme == 'GSTComposition'
      ? null
      : tax < 1
          ? null
          : bytes += generator.row([
              PosColumn(
                text: 'SGST : ${sGst.toStringAsFixed(2)}',
                width: 12,
                styles: PosStyles(
                  bold: true,

                  align: inc! ? PosAlign.left : PosAlign.right,
                  // bold: true
                ),
              ),
            ]);
  infoCustomer!.gSTScheme == 'unregistered' ||
          infoCustomer!.gSTScheme == 'GSTComposition'
      ? null
      : cess < 1
          ? null
          : bytes += generator.row([
              PosColumn(
                text: 'Cess : ${cess.toStringAsFixed(2)}',
                width: 12,
                styles: PosStyles(
                  bold: true,

                  align: inc! ? PosAlign.left : PosAlign.right,
                  // bold: true
                ),
              ),
              // PosColumn(
              //   text: cess.toStringAsFixed(2),
              //   width: 4,
              //   styles: const PosStyles(align: PosAlign.right, bold: true),
              // ),
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
      text: netAmount.round().toString(),
      width: 4,
      styles: const PosStyles(
        bold: true,
        align: PosAlign.right,
        height: PosTextSize.size2, // Double height
        width: PosTextSize.size2, // Double width
      ),
    ),
  ]);

  bytes += generator.hr(len: 48);

  // // Add Barcode
  // bytes += generator.barcode(
  //   Barcode.code128(generator.text(invoiceNo)),
  //   width: 2, // Barcode width
  //   height: 100, // Barcode height

  //   align: PosAlign.center, // Barcode alignment
  // );

  // bytes += generator.feed(1); // Add some space after the barcode

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
 if (isSoundEnabled! && soundOption == 'After Printing') {
      bytes += generator.beep(
        n: 4,
        duration: PosBeepDuration.beep50ms,
      );
    }
  return bytes;
}

Future<img.Image?> _getNetworkImage() async {
  final imageUrl = 'http://$ipid/${infoCustomer!.cmpname}.png';
  log('Fetching image from: $imageUrl');

  try {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      final image = img.decodeImage(response.bodyBytes);
      if (image == null) {
        log('Failed to decode image');
      }
      return image != null ? img.copyResize(image, width: 300) : null;
    } else {
      log('Failed to load image. Status code: ${response.statusCode}');
    }
  } catch (e) {
    log('Error loading image: $e');
  }
  return null;
}
