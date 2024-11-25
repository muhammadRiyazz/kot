import 'dart:developer';

import 'package:flutter_esc_pos_utils/flutter_esc_pos_utils.dart';
import 'package:flutter_esc_pos_network/flutter_esc_pos_network.dart';
import 'package:intl/intl.dart';

class NetworkPrinter {

Future<List<int>> testTicket() async {
  final profile = await CapabilityProfile.load();
  final generator = Generator(PaperSize.mm80, profile);
  List<int> bytes = [];

  // Get the current date and time
  String currentDateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

  // Header text
  bytes += generator.text(
    'eye 2 eye tech',
    styles: const PosStyles(
      align: PosAlign.center,
      height: PosTextSize.size2,
      width: PosTextSize.size2,
    ),
  );

  // Separator
  bytes += generator.text('--------------------------------',
      styles: const PosStyles(align: PosAlign.center));

  // Date and time
  bytes += generator.text(
    'Date & Time: $currentDateTime',
    styles: const PosStyles(align: PosAlign.left),
  );

  // Printer connected confirmation
  bytes += generator.text(
    'Printer connected successfully!',
    styles: const PosStyles(align: PosAlign.left, bold: true),
  );

  // Thank you message
  bytes += generator.text(
    'Thank you for using our service!',
    styles: const PosStyles(align: PosAlign.center),
  );

  // Dynamic or ongoing message
  bytes += generator.text(
    'Continue your work smoothly...',
    styles: const PosStyles(align: PosAlign.left),
  );

 

  // Footer
  bytes += generator.text('--------------------------------',
      styles: const PosStyles(align: PosAlign.center));
  bytes += generator.text(
    'Visit us again!',
    styles: const PosStyles(align: PosAlign.center),
  );

  // Feed and cut
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
