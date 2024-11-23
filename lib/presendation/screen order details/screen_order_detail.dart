import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/KotSubmitPrint/kot_submit_print_bloc.dart';
import 'package:restaurant_kot/application/customerpart/customerpart_bloc.dart';
import 'package:restaurant_kot/application/items%20To%20Kot/items_to_kot_bloc.dart';
import 'package:restaurant_kot/application/order%20details/order_details_bloc.dart';
import 'package:restaurant_kot/application/stock/stock_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/domain/item/kot_item_model.dart';
import 'package:restaurant_kot/domain/orders/order_model.dart';
import 'package:restaurant_kot/infrastructure/dateOrtime/time_format_change.dart';
import 'package:restaurant_kot/presendation/screen%20bill%20preview/screen_bill.dart';
import 'package:restaurant_kot/presendation/screen%20order%20details/table_view.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/screen_product_selection.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/selected_product.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({super.key, required this.order, required this.table});
  final Order order;
  final TableInfo table;

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  // late List<OrderItem> _items;
  @override
  final List<kotItem> selectedItems = [];
  // Store selected item indices
  void toggleSelection(kotItem kotItem) {
    setState(() {
      if (selectedItems.contains(kotItem)) {
        selectedItems.remove(kotItem);
      } else {
        selectedItems.add(kotItem);
      }
    });
  }

  // void initState() {
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
      body: RefreshIndicator(
        backgroundColor: mainclr,
        color: mainclrbg,
        onRefresh: () async {
          BlocProvider.of<OrderDetailsBloc>(context).add(
              OrderDetailsEvent.orderItems(orderNo: widget.order.orderNumber));
        },
        child: BlocBuilder<OrderDetailsBloc, OrderDetailsState>(
          builder: (context, state) {
            log('building');
            // log(state.orderitems[0].changedQty.toString());
            return state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: ListView(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: boxbgwhite,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  children: [
                                    ListTile(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 0),
                                      splashColor: const Color.fromARGB(
                                          0, 255, 255, 255),
                                      tileColor: const Color.fromARGB(
                                          0, 255, 255, 255),
                                      title: Text(
                                        widget.order.orderNumber,
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      trailing: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  color: mainclr),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20), // Border radius of 10
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                return ProductChoosingPage(
                                                  tableinfo: widget.table,
                                                  order:
                                                      widget.order.orderNumber,
                                                );
                                              },
                                            ));

                                            for (var element
                                                in state.toAddItems) {
                                              log('${element.itemName}  -----  ${element.qty}---${element.quantity}');
                                            }
                                            BlocProvider.of<StockBloc>(context)
                                                .add(ListFromOrder(
                                                    cancelItemslist:
                                                        state.toCancelItems,
                                                    itemslist:
                                                        state.toAddItems));
                                          },
                                          child: const Text(
                                            'Add New Item',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: mainclr,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      subtitle: Text(
                                          'Total: ₹ ${widget.order.totalAmount}'),
                                    ),
                                    ListTile(
                                      contentPadding:
                                          const EdgeInsets.only(left: 16),
                                      title: Text(
                                        widget.order.tableName,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      trailing: TextButton(
                                          onPressed: () {
                                            showModalBottomSheet(
                                              isScrollControlled:
                                                  true, // Allows the modal to take more height

                                              context: context,
                                              builder: (context) {
                                                return TableViewForTableChange(
                                                  table: widget.order.tableName,
                                                );
                                              },
                                            );
                                          },
                                          child: const Row(
                                            mainAxisSize: MainAxisSize.min,
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
                                    ),
                                    Divider(
                                      height: 0,
                                    )
                                  ],
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0,
                                    vertical: state.toAddItems.isNotEmpty ||
                                            state.toCancelItems.isNotEmpty ||
                                            selectedItems.isNotEmpty
                                        ? 0
                                        : 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '   ${state.orderitems.length} Items',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    state.toAddItems.isNotEmpty ||
                                            state.toCancelItems.isNotEmpty ||
                                            selectedItems.isNotEmpty
                                        ? TextButton(
                                            onPressed: () {
                                              BlocProvider.of<StockBloc>(
                                                      context)
                                                  .add(const StockEvent
                                                      .clearSelection());
                                              BlocProvider.of<OrderDetailsBloc>(
                                                      context)
                                                  .add(const OrderDetailsEvent
                                                      .clearItemSelection());
                                              setState(() {
                                                selectedItems.clear();
                                              });
                                            },
                                            child: const Row(
                                              children: [
                                                Text(
                                                  'Clear Selection',
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Icon(
                                                  Icons.close,
                                                  size: 22,
                                                  color: Colors.blue,
                                                ),
                                              ],
                                            ))
                                        : SizedBox()
                                  ],
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
                                      final item = state.orderitems[index];
                                      final isSelected =
                                          selectedItems.contains(item);

                                      return GestureDetector(
                                        onLongPress: () {
                                          if (state.toAddItems.isNotEmpty ||
                                              state.toCancelItems.isNotEmpty) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  "⚠️ Action pending! Please complete your last operation before proceeding.",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    // fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                backgroundColor: mainclr,
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                margin: EdgeInsets.all(12),
                                                duration: Duration(seconds: 4),
                                              ),
                                            );
                                          } else {
                                            toggleSelection(item);
                                          }
                                        },
                                        onTap: () {
                                          log(item.qty.toString());
                                          if (selectedItems.isNotEmpty) {
                                            toggleSelection(item);
                                          }
                                        },
                                        child: Card(
                                          margin: const EdgeInsets.only(
                                              right: 7, left: 7, bottom: 7),
                                          elevation: 3,
                                          shadowColor: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 8),
                                            decoration: BoxDecoration(
                                              color: isSelected
                                                  ? Colors.blue.withOpacity(0.0)
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: isSelected
                                                  ? Border.all(
                                                      color: mainclr, width: 2)
                                                  : null,
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 60,
                                                      width: 60,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey[200],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image.network(
                                                          'https://www.shutterstock.com/shutterstock/photos/2468105649/display_1500/stock-photo--chicken-biryani-quick-and-tasty-chicken-biryani-chicken-dum-biryani-plan-background-2468105649.jpg',
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            item.itemName,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                          const SizedBox(
                                                              height: 3),
                                                          Text(
                                                            'Amount: ₹ ${item.basicRate}/-',
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        12),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        RichText(
                                                          text: TextSpan(
                                                            children: [
                                                              const TextSpan(
                                                                text: 'Qty: ',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 13,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    '${item.qty.toString()} ',
                                                                style:
                                                                    const TextStyle(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize:
                                                                      13, // Adjusted font size
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .red,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                const Divider(height: 0),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      item.kotno,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                    selectedItems.isEmpty
                                                        ? Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              IconButton(
                                                                  icon:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .red,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    child:
                                                                        const Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              5),
                                                                      child: Icon(
                                                                          Icons
                                                                              .remove,
                                                                          color: Colors
                                                                              .white,
                                                                          size:
                                                                              17),
                                                                    ),
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    if (state
                                                                            .orderitems[index]
                                                                            .quantity >
                                                                        0) {
                                                                      log('calling ---');
                                                                      BlocProvider.of<StockBloc>(context).add(StockEvent.add(
                                                                          item: state.orderitems[
                                                                              index],
                                                                          isIncrement:
                                                                              false,
                                                                          productid: state
                                                                              .orderitems[index]
                                                                              .itemCode,
                                                                          qty: 1));

                                                                      // Your code here
                                                                    }

                                                                    BlocProvider.of<OrderDetailsBloc>(context).add(OrderDetailsEvent.cancelQty(
                                                                        kotno: state
                                                                            .orderitems[
                                                                                index]
                                                                            .kotno,
                                                                        currentItemid: state
                                                                            .orderitems[index]
                                                                            .itemCode));
                                                                  }),
                                                              Text(
                                                                item.quantity ==
                                                                        0
                                                                    ? ''
                                                                    : item
                                                                        .quantity
                                                                        .toString(),
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 15,
                                                                ),
                                                              ),
                                                              IconButton(
                                                                  icon:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .green,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    child:
                                                                        const Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              5),
                                                                      child: Icon(
                                                                          Icons
                                                                              .add,
                                                                          color: Colors
                                                                              .white,
                                                                          size:
                                                                              17),
                                                                    ),
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    if (state
                                                                            .orderitems[index]
                                                                            .quantity !=
                                                                        -1) {
                                                                      BlocProvider.of<StockBloc>(context).add(StockEvent.add(
                                                                          item: state.orderitems[
                                                                              index],
                                                                          isIncrement:
                                                                              true,
                                                                          productid: state
                                                                              .orderitems[index]
                                                                              .itemCode,
                                                                          qty: 1));
                                                                    }

                                                                    BlocProvider.of<OrderDetailsBloc>(context).add(OrderDetailsEvent.addQty(
                                                                        kotno: state
                                                                            .orderitems[
                                                                                index]
                                                                            .kotno,
                                                                        currentItemid: state
                                                                            .orderitems[index]
                                                                            .itemCode));
                                                                  }),
                                                            ],
                                                          )
                                                        : const SizedBox(
                                                            height: 40,
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
                              ),
                            ],
                          ),
                        ),
                      ),

                      BlocBuilder<KotSubmitPrintBloc, KotSubmitPrintState>(
                        builder: (context, sstate) {
                          return sstate.isLoading
                              ? const LinearProgressIndicator()
                              : state.toAddItems.isNotEmpty ||
                                      state.toCancelItems.isNotEmpty ||
                                      selectedItems.isNotEmpty
                                  ? Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: MainButton(
                                          label: selectedItems.isEmpty
                                              ? 'KOT'
                                              : 'Proceed Cancel KOT',
                                          onpress: () {
                                            if (selectedItems.isEmpty) {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                builder: (context) {
                                                  return SelectedProductsPage(
                                                    orderNo: widget
                                                        .order.orderNumber,
                                                    table: widget.table,
                                                  );
                                                },
                                              ));
                                              log('--${state.toAddItems.length.toString()}');
                                              BlocProvider.of<StockBloc>(
                                                      context)
                                                  .add(ListFromOrder(
                                                cancelItemslist:
                                                    state.toCancelItems,
                                                itemslist: state.toAddItems,
                                              ));
                                            } else {
                                              BlocProvider.of<
                                                          KotSubmitPrintBloc>(
                                                      context)
                                                  .add(KotSubmitPrintEvent.cancelKOT(
                                                      selectedcustomer: context
                                                          .read<
                                                              CustomerpartBloc>()
                                                          .state
                                                          .selectedcustomer!,
                                                      table: widget.table,
                                                      cancelkotitems:
                                                          selectedItems,
                                                      currentorderid: widget
                                                          .order.orderNumber,
                                                      currentitems: context
                                                          .read<
                                                              OrderDetailsBloc>()
                                                          .state
                                                          .orderitems));

                                              log('message');
                                            }
                                          }),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10, right: 12, left: 12),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            // backgroundColor: buttonclr, // Set the button background color

                                            minimumSize: const Size(
                                                double.infinity,
                                                55), // Full-width button
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  color: mainclr),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20), // Border radius of 10
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                return BillPage();
                                              },
                                            ));
                                          },
                                          child: const Text(
                                            'Print Bill',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: mainclr),
                                          )),
                                    );
                        },
                      )
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
