import 'package:flutter/material.dart';
import 'package:restaurant_kot/presendation/settings/printer/kitchen_listing.dart';
import 'package:restaurant_kot/presendation/settings/printer/printer_sound_page.dart';

class PrinterSettingsList extends StatelessWidget {
  const PrinterSettingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Printer Settings",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => KitchensPage()),
                      );
                    },
                    title: const Text(
                      'Printers',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    subtitle: const Text(
                      "Manage Printers",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.grey),
                  ),
                  Divider(height: 1, color: Colors.grey.shade300),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PrinterSoundSettings()),
                      );
                    },
                    title: const Text(
                      'Printer Sound',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    subtitle: const Text(
                      "Manage Printer Sound",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
