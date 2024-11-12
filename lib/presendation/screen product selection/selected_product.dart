import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/order%20details/order_details_bloc.dart';
import 'package:restaurant_kot/application/stock/stock_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/presendation/conn/bluetooth.dart';
import 'package:restaurant_kot/presendation/kot%20submision/re_print.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';

class SelectedProductsPage extends StatelessWidget {
  final String? tableNo;
  final String? orderNo;

  const SelectedProductsPage({
    super.key,
    this.tableNo,
    this.orderNo,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        log('onWillPop');

        BlocProvider.of<StockBloc>(context)
            .add(const StockEvent.typeChange(type: 'Service'));
        return true;
      },
      child: Scaffold(
        backgroundColor: mainclrbg,
        appBar: AppBar(
          backgroundColor: appbarbg,
          title: const Text(
            'Selected Items',
            style: TextStyle(fontSize: 15),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                BlocProvider.of<StockBloc>(context)
                    .add(const StockEvent.clearSelection());
                BlocProvider.of<OrderDetailsBloc>(context).add(
                  const OrderDetailsEvent.clearItemSelection(),
                );

                BlocProvider.of<StockBloc>(context)
                    .add(const StockEvent.typeChange(type: 'Service'));
              },
              child: const Text(
                'Clear All',
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        ),
        body: BlocBuilder<StockBloc, StockState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          decoration: const BoxDecoration(color: mainclr),
                          child: ListTile(
                              title: const Text(
                                'Table No',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              subtitle: const Text(
                                'TB 001',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              trailing: tableNo != null
                                  ? const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Order No',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          'ORD 001',
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    )
                                  : null),
                        ),
                        state.cancelKOTitems.isNotEmpty
                            ? Column(
                                children: [
                                  const SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    '${state.cancelKOTitems.length} ${state.cancelKOTitems.length == 1 ? "Item" : "Items"}', // Make this part bold
                                                style: const TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: mainclr,
                                                ),
                                              ),
                                              const TextSpan(
                                                text:
                                                    ' for cancellation', // Regular style for the rest of the text
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    children: List.generate(
                                      state.cancelKOTitems.length,
                                      (index) {
                                        final product =
                                            state.cancelKOTitems[index];

                                        return Card(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          elevation: 6,
                                          borderOnForeground: true,
                                          shadowColor: const Color.fromARGB(
                                              255, 244, 244, 244),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: ListTile(
                                              onLongPress: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      title: const Text(
                                                          'Remove Item',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      22)),
                                                      content: Text(
                                                        'You want to remove "${product.itemName}" from the list?',
                                                        style: const TextStyle(
                                                            fontSize: 14),
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(),
                                                          child: const Text(
                                                            'Cancel',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            if (state.cancelKOTitems
                                                                        .length ==
                                                                    1 &&
                                                                state.toKOTitems
                                                                    .isEmpty) {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            } else {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            }
                                                            BlocProvider.of<
                                                                        OrderDetailsBloc>(
                                                                    context)
                                                                .add(OrderDetailsEvent
                                                                    .itemAction(
                                                                        from:
                                                                            'cancellist',
                                                                        item:
                                                                            product));
                                                            BlocProvider.of<
                                                                        StockBloc>(
                                                                    context)
                                                                .add(StockEvent
                                                                    .itemAction(
                                                                        from:
                                                                            'cancellist',
                                                                        item:
                                                                            product));
                                                            BlocProvider.of<
                                                                        StockBloc>(
                                                                    context)
                                                                .add(const StockEvent
                                                                    .typeChange(
                                                                    type:
                                                                        'Service'));
                                                          },
                                                          child: const Text(
                                                            'Remove',
                                                            style: TextStyle(
                                                                color: mainclr),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              leading: Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  color: boxbgclr,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                    'https://www.shutterstock.com/shutterstock/photos/2468105649/display_1500/stock-photo--chicken-biryani-quick-and-tasty-chicken-biryani-chicken-dum-biryani-plan-background-2468105649.jpg',
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              title: Text(
                                                product.itemName,
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              subtitle: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: Text(product.quantity ==
                                                        0
                                                    ? '₹ ${product.totalAmount} /-'
                                                    : '₹ ${(double.parse(product.totalAmount) * product.quantity).toDouble()} /-'),
                                              ),
                                              trailing: Text(
                                                '${product.quantity.toString()}  ',
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  // const SizedBox(
                                  //   height: 16,
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(
                                  //       horizontal: 10),
                                  //   child: Row(
                                  //     children: [
                                  //       Expanded(
                                  //         flex: 1,
                                  //         child: MainButton(
                                  //           label: 'Save KOT',
                                  //           onpress: () {
                                  //             // Navigator.push(
                                  //             //     context,
                                  //             //     MaterialPageRoute(
                                  //             //       builder: (context) => const ScreenBluetooth(),
                                  //             //     ));
                                  //           },
                                  //         ),
                                  //       ),
                                  //       const SizedBox(
                                  //         width: 5,
                                  //       ),
                                  //       Expanded(
                                  //         flex: 1,
                                  //         child: ElevatedButton(
                                  //           onPressed: () {},
                                  //           style: ElevatedButton.styleFrom(
                                  //             minimumSize: const Size(
                                  //                 double.infinity,
                                  //                 55), // Full-width button
                                  //             shape: RoundedRectangleBorder(
                                  //               side: const BorderSide(
                                  //                   color: mainclr),
                                  //               borderRadius:
                                  //                   BorderRadius.circular(
                                  //                       20), // Border radius of 10
                                  //             ),
                                  //           ),
                                  //           child: const Text(
                                  //             'Print KOT',
                                  //             style: TextStyle(
                                  //                 color: mainclr,
                                  //                 fontSize: 12,
                                  //                 fontWeight: FontWeight.bold),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              )
                            : const SizedBox(),
                        state.toKOTitems.isNotEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${state.toKOTitems.length} ${state.toKOTitems.length == 1 ? "Item" : "Items"}', // Make this part bold
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: List.generate(
                                      state.toKOTitems.length,
                                      (index) {
                                        final product = state.toKOTitems[index];

                                        return Card(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          elevation: 6,
                                          borderOnForeground: true,
                                          shadowColor: const Color.fromARGB(
                                              255, 244, 244, 244),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: ListTile(
                                              onLongPress: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      title: const Text(
                                                          'Remove Item',
                                                          style: TextStyle(
                                                              fontSize: 22)),
                                                      content: Text(
                                                        'You want to remove "${product.itemName}" from the list?',
                                                        style: const TextStyle(
                                                            fontSize: 14),
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(),
                                                          child: const Text(
                                                            'Cancel',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            if (state.toKOTitems
                                                                        .length ==
                                                                    1 &&
                                                                state
                                                                    .cancelKOTitems
                                                                    .isEmpty) {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            } else {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            }

                                                            BlocProvider.of<
                                                                        OrderDetailsBloc>(
                                                                    context)
                                                                .add(OrderDetailsEvent
                                                                    .itemAction(
                                                                        from:
                                                                            'kotlist',
                                                                        item:
                                                                            product));

                                                            BlocProvider.of<
                                                                        StockBloc>(
                                                                    context)
                                                                .add(StockEvent
                                                                    .itemAction(
                                                                        from:
                                                                            'kotlist',
                                                                        item:
                                                                            product));

                                                            BlocProvider.of<
                                                                        StockBloc>(
                                                                    context)
                                                                .add(const StockEvent
                                                                    .typeChange(
                                                                    type:
                                                                        'Service'));
                                                          },
                                                          child: const Text(
                                                            'Remove',
                                                            style: TextStyle(
                                                                color: mainclr),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              leading: Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  color: boxbgclr,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                    'https://www.shutterstock.com/shutterstock/photos/2468105649/display_1500/stock-photo--chicken-biryani-quick-and-tasty-chicken-biryani-chicken-dum-biryani-plan-background-2468105649.jpg',
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 10,
                                                      top: 8,
                                                      bottom: 8),
                                              title: Text(
                                                product.itemName,
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              subtitle: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: Text(product.quantity ==
                                                        0
                                                    ? '₹ ${product.totalAmount} /-'
                                                    : '₹ ${(double.parse(product.totalAmount) * product.quantity).toDouble()} /-'),
                                              ),
                                              trailing: Text(
                                                'Qty : ${product.quantity.toString()}    ',
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),

                                              // Row(
                                              //   mainAxisSize: MainAxisSize.min,
                                              //   children: [
                                              //     IconButton(
                                              //       icon: Container(
                                              //         decoration: BoxDecoration(
                                              //             color: mainclr,
                                              //             borderRadius:
                                              //                 BorderRadius
                                              //                     .circular(10)),
                                              //         child: const Padding(
                                              //           padding:
                                              //               EdgeInsets.all(5),
                                              //           child: Icon(
                                              //             Icons.remove,
                                              //             color: Colors.white,
                                              //             size: 17,
                                              //           ),
                                              //         ),
                                              //       ),
                                              //       onPressed: () {
                                              //         if (state.toKOTitems
                                              //                     .length ==
                                              //                 1 &&
                                              //             product.quantity == 1 &&
                                              //             state.cancelKOTitems
                                              //                 .isEmpty) {
                                              //           Navigator.pop(context);
                                              //         }
                                              //         BlocProvider.of<
                                              //                     OrderDetailsBloc>(
                                              //                 context)
                                              //             .add(OrderDetailsEvent
                                              //                 .cancelQty(
                                              //           currentItemid:
                                              //               product.itemCode,
                                              //         ));
                                              //         BlocProvider.of<StockBloc>(
                                              //                 context)
                                              //             .add(StockEvent.add(
                                              //                 isIncrement: false,

                                              //                 productid: product
                                              //                     .itemCode,
                                              //                 qty: 1));
                                              //       },
                                              //     ),
                                              // Padding(
                                              //   padding: const EdgeInsets
                                              //       .symmetric(horizontal: 2),
                                              //   child: Text(
                                              //     product.quantity.toString(),
                                              //     style: const TextStyle(
                                              //         fontSize: 17),
                                              //   ),
                                              // ),
                                              //     IconButton(
                                              //       icon: Container(
                                              //         decoration: BoxDecoration(
                                              //             color: mainclr,
                                              //             borderRadius:
                                              //                 BorderRadius
                                              //                     .circular(10)),
                                              //         child: const Padding(
                                              //           padding:
                                              //               EdgeInsets.all(5.0),
                                              //           child: Icon(
                                              //             Icons.add,
                                              //             size: 17,
                                              //             color: Colors.white,
                                              //           ),
                                              //         ),
                                              //       ),
                                              //       onPressed: () {
                                              //         BlocProvider.of<
                                              //                     OrderDetailsBloc>(
                                              //                 context)
                                              //             .add(OrderDetailsEvent
                                              //                 .addQty(
                                              //                     currentItemid:
                                              //                         product
                                              //                             .itemCode));
                                              //         BlocProvider.of<StockBloc>(
                                              //                 context)
                                              //             .add(StockEvent.add(
                                              //                 isIncrement: true,

                                              //                 productid: product
                                              //                     .itemCode,
                                              //                 qty: 1));
                                              //       },
                                              //     ),
                                              //   ],
                                              // ),
                                              // onLongPress: () {
                                              //   // updatebox(
                                              //   //     context: context,
                                              //   //     productid: product.itemCode,
                                              //   //     qty: product.quantity.toString(),
                                              //   //     serOrGoods: product.serOrGoods,
                                              //   //     stock: 0,
                                              //   //     saleAmount: product.totalAmount);
                                              //   log('onLongPress ser');
                                              // },
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 12),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: boxbgwhite,
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color.fromARGB(
                                                    255, 103, 103, 103)
                                                .withOpacity(0.3),
                                            blurRadius: 15,
                                            spreadRadius: 5,
                                            offset: const Offset(0, 5),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'If any note, please add here',
                                              style: TextStyle(
                                                color: mainclr,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            TextFormField(
                                              keyboardType: TextInputType.text,
                                              obscureText: false,
                                              validator: (value) {
                                                return null; // No validation
                                              },
                                              decoration: InputDecoration(
                                                labelText: 'Note',
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 192, 192, 192),
                                                  ),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 192, 192, 192),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 192, 192, 192),
                                                  ),
                                                ),
                                                prefixIcon: const Icon(
                                                    Icons.note_alt_outlined),
                                                prefixIconColor: mainclr,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text('Parcel Order'),
                                                Checkbox(
                                                  activeColor: mainclr,
                                                  value: true,
                                                  onChanged: (bool? value) {},
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // const SizedBox(height: 12),
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(
                                  //       horizontal: 10),
                                  //   child: Row(
                                  //     children: [
                                  //       Expanded(
                                  //         flex: 1,
                                  //         child: MainButton(
                                  //           label: 'Save KOT',
                                  //           onpress: () {
                                  //             // Navigator.push(
                                  //             //     context,
                                  //             //     MaterialPageRoute(
                                  //             //       builder: (context) => const ScreenBluetooth(),
                                  //             //     ));
                                  //           },
                                  //         ),
                                  //       ),
                                  //       const SizedBox(
                                  //         width: 5,
                                  //       ),
                                  //       Expanded(
                                  //         flex: 1,
                                  //         child: ElevatedButton(
                                  //           onPressed: () {},
                                  //           style: ElevatedButton.styleFrom(
                                  //             minimumSize: const Size(
                                  //                 double.infinity,
                                  //                 55), // Full-width button
                                  //             shape: RoundedRectangleBorder(
                                  //               side: const BorderSide(
                                  //                   color: mainclr),
                                  //               borderRadius:
                                  //                   BorderRadius.circular(
                                  //                       20), // Border radius of 10
                                  //             ),
                                  //           ),
                                  //           child: const Text(
                                  //             'Print KOT',
                                  //             style: TextStyle(
                                  //                 color: mainclr,
                                  //                 fontSize: 12,
                                  //                 fontWeight: FontWeight.bold),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: MainButton(
                      label: 'Submit & Print KOT',
                      onpress: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const ScreenBluetooth(),
                        //     ));

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RePrintPage(),
                            ));
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
