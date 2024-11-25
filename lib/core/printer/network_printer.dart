import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_esc_pos_utils/flutter_esc_pos_utils.dart';
import 'package:flutter_esc_pos_network/flutter_esc_pos_network.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_kot/consts/colors.dart';

class NetworkPrinter {
  Future<List<int>> testTicket() async {
    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm80, profile);
    List<int> bytes = [];

    // Get the current date and time
    String currentDateTime =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    // Header text
    bytes += generator.text(
      'BALLAST',
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
      styles: const PosStyles(align: PosAlign.center),
    );

    // Printer connected confirmation
    bytes += generator.text(
      'Printer connected successfully!',
      styles: const PosStyles(align: PosAlign.center, bold: true),
    );

    // Dynamic or ongoing message
    bytes += generator.text(
      'Continue your work smoothly...',
      styles: const PosStyles(align: PosAlign.center),
    );

    // Feed and cut
    bytes += generator.feed(2);
    bytes += generator.cut();

    return bytes;
  }

  Future<void> printTicket(List<int> ticket, BuildContext context) async {
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
          _showErrorBottomSheet(
            context,
          );
          break;
        case PosPrintResult.scanInProgress:
          _showErrorBottomSheet(
            context,
          );
          break;
        case PosPrintResult.printInProgress:
          log('Print in progress');
          _showErrorBottomSheet(
            context,
          );
          break;
        case PosPrintResult.printerConnected:
          log('Printer already connected');
          _showErrorBottomSheet(
            context,
          );
          break;
        case PosPrintResult.timeout:
          log('Connection timed out');
          _showErrorBottomSheet(
            context,
          );
          break;
        default:
          log('Unknown error');
          _showErrorBottomSheet(
            context,
          );
          break;
      }
    } catch (e) {
      log(e.toString());
      _showErrorBottomSheet(
        context,
      );
    }
  }

  void _showErrorBottomSheet(
    BuildContext context,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          height: 300,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.error_outline, size: 100, color: mainclr),
              SizedBox(width: 16),
              Text(
                'Sorry!',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
              Text(
                textAlign: TextAlign.center,
                'Please Check Your Printer\nConnection!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
