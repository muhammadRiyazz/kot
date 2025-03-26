import 'package:flutter/material.dart';
import 'package:restaurant_kot/infrastructure/initalfetchdata/sound_printer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrinterSoundSettings extends StatefulWidget {
  const PrinterSoundSettings({super.key});

  @override
  State<PrinterSoundSettings> createState() => _PrinterSoundSettingsState();
}

class _PrinterSoundSettingsState extends State<PrinterSoundSettings> {
  // bool isSoundEnabled = false;
  // String soundOption = "After Printing"; // Default option

  
 
  // // Load saved preferences
  // Future<void> _loadPreferences() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     isSoundEnabled = prefs.getBool("isSoundEnabled") ?? false;
  //     soundOption = prefs.getString("soundOption") ?? "After Printing";
  //   });
  // }

  // // Save preferences
  // Future<void> _savePreferences() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool("isSoundEnabled", isSoundEnabled);
  //   prefs.setString("soundOption", soundOption);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Printer Sound Settings",
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
            const SizedBox(height: 10),
            SwitchListTile(
              title: const Text(
                "Enable Printer Sound",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("Turn on/off printer sound"),
              value: isSoundEnabled!,
              onChanged: (bool value) {
                setState(() {
                  isSoundEnabled = value;
                  savePreferences(isSoundEnabled: value,soundOption: ''); // Save state when changed
                });
              },
            ),
            if (isSoundEnabled!) ...[
              const SizedBox(height: 15),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: const Text("Before Printing"),
                leading: Radio(
                  value: "Before Printing",
                  groupValue: soundOption,
                  onChanged: (value) {
                    setState(() {
                      soundOption = value.toString();
                      savePreferences(isSoundEnabled:true,
                      soundOption:value.toString() ); // Save state when changed
                    });
                  },
                ),
              ),
              Divider(),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: const Text("After Printing"),
                leading: Radio(
                  value: "After Printing",
                  groupValue: soundOption,
                  onChanged: (value) {
                    setState(() {
                      soundOption = value.toString();
                      savePreferences(isSoundEnabled:true,
                      soundOption:value.toString() ); // Save state when changed
                    });
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
