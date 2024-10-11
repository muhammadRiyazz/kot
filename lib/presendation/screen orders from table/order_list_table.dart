import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/presendation/screen%20home/orders_part.dart';
import 'package:restaurant_kot/presendation/screen%20order%20details/screen_order_detail.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/screen_product_selection.dart';

class ScreenOrdersList extends StatefulWidget {
  const ScreenOrdersList({super.key});

  @override
  State<ScreenOrdersList> createState() => _ScreenOrdersListState();
}

class _ScreenOrdersListState extends State<ScreenOrdersList> {
  List<Order> orders = [
    Order(id: '001', time: '10:30 AM', itemCount: 3, totalPrice: 150.0),
    Order(id: '002', time: '11:00 AM', itemCount: 2, totalPrice: 100.0),
    Order(id: '001', time: '10:30 AM', itemCount: 3, totalPrice: 150.0),
    Order(id: '002', time: '11:00 AM', itemCount: 2, totalPrice: 100.0),
    // Add more sample orders here
  ];
  List<bool> isSelected = [];
  bool isMultiSelectMode = false;

  @override
  void initState() {
    super.initState();
    isSelected = List<bool>.filled(orders.length, false);
  }

  void _onTap(int index) {
    if (isMultiSelectMode) {
      setState(() {
        isSelected[index] = !isSelected[index];
      });
    } else {
      // Navigate to order details page
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OrderDetailsPage(
                    order: Orderr(id: '1', time: '10 : 10 Am', items: [
                  OrderItem(
                      name: 'Biriyani',
                      image:
                          'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
                      quantity: 5),
                  OrderItem(
                      name: 'Chicken periperi Mandhi',
                      image:
                          'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
                      quantity: 5),
                  OrderItem(
                      name: 'Chicken Biriyani',
                      image:
                          'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
                      quantity: 5)
                ]))),
      );
    }
  }

  void _onLongPress(int index) {
    setState(() {
      isMultiSelectMode = true;
      isSelected[index] = !isSelected[index]; // Toggle the selection
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarbg,
        title: const Center(
            child: Text(
          'Orders Of TB 1',
          style: TextStyle(fontSize: 18),
        )),
        actions: const [
          SizedBox(
            width: 50,
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
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  splashColor: const Color.fromARGB(0, 255, 255, 255),
                  tileColor: const Color.fromARGB(0, 255, 255, 255),
                  title: const Text(
                    'Table No: TB 001',
                    style: TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: mainclr),
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
                      child: const Text(
                        'Add Order',
                        style: TextStyle(
                            color: mainclr, fontWeight: FontWeight.bold),
                      )),
                  subtitle: const Text('Orders: 5, Total: ₹ 1000/-'),
                  // leading: Container(
                  //     decoration: BoxDecoration(
                  //         color: mainclr,
                  //         borderRadius: BorderRadius.circular(10)),
                  //     child: const Padding(
                  //       padding:
                  //           EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  //       child: Text(
                  //         'TB 1',
                  //         style: TextStyle(
                  //             color: Color.fromARGB(255, 255, 255, 255),
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 15),
                  //       ),
                  //     )),
                ),
                const SizedBox(
                  height: 8,
                )
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Orders',
                  style: TextStyle(fontSize: 20),
                ),
               // if (isMultiSelectMode)
                //   IconButton(
                //     icon: Icon(Icons.close),
                //     onPressed: () {
                //       setState(() {
                //         isMultiSelectMode = false;
                //         isSelected = List<bool>.filled(orders.length, false);
                //       });
                //     },
                //   ),`
              ],
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
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Card(margin: EdgeInsets.all(3),
                    
                    elevation: 2,borderOnForeground: true,shadowColor: const Color.fromARGB(255, 255, 255, 255),
                    child: InkWell(
                      onTap: () => _onTap(index),
                      // onLongPress: () => _onLongPress(index),
                      child: Container(
                        decoration: BoxDecoration(
                          color: boxbgwhite,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: 5,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: mainclr,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                          contentPadding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          splashColor: const Color.fromARGB(
                                              0, 255, 255, 255),
                                          tileColor: const Color.fromARGB(
                                              0, 255, 255, 255),
                                          onTap: () => _onTap(index),
                                          leading: Container(
                                                    decoration: BoxDecoration(color: mainclr,borderRadius: BorderRadius.circular(10)),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(10.0),
                                                      child: Icon(Icons.restaurant,color: Color.fromARGB(255, 255, 255, 255),),
                                                    )),
                                          //  isMultiSelectMode
                                          //     ? Checkbox(
                                          //         activeColor: mainclr,
                                          //         value: isSelected[index],
                                          //         onChanged: (bool? value) {
                                          //           setState(() {
                                          //             isSelected[index] = value!;
                                          //           });
                                          //         },
                                          //       )
                                          //     : null,
                                          title: Text(
                                            'Order ID: ${orders[index].id}',
                                            style: const TextStyle(fontSize: 17),
                                          ),
                                          subtitle: Text(
                                              'Items: ${orders[index].itemCount}, Total: ₹${orders[index].totalPrice}'),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Icon(
                                                Icons.timer_sharp,
                                                color: Color.fromARGB(
                                                    255, 204, 204, 204),
                                                size: 18,
                                              ),
                                              const SizedBox(
                                                width: 6,
                                              ),
                                              Text(orders[index].time),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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
        ],
      ),
    );
  }
}
