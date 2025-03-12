import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/KotSubmitPrint/kot_submit_print_bloc.dart';
import 'package:restaurant_kot/application/customerpart/customerpart_bloc.dart';
import 'package:restaurant_kot/application/login%20b/login_bloc.dart';
import 'package:restaurant_kot/application/order%20details/order_details_bloc.dart';
import 'package:restaurant_kot/application/printer%20setup/printer_setup_bloc.dart';
import 'package:restaurant_kot/application/stock/stock_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/domain/item/kot_item_model.dart';
import 'package:restaurant_kot/domain/printer/priter_config.dart';
import 'package:restaurant_kot/infrastructure/check%20printer%20congiration/check_printer_congiration.dart';
import 'package:restaurant_kot/infrastructure/img.dart';
import 'package:restaurant_kot/presendation/kot%20submision/kot_submision_success.dart';
import 'package:restaurant_kot/presendation/kot%20submision/re_print.dart';
import 'package:restaurant_kot/presendation/settings/screen%20customers/customer_list.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/widgets/img.dart';
import 'package:restaurant_kot/presendation/settings/printer/kitchen_listing.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';
import 'package:shimmer/shimmer.dart';

class SelectedProductsPage extends StatelessWidget {
  final TableInfo table;
  final String? orderNo;
  final String billNo;

  SelectedProductsPage({
    super.key,
    required this.table,
    required this.billNo,
    this.orderNo,
  });
  TextEditingController noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
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
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: appbarbg,
          title: const Text(
            'Selected Items',
            style: TextStyle(fontSize: 15, color: Colors.white),
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
                'Clear All  ',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        body: BlocBuilder<StockBloc, StockState>(
          builder: (context, state) {
            final customer =
                context.read<CustomerpartBloc>().state.selectedcustomer!;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: mainclr,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: Column(
                              children: [
                                ListTile(
                                    title: const Text(
                                      'Table No',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle: Text(
                                      table.tableName,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    trailing: orderNo != null
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              const Text(
                                                'Order No',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                orderNo!,
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          )
                                        : null),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Divider(
                                    height: 1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'To -',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //       builder: (context) =>
                                            //           const CustomerView(),
                                            //     ));
                                          },
                                          icon: Row(
                                            children: [
                                              Text(
                                                customer.bussinessname,
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              // Icon(
                                              //   Icons.arrow_right_rounded,
                                              //   color: Colors.white,
                                              // )
                                            ],
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
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

                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Column(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: ListTile(
                                                
                                                  onLongPress: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                          ),
                                                          title: const Text(
                                                              'Remove Item',
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          22)),
                                                          content: Text(
                                                            'You want to remove "${product.itemName}" from the list?',
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        14),
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
                                                                    state
                                                                        .toKOTitems
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
                                                                    .add(OrderDetailsEvent.itemAction(
                                                                        from:
                                                                            'cancellist',
                                                                        item:
                                                                            product));
                                                                BlocProvider.of<
                                                                            StockBloc>(
                                                                        context)
                                                                    .add(StockEvent.itemAction(
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
                                                                    color:
                                                                        mainclr),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 8),
                                                  leading: Container(
                                                      height: 55,
                                                      width: 55,
                                                      decoration: BoxDecoration(
                                                        color: boxbgclr,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image.network(
                                                          getimgpath(product
                                                              .productImg),
                                                          fit: BoxFit.fill,
                                                          errorBuilder:
                                                              (context, error,
                                                                  stackTrace) {
                                                            // Fallback error image
                                                            return Image.asset(
                                                              'assets/img/no data/noimg.png',
                                                              fit: BoxFit.fill,
                                                            );
                                                          },
                                                        ),
                                                      )),
                                                  title: Text(
                                                    product.itemName,
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  subtitle: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5),
                                                    child: Text(product
                                                                .quantity ==
                                                            0
                                                        ? '₹ ${product.basicRate.abs()} /-'
                                                        : '₹ ${(product.basicRate * product.quantity).abs()} /-'),
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
                                              Divider()
                                            ],
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

                                        return Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Column(
                                            children: [
                                              ListTile(
                                               
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
                                                          style:
                                                              const TextStyle(
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
                                                                  color:
                                                                      mainclr),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                leading: Container(
                                                    height: 55,
                                                    width: 55,
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
                                                        getimgpath(
                                                            product.productImg),
                                                        fit: BoxFit.fill,
                                                        errorBuilder: (context,
                                                            error, stackTrace) {
                                                          // Fallback error image
                                                          return Image.asset(
                                                            'assets/img/no data/noimg.png',
                                                            fit: BoxFit.fill,
                                                          );
                                                        },
                                                      ),
                                                    )),
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5),
                                                  child: Text(product
                                                              .quantity ==
                                                          0
                                                      ? '₹ ${product.basicRate} /-'
                                                      : '₹ ${product.basicRate * product.quantity} /-'),
                                                ),
                                                trailing: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    IconButton(
                                                        icon: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.red,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5),
                                                            child: Icon(
                                                                Icons.remove,
                                                                color: Colors
                                                                    .white,
                                                                size: 17),
                                                          ),
                                                        ),
                                                        // Add this at the top of your widget class

                                                        onPressed: () {
                                                          // int value = 0;
                                                          // if (state
                                                          //         .orderitems[
                                                          //             index]
                                                          //         .quantity <
                                                          //     0) {
                                                          //   value = state
                                                          //           .orderitems[
                                                          //               index]
                                                          //           .qty -
                                                          //       state
                                                          //           .orderitems[
                                                          //               index]
                                                          //           .quantity
                                                          //           .abs();
                                                          // }

                                                          if (product
                                                                  .quantity !=
                                                              1) {
                                                            log('calling ---');
                                                            BlocProvider.of<
                                                                        StockBloc>(
                                                                    context)
                                                                .add(StockEvent.add(
                                                                    item:
                                                                        product,
                                                                    isIncrement:
                                                                        false,
                                                                    productid:
                                                                        product
                                                                            .itemCode,
                                                                    qty: 1));

                                                            // Your code here

                                                            BlocProvider.of<
                                                                        OrderDetailsBloc>(
                                                                    context)
                                                                .add(OrderDetailsEvent.cancelQty(
                                                                    kotno: product
                                                                        .kotno,
                                                                    currentItemid:
                                                                        product
                                                                            .itemCode));
                                                          } else {
                                                            log('remove ---');
                                                            showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return AlertDialog(
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                  ),
                                                                  title: const Text(
                                                                      'Remove Item',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              22)),
                                                                  content: Text(
                                                                    'You want to remove "${product.itemName}" from the list?',
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            14),
                                                                  ),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.of(context).pop(),
                                                                      child:
                                                                          const Text(
                                                                        'Cancel',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.grey),
                                                                      ),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        if (state.toKOTitems.length ==
                                                                                1 &&
                                                                            state.cancelKOTitems.isEmpty) {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        } else {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        }

                                                                        BlocProvider.of<OrderDetailsBloc>(context).add(OrderDetailsEvent.itemAction(
                                                                            from:
                                                                                'kotlist',
                                                                            item:
                                                                                product));

                                                                        BlocProvider.of<StockBloc>(context).add(StockEvent.itemAction(
                                                                            from:
                                                                                'kotlist',
                                                                            item:
                                                                                product));

                                                                        BlocProvider.of<StockBloc>(context).add(const StockEvent
                                                                            .typeChange(
                                                                            type:
                                                                                'Service'));
                                                                      },
                                                                      child:
                                                                          const Text(
                                                                        'Remove',
                                                                        style: TextStyle(
                                                                            color:
                                                                                mainclr),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          }
                                                        }),
                                                    Text(
                                                      product.quantity
                                                          .toString(),
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    IconButton(
                                                        icon: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.green,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5),
                                                            child: Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .white,
                                                                size: 17),
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          // if (product
                                                          //         .quantity !=
                                                          //     1) {
                                                          BlocProvider.of<
                                                                      StockBloc>(
                                                                  context)
                                                              .add(StockEvent.add(
                                                                  item: product,
                                                                  isIncrement:
                                                                      true,
                                                                  productid: product
                                                                      .itemCode,
                                                                  qty: 1));
                                                          // }

                                                          BlocProvider.of<
                                                                      OrderDetailsBloc>(
                                                                  context)
                                                              .add(OrderDetailsEvent.addQty(
                                                                  kotno: product
                                                                      .kotno,
                                                                  currentItemid:
                                                                      product
                                                                          .itemCode));
                                                        }),
                                                  ],
                                                ),
                                              ),
                                              const Divider(
                                                height: 0,
                                              )
                                            ],
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
                                              controller: noteController,
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
                                                BlocBuilder<KotSubmitPrintBloc,
                                                    KotSubmitPrintState>(
                                                  builder: (context, state) {
                                                    return Checkbox(
                                                      activeColor: mainclr,
                                                      value: state.parcel,
                                                      onChanged: (bool? value) {
                                                        BlocProvider.of<
                                                                    KotSubmitPrintBloc>(
                                                                context)
                                                            .add(KotSubmitPrintEvent
                                                                .parcel(
                                                                    parcel:
                                                                        value!));
                                                      },
                                                    );
                                                  },
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                  BlocConsumer<KotSubmitPrintBloc, KotSubmitPrintState>(
                    listener: (context, astate) {
                      if (astate.submitstatus == 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BillSubmitedDone(
                                onpress: () {
                                  BlocProvider.of<KotSubmitPrintBloc>(context)
                                      .add(KotSubmitPrintEvent.rePrint(
                                          cancel: false,
                                          cancellist: [],
                                          userId: context
                                                  .read<LoginBloc>()
                                                  .state
                                                  .userId ??
                                              '--',
                                          printers: context
                                              .read<PrinterSetupBloc>()
                                              .state
                                              .priterlist,
                                          table: table,
                                          kotitems: state.toKOTitems,
                                          note: noteController.text,
                                          kotretunitems: state.cancelKOTitems,
                                          currentorderid: orderNo,
                                          currentitems: context
                                              .read<OrderDetailsBloc>()
                                              .state
                                              .orderitems));
                                },
                              ),
                            ));
                      }

                      if (astate.stockout) {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          builder: (context) {
                            // Adjust height based on list length, but with a maximum height
                            double height =
                                (astate.outofStock.length * 210).toDouble();
                            height = height >
                                    MediaQuery.of(context).size.height * 0.6
                                ? MediaQuery.of(context).size.height * 0.6
                                : height;

                            return SizedBox(
                              height: height,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  const Text(
                                    "Sorry",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 5),
                                    child: Text(
                                      "Some Items Have Limited Stock",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  const Divider(),
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: astate.outofStock.length,
                                      itemBuilder: (context, index) {
                                        var product = astate.outofStock[index];
                                        return Column(
                                          children: [
                                            ListTile(
                                              leading: const Icon(Icons.warning,
                                                  color: Colors.red),
                                              title: Text(product.itemName),
                                              subtitle: Text(
                                                  'Only Available Qty : ${product.stock}'),
                                            ),
                                            const Divider()
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                    builder: (context, astate) {
                      return astate.isLoading
                          ? const LinearProgressIndicator(color: mainclr)
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: MainButton(
                                label: 'Submit & Print KOT',
                                onpress: () {
                                  showModalBottomSheet(
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20)),
                                    ),
                                    builder: (BuildContext context) {
                                      bool kotPrint = true;
                                      bool cancelKotPrint = true;

                                      return StatefulBuilder(
                                        builder: (BuildContext context,
                                            StateSetter setState) {
                                          return Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Text(
                                                  'Preferences',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                const Divider(),
                                                state.toKOTitems.isNotEmpty
                                                    ? ListTile(
                                                        title: const Text(
                                                          'KOT Print',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        subtitle: const Text(
                                                          'Enable if you want to print the KOT.',
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                        trailing: Checkbox(
                                                          value: kotPrint,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              kotPrint =
                                                                  value ??
                                                                      false;
                                                            });
                                                          },
                                                        ),
                                                      )
                                                    : const SizedBox(),
                                                state.cancelKOTitems.isNotEmpty
                                                    ? ListTile(
                                                        title: const Text(
                                                          'Cancel KOT Print',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        subtitle: const Text(
                                                          'Enable if you want to cancel the KOT print.',
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                        trailing: Checkbox(
                                                          value: cancelKotPrint,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              cancelKotPrint =
                                                                  value ??
                                                                      false;
                                                            });
                                                          },
                                                        ),
                                                      )
                                                    : SizedBox(),
                                                SizedBox(height: 20),
                                                MainButton(
                                                    label: 'Confirm',
                                                    onpress: () {
                                                      Navigator.pop(context);
                                                      bool iSAdded = context
                                                                  .read<
                                                                      PrinterSetupBloc>()
                                                                  .state
                                                                  .priterlist ==
                                                              null
                                                          ? false
                                                          : checkPrinters(
                                                              cancelKotItems: state
                                                                  .cancelKOTitems,
                                                              printers: context
                                                                  .read<
                                                                      PrinterSetupBloc>()
                                                                  .state
                                                                  .priterlist!,
                                                              kotItems: state
                                                                  .toKOTitems,
                                                            );
                                                      if (iSAdded) {
                                                        BlocProvider.of<KotSubmitPrintBloc>(context).add(KotSubmitPrintEvent.submitAndPrint(
                                                            billNumber: billNo,
                                                            cancelKotPrint:
                                                                cancelKotPrint,
                                                            kotPrint: kotPrint,
                                                            userId: context
                                                                    .read<
                                                                        LoginBloc>()
                                                                    .state
                                                                    .userId ??
                                                                '--',
                                                            printers: context
                                                                .read<
                                                                    PrinterSetupBloc>()
                                                                .state
                                                                .priterlist,
                                                            selectedcustomer: context
                                                                .read<
                                                                    CustomerpartBloc>()
                                                                .state
                                                                .selectedcustomer!,
                                                            table: table,
                                                            kotitems: state
                                                                .toKOTitems,
                                                            note: noteController
                                                                .text,
                                                            kotretunitems: state
                                                                .cancelKOTitems,
                                                            currentorderid:
                                                                orderNo,
                                                            currentitems: context
                                                                .read<
                                                                    OrderDetailsBloc>()
                                                                .state
                                                                .orderitems));
                                                      } else {
                                                        Navigator.push(context,
                                                            MaterialPageRoute(
                                                          builder: (context) {
                                                            return const KitchensPage();
                                                          },
                                                        ));

                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          const SnackBar(
                                                            content: Column(
                                                              children: [
                                                                Text(
                                                                  "Sorry",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "Please Add KOT Printers",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        12,
                                                                    // fontWeight: FontWeight.bold,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            backgroundColor:
                                                                mainclr,
                                                            behavior:
                                                                SnackBarBehavior
                                                                    .floating,
                                                            margin:
                                                                EdgeInsets.all(
                                                                    12),
                                                            duration: Duration(
                                                                seconds: 4),
                                                          ),
                                                        );
                                                      }
                                                    })
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                    },
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

// void showCustomBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//     ),
//     builder: (BuildContext context) {
//       bool kotPrint = true;
//       bool cancelKotPrint = true;

//       return StatefulBuilder(
//         builder: (BuildContext context, StateSetter setState) {
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Text(
//                   'Preferences',
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Divider(),
//                 ListTile(
//                   title: const Text(
//                     'KOT Print',
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   subtitle: Text(
//                     'Enable if you want to print the KOT.',
//                     style: TextStyle(fontSize: 13, color: Colors.grey),
//                   ),
//                   trailing: Checkbox(
//                     value: kotPrint,
//                     onChanged: (value) {
//                       setState(() {
//                         kotPrint = value ?? false;
//                       });
//                     },
//                   ),
//                 ),
//                 ListTile(
//                   title: const Text(
//                     'Cancel KOT Print',
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   subtitle: Text(
//                     'Enable if you want to cancel the KOT print.',
//                     style: TextStyle(fontSize: 13, color: Colors.grey),
//                   ),
//                   trailing: Checkbox(
//                     value: cancelKotPrint,
//                     onChanged: (value) {
//                       setState(() {
//                         cancelKotPrint = value ?? false;
//                       });
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 MainButton(label: 'Confirm', onpress: () {})
//               ],
//             ),
//           );
//         },
//       );
//     },
//   );
// }
