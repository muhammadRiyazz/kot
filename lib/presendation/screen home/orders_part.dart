import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';

import '../screen order details/screen_order_detail.dart';

class Order {
  final String id;
  final String time;
  final int itemCount;
  final double totalPrice;

  Order({
    required this.id,
    required this.time,
    required this.itemCount,
    required this.totalPrice,
  });
}

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<Order> orders = [
    Order(id: '001', time: '10:30 AM', itemCount: 3, totalPrice: 150.0),
    Order(id: '002', time: '11:00 AM', itemCount: 2, totalPrice: 100.0),
    Order(id: '003', time: '11:30 AM', itemCount: 5, totalPrice: 250.0),
    Order(id: '004', time: '12:00 PM', itemCount: 4, totalPrice: 200.0),
    // Add more sample orders here
  ];

  List<bool> isSelected = [];
  bool isMultiSelectMode = false;

  @override
  void initState() {
    super.initState();
    isSelected = List<bool>.filled(orders.length, false);
  }

  void _onLongPress(int index) {
    setState(() {
      isMultiSelectMode = true;
      isSelected[index] = !isSelected[index];
    });
  }

  void _onTap(int index) {
    if (isMultiSelectMode) {
      setState(() {
        isSelected[index] = !isSelected[index];
        if (!isSelected.contains(true)) {
          isMultiSelectMode = false;
        }
      });
    } else {
      // Navigate to order details page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderDetailsPage(
            order: Orderr(
              id: orders[index].id,
              time: orders[index].time,
              items: [
                OrderItem(
                  name: 'Biriyani',
                  image:
                      'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
                  quantity: 5,
                ),
                OrderItem(
                  name: 'Chicken Periperi Mandhi',
                  image:
                      'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
                  quantity: 5,
                ),
                OrderItem(
                  name: 'Chicken Biriyani',
                  image:
                      'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
                  quantity: 5,
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  void mergeOrders() {
    final selectedOrders = orders
        .asMap()
        .entries
        .where((entry) => isSelected[entry.key])
        .map((entry) => entry.value)
        .toList();
    log('Merging Orders: ${selectedOrders.map((o) => o.id).join(', ')}');
    // Implement your merge logic here
  }

  @override
  Widget build(BuildContext context) {
    // Determine screen size for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine the number of grid columns based on screen width
    int crossAxisCount = 1;
    if (screenWidth >= 900) {
      crossAxisCount = 3;
    } else if (screenWidth >= 600) {
      crossAxisCount = 2;
    }

    // Define dynamic text size and box size adjustments based on screen size
    double textSize = screenWidth < 600 ? 14 : 16; // Adjust for phone/tablet
    // double boxImageSize = screenWidth < 600 ? 40 : 50; // Box image size
    double boxPadding =
        screenWidth < 600 ? 8 : 12; // Padding based on screen size

    // Adjust childAspectRatio based on crossAxisCount
    double childAspectRatio;
    switch (crossAxisCount) {
      case 1:
        childAspectRatio = 2.7;
        break;
      case 2:
        childAspectRatio = 2.5;
        break;
      case 3:
        childAspectRatio = 2.5;
        break;
      default:
        childAspectRatio = 2.5;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Running Orders',
          style: TextStyle(fontSize: 19),
        ),
        actions: [
          if (isMultiSelectMode)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                setState(() {
                  isMultiSelectMode = false;
                  isSelected = List<bool>.filled(orders.length, false);
                });
              },
            ),
        ],
      ),
      body: RefreshIndicator(
        backgroundColor: mainclr,
        color: mainclrbg,
        onRefresh: () async {
          log('Page refreshed');
          // Implement your refresh logic here
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(3),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: childAspectRatio,
                    ),
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.zero,
                        elevation: 5,
                        shadowColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () => _onTap(index),
                          onLongPress: () => _onLongPress(index),
                          child: Container(
                            padding: EdgeInsets.all(boxPadding + 5),
                            decoration: BoxDecoration(
                              color: boxbgwhite,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    isMultiSelectMode
                                        ? Checkbox(
                                            activeColor: mainclr,
                                            value: isSelected[index],
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isSelected[index] = value!;
                                              });
                                            },
                                          )
                                        : Container(
                                            decoration: BoxDecoration(
                                                color: mainclr,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: const Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Icon(
                                                Icons.restaurant,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Order ID: ${orders[index].id}',
                                          style: TextStyle(
                                            fontSize: textSize,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Total: ₹${orders[index].totalPrice}',
                                          style: TextStyle(
                                            fontSize: textSize - 2,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: mainclr,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          'Table 1',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: textSize - 4,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Order Header
                                // ListTile(
                                //   isThreeLine: true,
                                //   contentPadding: EdgeInsets.symmetric(
                                //       vertical: 0, horizontal: 3),
                                //   splashColor: Colors.transparent,
                                //   tileColor: Colors.transparent,
                                //   onTap: () => _onTap(index),
                                //   leading: isMultiSelectMode
                                //       ? Checkbox(
                                //           activeColor: mainclr,
                                //           value: isSelected[index],
                                //           onChanged: (bool? value) {
                                //             setState(() {
                                //               isSelected[index] = value!;
                                //             });
                                //           },
                                //         )
                                //       : Container(
                                //           decoration: BoxDecoration(
                                //               color: mainclr,
                                //               borderRadius:
                                //                   BorderRadius.circular(10)),
                                //           child: const Padding(
                                //             padding: EdgeInsets.all(10.0),
                                //             child: Icon(
                                //               Icons.restaurant,
                                //               color: Colors.white,
                                //             ),
                                //           ),
                                //         ),
                                //   title: Text(
                                //     'Order ID: ${orders[index].id}',
                                //     style: TextStyle(
                                //       fontSize: textSize,
                                //       fontWeight: FontWeight.bold,
                                //     ),
                                //   ),
                                //   subtitle: Text(
                                //     'Total: ₹${orders[index].totalPrice}',
                                //     style: TextStyle(
                                //       fontSize: textSize - 2,
                                //     ),
                                //   ),
                                //   trailing: Container(
                                //     decoration: BoxDecoration(
                                //       color: mainclr,
                                //       borderRadius: BorderRadius.circular(10),
                                //     ),
                                //     child: Padding(
                                //       padding: const EdgeInsets.all(10.0),
                                //       child: Text(
                                //         'Table 1',
                                //         style: TextStyle(
                                //           color: Colors.white,
                                //           fontWeight: FontWeight.bold,
                                //           fontSize: textSize - 4,
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                // const Text('data')
                                const Divider(
                                  color: Color.fromARGB(255, 236, 236, 236),
                                ),
                                // Order Time
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Items: ${orders[index].itemCount}',
                                      style: TextStyle(
                                        fontSize: textSize,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.timer_sharp,
                                          color: Color.fromARGB(
                                              255, 204, 204, 204),
                                          size: 18,
                                        ),
                                        SizedBox(width: 6),
                                        Text(
                                          orders[index].time,
                                          style: TextStyle(
                                            fontSize: textSize - 3,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (isMultiSelectMode &&
                    isSelected.where((selected) => selected).length >= 2)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: MainButton(
                      label: 'Merge & Print',
                      onpress: () {
                        mergeOrders();
                      },
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}