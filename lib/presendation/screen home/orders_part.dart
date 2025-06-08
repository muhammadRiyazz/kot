import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/order%20details/order_details_bloc.dart';
import 'package:restaurant_kot/application/orders/orders_bloc.dart';
import 'package:restaurant_kot/application/printer%20setup/printer_setup_bloc.dart';
import 'package:restaurant_kot/application/stock/stock_bloc.dart';
import 'package:restaurant_kot/application/tables/tables_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/domain/item/kot_item_model.dart';
import 'package:restaurant_kot/domain/printer/priter_config.dart';
import 'package:restaurant_kot/infrastructure/dateOrtime/time_format_change.dart';
import 'package:restaurant_kot/presendation/screen%20home/loadings.dart';
import 'package:restaurant_kot/presendation/screen%20order%20details/screen_order_detail.dart';
import 'package:restaurant_kot/presendation/settings/printer/printer_page.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  _onTap(int index, OrdersState state, BuildContext context) {
    if (state.isMultiSelectMode) {
      if (state.orders[index].billNumber == '' &&
          state.orders[index].creditOrPaid != 'Credit') {
        BlocProvider.of<OrdersBloc>(context)
            .add(OrdersEvent.ontap(item: state.orders[index]));
      }
    } else {
      BlocProvider.of<StockBloc>(context)
          .add(const StockEvent.clearSelection());
      BlocProvider.of<OrderDetailsBloc>(context)
          .add(const OrderDetailsEvent.clearItemSelection());
      final List<TableInfo> tablelist =
          context.read<TablesBloc>().state.tablesinfolist;

      // Find the specific table with the name 'tb1'
      TableInfo table = tablelist.firstWhere(
        (table) => table.tableName == state.orders[index].tableName,
        orElse: () {
          throw Exception('Table not found');
        }, // Handle if table is not found
      );

      BlocProvider.of<OrderDetailsBloc>(context).add(
          OrderDetailsEvent.orderItems(
              orderNo: state.orders[index].orderNumber));
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return OrderDetailsPage(
            table: table,
            order: state.orders[index],
          );
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Determine screen size for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine the number of grid columns based on screen width
    int crossAxisCount = 1;
    if (screenWidth >= 1100) {
      crossAxisCount = 3;
    } else if (screenWidth >= 900) {
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
        childAspectRatio = 3;
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

    return BlocConsumer<OrdersBloc, OrdersState>(
      listener: (context, state) {
        if (state.mergeStatus == 1) {
          BlocProvider.of<OrdersBloc>(context).add(const AllOrders());

          const snackBar = SnackBar(
            content: Row(
              children: [
                Icon(Icons.domain_verification, color: Colors.white, size: 24),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Orders Merged",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            backgroundColor: mainclr,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(16),
            duration: Duration(seconds: 3),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Running Orders',
              style: TextStyle(fontSize: 19),
            ),
            actions: [
              if (state.isMultiSelectMode)
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    BlocProvider.of<OrdersBloc>(context)
                        .add(const OrdersEvent.clearitem());
                  },
                ),
            ],
          ),
          body: RefreshIndicator(
            backgroundColor: mainclr,
            color: mainclrbg,
            onRefresh: () async {
              BlocProvider.of<OrdersBloc>(context).add(const AllOrders());
              // Implement your refresh logic here
            },
            child: LayoutBuilder(
              builder: (context, constraints) {
                return state.isLoading
                    ? ordersloading()
                    : state.orders.isEmpty
                        ? RefreshIndicator(
                            onRefresh: () async {
                              BlocProvider.of<OrdersBloc>(context)
                                  .add(const AllOrders());
                            },
                            child: SingleChildScrollView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              child: SizedBox(
                                height: constraints.maxHeight,
                                child: Center(
                                  child: Image.asset(
                                      'assets/img/no data/No_data.png'),
                                ),
                              ),
                            ),
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
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: InkWell(
                                            onTap: () =>
                                                _onTap(index, state, context),
                                            onLongPress: () {
                                              if (state.orders[index]
                                                          .billNumber !=
                                                      '' &&
                                                  state.orders[index]
                                                          .creditOrPaid ==
                                                      'Credit') {
                                                log('not select');
                                              } else {
                                                BlocProvider.of<OrdersBloc>(
                                                        context)
                                                    .add(
                                                  OrdersEvent.longpress(
                                                      item:
                                                          state.orders[index]),
                                                );
                                              }
                                            },
                                            child: LayoutBuilder(
                                              builder: (context, constraints) {
                                                return Container(
                                                  padding: EdgeInsets.all(
                                                      boxPadding + 5),
                                                  decoration: BoxDecoration(
                                                    color: boxbgwhite,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          state.orders[index]
                                                                          .billNumber ==
                                                                      '' &&
                                                                  state.orders[index]
                                                                          .creditOrPaid ==
                                                                      'Credit' &&
                                                                  state.isMultiSelectMode
                                                              ? Checkbox(
                                                                  activeColor:
                                                                      mainclr,
                                                                  value: state
                                                                      .isSelected
                                                                      .contains(
                                                                          state.orders[
                                                                              index]),
                                                                  onChanged:
                                                                      (bool?
                                                                          value) {
                                                                    BlocProvider.of<OrdersBloc>(
                                                                            context)
                                                                        .add(
                                                                      OrdersEvent.ontap(
                                                                          item:
                                                                              state.orders[index]),
                                                                    );
                                                                  },
                                                                )
                                                              : Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: state.orders[index].billNumber !=
                                                                                '' &&
                                                                            state.orders[index].creditOrPaid ==
                                                                                'Credit'
                                                                        ? Colors
                                                                            .red
                                                                        : mainclr,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  child:
                                                                      const Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            10.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .restaurant,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ),
                                                          const SizedBox(
                                                              width: 10),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text.rich(
                                                                TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: state
                                                                          .orders[
                                                                              index]
                                                                          .orderNumber
                                                                          .substring(
                                                                              0,
                                                                              3), // First 3 letters
                                                                      style:
                                                                          const TextStyle(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            184,
                                                                            12,
                                                                            0), // Change this to your desired color
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: state
                                                                          .orders[
                                                                              index]
                                                                          .orderNumber
                                                                          .substring(
                                                                              3), // Remaining part
                                                                      style:
                                                                          const TextStyle(
                                                                        color: Colors
                                                                            .black, // Change this to your desired color
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Text(
                                                                'Total: ₹${state.orders[index].totalAmount.toStringAsFixed(1)}',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      textSize -
                                                                          2,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Spacer(),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: state.orders[index].billNumber !=
                                                                          '' &&
                                                                      state.orders[index]
                                                                              .creditOrPaid ==
                                                                          'Credit'
                                                                  ? Colors.red
                                                                  : mainclr,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                      10.0),
                                                              child: Text(
                                                                state.orders[index].tableName ==
                                                                        ''
                                                                    ? '- -'
                                                                    : state
                                                                        .orders[
                                                                            index]
                                                                        .tableName,
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      textSize -
                                                                          4,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const Divider(
                                                        color: Color.fromARGB(
                                                            255, 236, 236, 236),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              if (state
                                                                      .orders[
                                                                          index]
                                                                      .mergedorNot ==
                                                                  'Merged') ...[
                                                                // Text(
                                                                //   state
                                                                //       .orders[
                                                                //           index]
                                                                //       .billNumber,
                                                                //   style:
                                                                //       const TextStyle(
                                                                //     fontWeight:
                                                                //         FontWeight
                                                                //             .w600,
                                                                //     color: Colors
                                                                //         .black,
                                                                //   ),
                                                                // ),
                                                                const Icon(
                                                                  Icons
                                                                      .info_outline,
                                                                  size: 15,
                                                                ),
                                                                const Text(
                                                                  ' Merged -  ',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    color:
                                                                        mainclr,
                                                                  ),
                                                                ),
                                                              ],
                                                              if (state
                                                                          .orders[
                                                                              index]
                                                                          .billNumber !=
                                                                      '' &&
                                                                  state.orders[index]
                                                                          .creditOrPaid ==
                                                                      'Credit') ...[
                                                                Text(
                                                                  state
                                                                      .orders[
                                                                          index]
                                                                      .billNumber,
                                                                  style:
                                                                      const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                ),
                                                                const Text(
                                                                  '  (UnPaid)',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    color: Colors
                                                                        .red,
                                                                  ),
                                                                ),
                                                              ],
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              const Icon(
                                                                Icons
                                                                    .timer_sharp,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        204,
                                                                        204,
                                                                        204),
                                                                size: 18,
                                                              ),
                                                              const SizedBox(
                                                                  width: 6),
                                                              Text(
                                                                time(DateTime
                                                                    .parse(state
                                                                        .orders[
                                                                            index]
                                                                        .startTime)),
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      textSize -
                                                                          3,
                                                                  color: const Color
                                                                      .fromARGB(
                                                                      255,
                                                                      0,
                                                                      0,
                                                                      0),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      // if (state.orders[index]
                                                      //         .mergedorNot ==
                                                      //     'Merged')
                                                      //   ConstrainedBox(
                                                      //     constraints:
                                                      //         BoxConstraints(
                                                      //       maxHeight: constraints
                                                      //               .maxHeight /
                                                      //           2,
                                                      //     ),
                                                      //     child:
                                                      //         SingleChildScrollView(
                                                      //       child:
                                                      //           ExpansionTile(
                                                      //         title: Text(
                                                      //           "Additional Details",
                                                      //           style:
                                                      //               TextStyle(
                                                      //             fontWeight:
                                                      //                 FontWeight
                                                      //                     .bold,
                                                      //             fontSize:
                                                      //                 textSize -
                                                      //                     2,
                                                      //           ),
                                                      //         ),
                                                      //         children: [
                                                      //           ListTile(
                                                      //             title: Text(
                                                      //               "Item Details",
                                                      //               style: TextStyle(
                                                      //                   fontSize:
                                                      //                       textSize -
                                                      //                           4),
                                                      //             ),
                                                      //             subtitle:
                                                      //                 Text(
                                                      //               "Item-specific details go here...",
                                                      //               style: TextStyle(
                                                      //                   fontSize:
                                                      //                       textSize -
                                                      //                           6),
                                                      //             ),
                                                      //           ),
                                                      //         ],
                                                      //       ),
                                                      //     ),
                                                      //   ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  if (state.isMultiSelectMode &&
                                      state.isSelected.length >= 2)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: state.mergeisLoading
                                          ? const LinearProgressIndicator(
                                              color: mainclr,
                                            )
                                          : MainButton(
                                              label: 'Merge & Print',
                                              onpress: () {
                                                log('message ----');
                                                BlocProvider.of<OrdersBloc>(
                                                        context)
                                                    .add(const OrdersEvent
                                                        .mergeAndprint());

                                                // PrinterConfig? printer = context
                                                //     .read<PrinterSetupBloc>()
                                                //     .state
                                                //     .billPrinterInfo;

                                                // if (printer != null) {
                                                //   BlocProvider.of<OrdersBloc>(context)
                                                //       .add(OrdersEvent.mergeAndprint(
                                                //           printer: printer));
                                                // } else {
                                                //   BlocProvider.of<PrinterSetupBloc>(
                                                //           context)
                                                //       .add(
                                                //     const PrinterSetupEvent
                                                //         .fetchkitchenPrinter(
                                                //         kitchen: 'Bill'),
                                                //   );

                                                //   Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //       builder: (context) =>
                                                //           const PrinterSetupPage(
                                                //               kitchen: 'Bill'),
                                                //     ),
                                                //   );

                                                //   ScaffoldMessenger.of(context)
                                                //       .showSnackBar(
                                                //     const SnackBar(
                                                //       content: Column(
                                                //         crossAxisAlignment:
                                                //             CrossAxisAlignment.start,
                                                //         mainAxisSize:
                                                //             MainAxisSize.min,
                                                //         children: [
                                                //           Text(
                                                //             "Sorry",
                                                //             style: TextStyle(
                                                //               color: Colors.white,
                                                //               fontSize: 15,
                                                //               fontWeight:
                                                //                   FontWeight.bold,
                                                //             ),
                                                //           ),
                                                //           Text(
                                                //             "Please Add Bill Printer",
                                                //             style: TextStyle(
                                                //               color: Colors.white,
                                                //               fontSize: 12,
                                                //             ),
                                                //           ),
                                                //         ],
                                                //       ),
                                                //       backgroundColor: mainclr,
                                                //       behavior:
                                                //           SnackBarBehavior.floating,
                                                //       margin: EdgeInsets.all(12),
                                                //       duration: Duration(seconds: 4),
                                                //     ),
                                                //   );

                                                //   log('Bill printer not added');
                                                // }

                                                // mergeOrders();
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
      },
    );
  }
}
