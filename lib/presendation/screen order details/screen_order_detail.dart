import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/order%20details/order_details_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/domain/orders/order_model.dart';
import 'package:restaurant_kot/infrastructure/dateOrtime/time_format_change.dart';
import 'package:restaurant_kot/presendation/screen%20bill%20preview/screen_bill.dart';
import 'package:restaurant_kot/presendation/screen%20order%20details/table_view.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/screen_product_selection.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key, required this.order});
  final Order order;
  // late List<OrderItem> _items;
  @override
  // void initState() {
  //   super.initState();
  //   _items = widget.order.items;
  // }

  // void _changeQuantity(OrderItem item, int change) {
  //   setState(() {
  //     item.quantity += change;
  //     if (item.quantity < 0) item.quantity = 0; // Prevent negative quantity
  //     _isPrintKOTEnabled = _items.any((i) => i.quantity > 0);
  //     _isNewItemButtonEnabled = _items.every((i) => i.quantity > 0);
  //   });
  // }

  // void _changeTable() {
  //   // Logic to change the table, show a dialog or navigation for table selection
  //   // Example confirmation dialog
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text('Change Table'),
  //         content: Text('Select a new table'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('Confirm'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // void _printBill() {
  //   // Logic to navigate to the bill page
  //   print('Navigating to Bill Page...');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainclrbg,
      appBar: AppBar(
        backgroundColor: appbarbg,
        title: const Center(
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
      body: RefreshIndicator(    backgroundColor: mainclr,
      color: mainclrbg,
        onRefresh: () async {
          BlocProvider.of<OrderDetailsBloc>(context)
              .add(OrderDetailsEvent.orderItems(orderNo: order.orderNumber));
        },
        child: BlocBuilder<OrderDetailsBloc, OrderDetailsState>(
          builder: (context, state) {
            return state.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: boxbgwhite,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: [
                                  ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 0),
                                    splashColor:
                                        const Color.fromARGB(0, 255, 255, 255),
                                    tileColor:
                                        const Color.fromARGB(0, 255, 255, 255),
                                    title: Text(
                                      order.orderNumber,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    trailing: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(color: mainclr),
                                            borderRadius: BorderRadius.circular(
                                                20), // Border radius of 10
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return ProductChoosingPage();
                                            },
                                          ));
                                        },
                                        child: const Text(
                                          'Add New Item',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: mainclr,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    subtitle:
                                        Text('Total: ₹ ${order.totalAmount}'),
                                    leading: Container(
                                        decoration: BoxDecoration(
                                            color: mainclr,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 10),
                                          child: Text(
                                            order.tableName,
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        )),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                            color: mainclrbg),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              const Icon(
                                                Icons.timer_sharp,
                                                color: mainclr,
                                                size: 17,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                time(DateTime.parse(
                                                    order.startDateTime)),
                                                style: const TextStyle(
                                                    color: mainclr,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(
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
                                          child: const Row(
                                            children: [
                                              Text(
                                                'Change Table',
                                                style: TextStyle(
                                                    color: mainclr,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Icon(
                                                Icons.arrow_right_outlined,
                                                color: mainclr,
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  )
                                ],
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 14),
                              child: Text(
                                ' ${state.orderitems.length} Items',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            // Item List
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                child: Column(
                                  children: List.generate(
                                    state.orderitems.length,
                                    (index) {
                                      return Card(
                                        margin: const EdgeInsets.only(
                                            right: 7, left: 7, bottom: 7),
                                        elevation: 3,
                                        borderOnForeground: true,
                                        shadowColor: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 8),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 60,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                    color: boxbgclr,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.network(
                                                      'https://www.shutterstock.com/shutterstock/photos/2468105649/display_1500/stock-photo--chicken-biryani-quick-and-tasty-chicken-biryani-chicken-dum-biryani-plan-background-2468105649.jpg',
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      state.orderitems[index]
                                                          .itemName,
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text('Amount : ₹ 150/-',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                        )),
                                                  ],
                                                ),
                                                Spacer(),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        IconButton(
                                                          icon: Container(
                                                              decoration: BoxDecoration(
                                                                  color: index ==
                                                                          1
                                                                      ? Colors
                                                                          .red
                                                                      : mainclr,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              child:
                                                                  const Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(5),
                                                                child: Icon(
                                                                  Icons.remove,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 17,
                                                                ),
                                                              )),
                                                          onPressed: () {
                                                            // _changeQuantity(item, -1);
                                                          },
                                                        ),
                                                        index != 1
                                                            ? const Text(
                                                                '2',
                                                                style: TextStyle(
                                                                    color:
                                                                        mainclr,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        17),
                                                              )
                                                            : const SizedBox(),
                                                        IconButton(
                                                          icon: Container(
                                                              decoration: BoxDecoration(
                                                                  color:
                                                                      mainclr,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              child:
                                                                  const Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(5),
                                                                child: Icon(
                                                                  Icons.add,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 17,
                                                                ),
                                                              )),
                                                          onPressed: () {
                                                            // _changeQuantity(item, 1);
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          const TextSpan(
                                                            text: 'Qty : ',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'Montserrat',
                                                              color: Colors
                                                                  .black, // You can set any color you prefer
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: state
                                                                .orderitems[
                                                                    index]
                                                                .qty
                                                                .toString(),
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontWeight: FontWeight
                                                                  .bold, // Change the style for the number
                                                              color: Colors
                                                                  .red, // You can also change the color for emphasis
                                                            ),
                                                          ),
                                                          const TextSpan(
                                                            text:
                                                                '    ', // Adding space after the number
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )

                                            // ListTile(
                                            //   contentPadding: EdgeInsets.only(
                                            //       top: 10,
                                            //       bottom: 10,
                                            //       left: 10,
                                            //       right: 4),
                                            //   leading: Container(
                                            //     height: 100,
                                            //     width: 60,
                                            //     decoration: BoxDecoration(
                                            //       color: boxbgclr,
                                            //       borderRadius:
                                            //           BorderRadius.circular(10),
                                            //     ),
                                            //     child: ClipRRect(
                                            //       borderRadius:
                                            //           BorderRadius.circular(10),
                                            //       child: Image.network(
                                            //         'https://www.shutterstock.com/shutterstock/photos/2468105649/display_1500/stock-photo--chicken-biryani-quick-and-tasty-chicken-biryani-chicken-dum-biryani-plan-background-2468105649.jpg',
                                            //         fit: BoxFit.fill,
                                            //       ),
                                            //     ),
                                            //   ), // Replace with asset image if needed
                                            //   title: Text(
                                            //     state.orderitems[index].itemName,
                                            //     style: const TextStyle(
                                            //         fontSize: 14,
                                            //         fontWeight: FontWeight.w600),
                                            //   ),
                                            //   subtitle: const Text('Amount : ₹ 150/-',
                                            //       style: TextStyle(
                                            //         fontSize: 12,
                                            //       )),
                                            //   trailing: Column(
                                            //     children: [
                                            //       Row(
                                            //         mainAxisSize: MainAxisSize.min,
                                            //         children: [
                                            //           IconButton(
                                            //             icon: Container(
                                            //                 decoration: BoxDecoration(
                                            //                     color: index == 2
                                            //                         ? Colors.red
                                            //                         : mainclr,
                                            //                     borderRadius:
                                            //                         BorderRadius
                                            //                             .circular(
                                            //                                 10)),
                                            //                 child: const Padding(
                                            //                   padding:
                                            //                       EdgeInsets.all(5),
                                            //                   child: Icon(
                                            //                     Icons.remove,
                                            //                     color: Colors.white,
                                            //                     size: 17,
                                            //                   ),
                                            //                 )),
                                            //             onPressed: () {
                                            //               // _changeQuantity(item, -1);
                                            //             },
                                            //           ),
                                            //           index != 1
                                            //               ? const Text(
                                            //                   '2',
                                            //                   style: TextStyle(
                                            //                       color: mainclr,
                                            //                       fontWeight:
                                            //                           FontWeight
                                            //                               .bold,
                                            //                       fontSize: 17),
                                            //                 )
                                            //               : const SizedBox(),
                                            //           IconButton(
                                            //             icon: Container(
                                            //                 decoration: BoxDecoration(
                                            //                     color: mainclr,
                                            //                     borderRadius:
                                            //                         BorderRadius
                                            //                             .circular(
                                            //                                 10)),
                                            //                 child: const Padding(
                                            //                   padding:
                                            //                       EdgeInsets.all(5),
                                            //                   child: Icon(
                                            //                     Icons.add,
                                            //                     color: Colors.white,
                                            //                     size: 17,
                                            //                   ),
                                            //                 )),
                                            //             onPressed: () {
                                            //               // _changeQuantity(item, 1);
                                            //             },
                                            //           ),
                                            //         ],
                                            //       ),
                                            //       const Text('Orderd Qty : 5'),
                                            //     ],
                                            //   ),
                                            // ),
                                            ),
                                      );
                                    },
                                  ),
                                )),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: MainButton(
                            label: 'Print KOT',
                            onpress: () {
                              //  _isPrintKOTEnabled ? _printKOT : null
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, right: 12, left: 12),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // backgroundColor: buttonclr, // Set the button background color

                              minimumSize: Size(
                                  double.infinity, 55), // Full-width button
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: mainclr),
                                borderRadius: BorderRadius.circular(
                                    20), // Border radius of 10
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
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: mainclr),
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
                  );
          },
        ),
      ),
    );
  }
}
