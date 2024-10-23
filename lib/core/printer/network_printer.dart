import 'dart:developer';

import 'package:flutter_esc_pos_utils/flutter_esc_pos_utils.dart';
import 'package:flutter_esc_pos_network/flutter_esc_pos_network.dart';

class NetworkPrinter {
  Future<List<int>> testTicket() async {
    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm80, profile);
    List<int> bytes = [];

    // bytes += generator.text(
    //     'Regular: aA bB cC dD eE fF gG hH iI jJ kK lL mM nN oO pP qQ rR sS tT uU vV wW xX yY zZ');
    // bytes += generator.text('Special 1: àÀ èÈ éÉ ûÛ üÜ çÇ ôÔ',
    //     styles: const PosStyles(codeTable: 'CP1252'));
    // bytes += generator.text('Special 2: blåbærgrød',
    //     styles: const PosStyles(codeTable: 'CP1252'));

    // bytes += generator.text('Bold text', styles: const PosStyles(bold: true));
    // bytes +=
    //     generator.text('Reverse text', styles: const PosStyles(reverse: true));
    // bytes += generator.text('Underlined text',
    //     styles: const PosStyles(underline: true), linesAfter: 1);
    // bytes += generator.text('Align left',
    //     styles: const PosStyles(align: PosAlign.left));
    // bytes += generator.text('Align center',
    //     styles: const PosStyles(align: PosAlign.center));
    // bytes += generator.text('Align right',
    //     styles: const PosStyles(align: PosAlign.right), linesAfter: 1);

    // bytes += generator.row([
    //   PosColumn(
    //     text: 'col3',
    //     width: 3,
    //     styles: const PosStyles(align: PosAlign.center, underline: true),
    //   ),
    //   PosColumn(
    //     text: 'col6',
    //     width: 6,
    //     styles: const PosStyles(align: PosAlign.center, underline: true),
    //   ),
    //   PosColumn(
    //     text: 'col3',
    //     width: 3,
    //     styles: const PosStyles(align: PosAlign.center, underline: true),
    //   ),
    // ]);

    bytes += generator.text('eye 2 eye tech',
        styles: const PosStyles(align: PosAlign.center,
          height: PosTextSize.size2,
          width: PosTextSize.size2,
        ));

    // Print barcode
    // final List<int> barData = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 4];
    // bytes += generator.barcode(Barcode.upcA(barData));

    bytes += generator.feed(2);
    bytes += generator.cut();
    return bytes;
  }

  Future<void> printTicket(List<int> ticket) async {
    try {
      log('Attempting to connect to printer');
      final printer =
          PrinterNetworkManager('192.168.1.100'); // Ensure correct IP and port
      PosPrintResult connect = await printer.connect();

      switch (connect) {
        case PosPrintResult.success:
          log('Printer connected successfully');
          PosPrintResult printing = await printer.printTicket(ticket);
          log('Print result: ${printing.msg}');
          printer.disconnect();
          break;
        case PosPrintResult.ticketEmpty:
          log('Ticket is empty');
          break;
        case PosPrintResult.scanInProgress:
          log('Scan in progress');
          break;
        case PosPrintResult.printInProgress:
          log('Print in progress');
          break;
        case PosPrintResult.printerConnected:
          log('Printer already connected');
          break;
        case PosPrintResult.timeout:
          log('Connection timed out');
          break;

        default:
          log('Unknown error');
          break;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
