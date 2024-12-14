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

  Future<int> printTicket(List<int> ticket, String ip) async {
    try {
      log('printing ip-------$ip');
      log('Attempting to connect to printer');
      final printer = PrinterNetworkManager(ip,
          timeout: const Duration(seconds: 10), port: 9100);
      PosPrintResult connect = await printer.connect();

      if (connect == PosPrintResult.success) {
        log('Printer connected successfully');
        PosPrintResult printing = await printer.printTicket(ticket);
        log('Print result: ${printing.msg}');
        printer.disconnect();
        return 0; // Success
      }

      // Handle other connection issues
      log('Connection failed: ${connect.msg}');

      return 1; // Failure
    } catch (e) {
      log('Error: $e');
      return 1; // Exception case
    }
  }

  Future<int> testprintTicket(
      List<int> ticket, String ip, BuildContext context) async {
    try {
      log('printing ip-------$ip');
      log('Attempting to connect to printer');
      final printer = PrinterNetworkManager(ip,
          timeout: const Duration(seconds: 5), port: 9100);
      PosPrintResult connect = await printer.connect();

      if (connect == PosPrintResult.success) {
        log('Printer connected successfully');
        PosPrintResult printing = await printer.printTicket(ticket);
        log('Print result: ${printing.msg}');
        printer.disconnect();
        return 0; // Success
      }

      // Handle other connection issues
      log('Connection failed: ${connect.msg}');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Column(
            children: [
              Text(
                "Sorry",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Please check the printer for any issues.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          backgroundColor: mainclr,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(12),
          duration: Duration(seconds: 4),
        ),
      );

      return 1; // Failure
    } catch (e) {
      log('Error: $e');
      return 1; // Exception case
    }
  }
}

void showErrorBottomSheet(BuildContext context, dynamic onpress) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Sorry',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            const Text(
              'Printing was not completed\nPlease check the printer for any issues.',
              textAlign: TextAlign.center,
            ),
            const Text(
              'Try again',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Use Expanded or Flexible for responsive image
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Image.asset(
                  'assets/img/printer/printerb.jpg',
                  fit: BoxFit
                      .contain, // Adjust to ensure the image fits within the available space
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 32),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.white, // Set the button background color
                    minimumSize:
                        const Size(double.infinity, 55), // Full-width button
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: mainclr),
                      borderRadius:
                          BorderRadius.circular(20), // Border radius of 10
                    ),
                  ),
                  onPressed: onpress,
                  child: const Text(
                    'Re-Print',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, color: mainclr),
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      );
    },
  );
}
