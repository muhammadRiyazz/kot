import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/infrastructure/initalfetchdata/stock_mng.dart';

class MngStockPage extends StatefulWidget {
  @override
  _MngStockPageState createState() => _MngStockPageState();
}

class _MngStockPageState extends State<MngStockPage> {
  bool _option1 = stockmngGoods??false;
  bool _option2 = stockmngService??false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Stock Management",
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
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
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Choose which types of items to manage in your stock.",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text(
                      "Manage Goods items",
                      style: TextStyle(fontSize: 15),
                    ),
                    subtitle: const Text(
                      "Turn on to Manage Goods items in stock.",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    value: _option1,
                    onChanged: (value) {
                      setState(() {
                        StockMng().changestockmngGoods(value: value);
                        _option1 = value;
                      });
                    },
                    // trackOutlineWidth: WidgetStatePropertyAll(1),
                    inactiveTrackColor:
                        const Color.fromARGB(255, 239, 239, 239),
                    inactiveThumbColor: mainclr,
                    trackOutlineColor: const WidgetStatePropertyAll(mainclr),
                    activeColor: const Color.fromARGB(255, 239, 239, 239),
                    activeTrackColor: mainclr,
                    // activeColor: Colors.blue,
                    // inactiveThumbColor: Colors.grey,
                  ),
                  Divider(height: 12, color: Colors.grey.shade300),
                  SwitchListTile(
                    title: const Text(
                      "Manage Service items",
                      style: TextStyle(fontSize: 15),
                    ),
                    subtitle: const Text(
                      "Turn on to Manage Service items in stock.",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    value: _option2,
                    onChanged: (value) {
                      setState(() {
                                                StockMng().changestockmngService(value: value);

                        _option2 = value;
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
            Spacer(),
          ],
        ),
      ),
    );
  }
}
