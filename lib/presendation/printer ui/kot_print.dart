import 'package:flutter_esc_pos_utils/flutter_esc_pos_utils.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_kot/domain/cus/customer_model.dart';
import 'package:restaurant_kot/domain/item/kot_item_model.dart';

Future<List<int>> kotPrintData(
    {required List<kotItem> items,
    required String tableNo,
    required String orderNo,
    required bool parcel,
    required String kotNo,
    required String user,
    required bool dlt,
    required String note}) async {
  final profile = await CapabilityProfile.load();
  final generator = Generator(PaperSize.mm80, profile);
  List<int> bytes = [];

  // Header
  bytes += generator.text(
    parcel
        ? 'Parcel KOT'
        : kotNo == '--'
            ? 'Cancel KOT'
            : 'KOT',
    styles: const PosStyles(
      align: PosAlign.center,
      width: PosTextSize.size4,
      height: PosTextSize.size3,
      bold: true,
    ),
  );
  bytes += generator.text(
    'Dining ',
    styles: const PosStyles(
      align: PosAlign.center,
      bold: true,
      height: PosTextSize.size1,
      width: PosTextSize.size2,
    ),
  );
  bytes += generator.feed(1);

  // bytes += generator.hr(len: 48); // Full width horizontal rule

  // // Date and Time
  // bytes += generator.row([
  //   PosColumn(
  //     text: DateFormat('dd/MM/yyyy').format(DateTime.now()),
  //     width: 6,
  //     styles: const PosStyles(bold: true),
  //   ),
  //   PosColumn(
  //     text: DateFormat('hh:mm a').format(DateTime.now()),
  //     width: 6,
  //     styles: const PosStyles(bold: true, align: PosAlign.right),
  //   ),
  // ]);
  // bytes += generator.hr(len: 48);

  // Order Info
  // bytes += generator.row([
  //   PosColumn(
  //     text: 'Order No',
  //     width: 6,
  //     styles: const PosStyles(bold: true),
  //   ),
  //   PosColumn(
  //     text: orderNo,
  //     width: 6,
  //     styles: const PosStyles(bold: true, align: PosAlign.right),
  //   ),
  // ]);
  // kotNo == '--'
  //     ? null
  //     : bytes += generator.row([
  //   PosColumn(
  //     text: 'KOT',
  //     width: 6,
  //     styles: const PosStyles(bold: true),
  //   ),
  //   PosColumn(
  //     text: kotNo == '--' ? 'Cancel KOT' : kotNo,
  //     width: 6,
  //     styles: const PosStyles(bold: true, align: PosAlign.right),
  //   ),
  // ]);
  bytes += generator.row([
    PosColumn(
      text: 'Order No : ',
      width: 3,
      styles: const PosStyles(bold: true, align: PosAlign.left),
    ),
    PosColumn(
      text: orderNo,
      width: 4,
      styles: const PosStyles(align: PosAlign.left),
    ),
    PosColumn(
      text: 'Date : ',
      width: 2,
      styles: const PosStyles(bold: true, align: PosAlign.right),
    ),
    PosColumn(
      text: DateFormat('dd/MM/yyyy').format(DateTime.now()),
      width: 3,
      styles: const PosStyles(align: PosAlign.right),
    ),
  ]);

  bytes += generator.row([
    PosColumn(
      text: 'KOT : ',
      width: 3,
      styles: const PosStyles(bold: true, align: PosAlign.left),
    ),
    PosColumn(
      text: kotNo == '--' ? 'Cancel KOT' : kotNo,
      width: 4,
      styles: const PosStyles(align: PosAlign.left),
    ),
    PosColumn(
      text: 'Time : ',
      width: 2,
      styles: const PosStyles(bold: true, align: PosAlign.right),
    ),
    PosColumn(
      text: DateFormat('hh:mm a').format(DateTime.now()),
      width: 3,
      styles: const PosStyles(align: PosAlign.right),
    ),
  ]);
  // bytes += generator.row([
  //   PosColumn(
  //     text: 'Waiter : ',
  //     width: 2,
  //     styles: const PosStyles(bold: true, align: PosAlign.left),
  //   ),
  //   PosColumn(
  //     text: usernameA ?? '',
  //     width: 10,
  //     styles: const PosStyles(align: PosAlign.left),
  //   ),
  // ]);
  bytes += generator.hr(len: 48, ch: "_");
  bytes += generator.feed(1);

  bytes += generator.text(
    'Table : $tableNo ',
    styles: const PosStyles(
      align: PosAlign.left,
      bold: true,
    ),
  );
  bytes += generator.text(
    'Waiter : ${usernameA ?? ''}',
    styles: const PosStyles(
      align: PosAlign.left,
      bold: true,
    ),
  );
  // bytes += generator.row([
  //   PosColumn(
  //     text: 'Table : ',
  //     width: 2,
  //     styles: const PosStyles(bold: true, align: PosAlign.left),
  //   ),
  //   PosColumn(
  //     text: tableNo,
  //     width: 10,
  //     styles: const PosStyles(align: PosAlign.left),
  //   ),
  // ]);
  // bytes += generator.row([
  //   PosColumn(
  //     text: 'Waiter : ',
  //     width: 3,
  //     styles: const PosStyles(bold: true, align: PosAlign.left),
  //   ),
  //   PosColumn(
  //     text: usernameA ?? '',
  //     width: 9,
  //     styles: const PosStyles(align: PosAlign.left),
  //   ),
  // ]);
  // bytes += generator.row([
  //   PosColumn(
  //     text: 'Waiter : ${usernameA ?? ''}',
  //     width: 6,
  //     styles: const PosStyles(bold: true),
  //   ),
  // PosColumn(
  //   text: usernameA ?? '',
  //   width: 6,
  //   styles: const PosStyles(bold: true, align: PosAlign.right),
  // ),
  // ]);
  // bytes += generator.row([
  //   PosColumn(
  //     text: 'Table : $tableNo',
  //     width: 6,
  //     styles: const PosStyles(bold: true),
  //   ),
  // PosColumn(
  //   text: tableNo,
  //   width: 6,
  //   styles: const PosStyles(bold: true, align: PosAlign.right),
  // ),
  // ]);
  // bytes += generator.feed(1);

  ////////////////////////
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
        styles: const PosStyles(
            // fontType: PosFontType.fontB,
            bold: true,
            height: PosTextSize.size1,
            width: PosTextSize.size2,
            align: PosAlign.left),
      ),
      PosColumn(
        text: dlt
            ? item.qty.toString()
            : item.quantity == 0
                ? item.qty.toString()
                : item.quantity.abs().toString(),
        width: 4,
        styles: const PosStyles(
          align: PosAlign.right,
          bold: true,
          height: PosTextSize.size1,
          width: PosTextSize.size2,
        ),
      ),
    ]);
  }

  bytes += generator.hr(len: 48);

  note == ''
      ? null
      : bytes += generator.text(
          note,
          styles: const PosStyles(
            align: PosAlign.center,
            bold: false,
          ),
        );

  note == '' ? null : bytes += generator.hr(len: 48);

  // Footer Note
  bytes += generator.text(
    infoCustomer!.kotFooterText,
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
