import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_kot/application/orders/orders_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/infrastructure/dateOrtime/time_format_change.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';



class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
 

  List<bool> isSelected = [];
  bool isMultiSelectMode = false;

  @override
  void initState() {
    super.initState();
    // isSelected = List<bool>.filled(orders.length, false);
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
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => OrderDetailsPage(
      //       order: Orderr(
      //         id: orders[index].id,
      //         time: orders[index].time,
      //         items: [
      //           OrderItem(
      //             name: 'Biriyani',
      //             image:
      //                 'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
      //             quantity: 5,
      //           ),
      //           OrderItem(
      //             name: 'Chicken Periperi Mandhi',
      //             image:
      //                 'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
      //             quantity: 5,
      //           ),
      //           OrderItem(
      //             name: 'Chicken Biriyani',
      //             image:
      //                 'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
      //             quantity: 5,
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // );
    }
  }

  void mergeOrders() {
    // final selectedOrders = orders
    //     .asMap()
    //     .entries
    //     .where((entry) => isSelected[entry.key])
    //     .map((entry) => entry.value)
    //     .toList();
    // log('Merging Orders: ${selectedOrders.map((o) => o.id).join(', ')}');
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
          // if (isMultiSelectMode)
          //   IconButton(
          //     icon: const Icon(Icons.close),
          //     onPressed: () {
          //       setState(() {
          //         isMultiSelectMode = false;
          //         isSelected = List<bool>.filled(orders.length, false);
          //       });
          //     },
          //   ),
        ],
      ),
      body: RefreshIndicator(
        backgroundColor: mainclr,
        color: mainclrbg,
        onRefresh: () async {
          BlocProvider.of<OrdersBloc>(context).add(const AllOrders());
          // Implement your refresh logic here
        },
        child: BlocBuilder<OrdersBloc, OrdersState>(
          builder: (context, state) {
            return state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : LayoutBuilder(
                    builder: (context, constraints) {
                      return Column(
                        children: [
                          Expanded(
                            child: GridView.builder(
                              padding: const EdgeInsets.all(3),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: childAspectRatio,
                              ),
                              itemCount: state.orders.length,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            children: [
                                              isMultiSelectMode
                                                  ? Checkbox(
                                                      activeColor: mainclr,
                                                      value: isSelected[index],
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isSelected[index] =
                                                              value!;
                                                        });
                                                      },
                                                    )
                                                  : Container(
                                                      decoration: BoxDecoration(
                                                          color: mainclr,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: const Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
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
                                                    '${state.orders[index].orderNumber}',
                                                    style: TextStyle(
                                                      fontSize: textSize,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Total: ₹${state.orders[index].totalAmount.toStringAsFixed(1)}',
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
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Text(
                                                    state.orders[index]
                                                                .tableName ==
                                                            ''
                                                        ? '- -'
                                                        : state.orders[index]
                                                            .tableName,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                            color: Color.fromARGB(
                                                255, 236, 236, 236),
                                          ),
                                          // Order Time
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '',
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
                                                    time(DateTime.parse(state
                                                        .orders[index]
                                                        .startDateTime)),
                                                    style: TextStyle(
                                                      fontSize: textSize - 3,
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 0, 0, 0),
                                                    ),
                                                  ),
                                                  // Text(
                                                  //   time(DateFormat(
                                                  //           "dd/MM/yyyy HH:mm:ss")
                                                  //       .parse(state
                                                  //           .orders[index]
                                                  //           .startDateTime)),
                                                  //   style: TextStyle(
                                                  //     fontSize: textSize - 3,
                                                  //     color:
                                                  //         const Color.fromARGB(
                                                  //             255, 0, 0, 0),
                                                  //   ),
                                                  // ),
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
                              isSelected.where((selected) => selected).length >=
                                  2)
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
                  );
          },
        ),
      ),
    );
  }
}
