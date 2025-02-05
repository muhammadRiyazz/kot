import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/infrastructure/initalfetchdata/bill_design_mng.dart'; // Assuming you have a colors file

class BillDesignSettingsPage extends StatefulWidget {
  @override
  _BillDesignSettingsPageState createState() => _BillDesignSettingsPageState();
}

class _BillDesignSettingsPageState extends State<BillDesignSettingsPage> {
  bool _enableLogo = addLogo ?? false; // Default value for enabling logo
  bool _enableName = addName ?? false; // Default value for enabling name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bill Design",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            // fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black), // Back button color
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Customize how your bill looks when printed. ",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                  // fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text(
                      "Enable Logo on Bill",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: const Text(
                      "Show your logo on the printed bill for brand visibility.",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    value: _enableLogo,
                    onChanged: (value) {
                      setState(() {
                        _enableLogo = value;
                        // Call your function to update the bill design settings
                        BillDesignMng().changebilldesignLogo(value: value);
                      });
                    },
                    inactiveTrackColor:
                        const Color.fromARGB(255, 239, 239, 239),
                    inactiveThumbColor: mainclr,
                    trackOutlineColor: const WidgetStatePropertyAll(mainclr),
                    activeColor: const Color.fromARGB(255, 239, 239, 239),
                    activeTrackColor: mainclr,
                  ),
                  Divider(height: 12, color: Colors.grey.shade300),
                  SwitchListTile(
                    title: const Text(
                      "Enable Name on Bill",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: const Text(
                      "Display your business name on the printed bill for a professional touch.",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    value: _enableName,
                    onChanged: (value) {
                      setState(() {
                        _enableName = value;
                        // Call your function to update the bill design settings
                        BillDesignMng().changesbilldesignName(value: value);
                      });
                    },
                    inactiveTrackColor:
                        const Color.fromARGB(255, 239, 239, 239),
                    inactiveThumbColor: mainclr,
                    trackOutlineColor: const WidgetStatePropertyAll(mainclr),
                    activeColor: const Color.fromARGB(255, 239, 239, 239),
                    activeTrackColor: mainclr,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  "Make your bill uniquely yours!",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
