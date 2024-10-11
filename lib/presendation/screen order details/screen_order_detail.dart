import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/presendation/screen%20bill%20preview/screen_bill.dart';
import 'package:restaurant_kot/presendation/screen%20order%20details/table_view.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/screen_product_selection.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';

class Orderr {
  final String id;
  final String time;
  final List<OrderItem> items;

  Orderr({
    required this.id,
    required this.time,
    required this.items,
  });
}

class OrderItem {
  final String name;
  final String image;
  int quantity;

  OrderItem({
    required this.name,
    required this.image,
    required this.quantity,
  });
}

class OrderDetailsPage extends StatefulWidget {
  final Orderr order;

  const OrderDetailsPage({required this.order});

  @override
  _OrderDetailsPageState createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  late List<OrderItem> _items;
  bool _isPrintKOTEnabled = false;
  bool _isNewItemButtonEnabled = true;

  @override
  void initState() {
    super.initState();
    _items = widget.order.items;
  }

  void _changeQuantity(OrderItem item, int change) {
    setState(() {
      item.quantity += change;
      if (item.quantity < 0) item.quantity = 0; // Prevent negative quantity
      _isPrintKOTEnabled = _items.any((i) => i.quantity > 0);
      _isNewItemButtonEnabled = _items.every((i) => i.quantity > 0);
    });
  }

  void _changeTable() {
    // Logic to change the table, show a dialog or navigation for table selection
    // Example confirmation dialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Change Table'),
          content: Text('Select a new table'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _printKOT() {

  }

  void _printBill() {
    // Logic to navigate to the bill page
    print('Navigating to Bill Page...');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainclrbg,
      appBar: AppBar(
        backgroundColor: appbarbg,
        title: Center(
          child: Text(
            'Order Details',
            style: TextStyle(fontSize: 18),
          ),
        ),
        actions: const [
          // Navigation to selected products page
          SizedBox(
            width: 60,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: boxbgwhite, borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  splashColor: const Color.fromARGB(0, 255, 255, 255),
                  tileColor: const Color.fromARGB(0, 255, 255, 255),
                  title: Text(
                    'Order ID: 001',
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: mainclr),
                          borderRadius:
                              BorderRadius.circular(20), // Border radius of 10
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ProductChoosingPage();
                          },
                        ));
                      },
                      child: Text(
                        'Add Item',
                        style: TextStyle(
                            color: mainclr, fontWeight: FontWeight.bold),
                      )),
                  subtitle: Text('Items: 5, Total: ₹ 1000/-'),
                  leading: Container(
                      decoration: BoxDecoration(
                          color: mainclr,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                        child: Text(
                          'TB 1',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      )),
                  // trailing: Container(
                  //     decoration: BoxDecoration(
                  //         color: mainclrbg,
                  //         borderRadius: BorderRadius.circular(10)),
                  //     child: const Padding(
                  //       padding: EdgeInsets.all(12.0),
                  //       child: Text(
                  //         'TBv3 1',
                  //         style: TextStyle(
                  //             color: mainclr,
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 15),
                  //       ),
                  //     )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: mainclrbg),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Icon(
                              Icons.timer_sharp,
                              color: mainclr,
                              size: 17,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '00 : 45 Minutes',
                              style: TextStyle(
                                  color: mainclr,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled:
                                true, // Allows the modal to take more height

                            context: context,
                            builder: (context) {
                              return TableViewForTableChange();
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              'Change Table',
                              style: TextStyle(
                                  color: mainclr,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Icon(
                              Icons.arrow_right_outlined,
                              color: mainclr,
                            )
                          ],
                        )),
                  ],
                ),
                SizedBox(
                  height: 8,
                )
              ],
            ),
          ),

          SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 14),
            child: Text(
              'Items',
              style: TextStyle(fontSize: 22),
            ),
          ),
          // Item List
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 6,
                  );
                },
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return Card(margin: EdgeInsets.all(3),
                    
                    elevation: 3,borderOnForeground: true,shadowColor: const Color.fromARGB(255, 255, 255, 255),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: ListTile(
                        contentPadding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 10, right: 4),
                        leading: Container(
                          height: 100,
                          width: 60,
                          decoration: BoxDecoration(
                            color: boxbgclr,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              item.image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ), // Replace with asset image if needed
                        title: Text(
                          item.name,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Amount : ₹ 150/-'),
                            Text('Orderd Qty : 5'),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Container(
                                  decoration: BoxDecoration(
                                      color: index == 2 ? Colors.red : mainclr,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                  )),
                              onPressed: () {
                                _changeQuantity(item, -1);
                              },
                            ),
                            index != 1
                                ? Text(
                                    '2',
                                    style: TextStyle(
                                        color: mainclr,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  )
                                : SizedBox(),
                            IconButton(
                              icon: Container(
                                  decoration: BoxDecoration(
                                      color: mainclr,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                  )),
                              onPressed: () {
                                _changeQuantity(item, 1);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: MainButton(
                label: 'Print KOT',
                onpress: _isPrintKOTEnabled ? _printKOT : null),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 12, left: 12),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // backgroundColor: buttonclr, // Set the button background color

                  minimumSize: Size(double.infinity, 55), // Full-width button
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: mainclr),
                    borderRadius:
                        BorderRadius.circular(20), // Border radius of 10
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return BillPage();
                    },
                  ));
                },
                child: Text(
                  'Print Bill',
                  style: TextStyle(fontWeight: FontWeight.bold,color: mainclr),
                )),
          ),
          // // Print KOT Button
          // ElevatedButton(
          //   onPressed: _isPrintKOTEnabled ? _printKOT : null,
          //   style: ElevatedButton.styleFrom(
          //     padding: EdgeInsets.all(16.0),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(8.0),
          //     ),
          //   ),
          //   child: Text('Print KOT'),
          // ),

          // SizedBox(height: 8.0),

          // // New Item Button
          // ElevatedButton(
          //   onPressed: _isNewItemButtonEnabled
          //       ? () {
          //           // Logic to navigate to new item selection
          //           print('Navigating to New Item Selection...');
          //         }
          //       : null,
          //   style: ElevatedButton.styleFrom(
          //     padding: EdgeInsets.all(16.0),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(8.0),
          //     ),
          //   ),
          //   child: Text('New Item'),
          // ),

          // SizedBox(height: 8.0),

          // // Print Bill Button
          // ElevatedButton(
          //   onPressed: _printBill,
          //   style: ElevatedButton.styleFrom(
          //     padding: EdgeInsets.all(16.0),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(8.0),
          //     ),
          //   ),
          //   child: Text('Print Bill'),
          // ),
        ],
      ),
    );
  }
}
