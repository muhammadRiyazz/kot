import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/BillSubmitPrint/bill_submit_print_bloc.dart';
import 'package:restaurant_kot/application/customerpart/customerpart_bloc.dart';
import 'package:restaurant_kot/application/initalData/inital_data_bloc.dart';
import 'package:restaurant_kot/application/login%20b/login_bloc.dart';
import 'package:restaurant_kot/application/printer%20setup/printer_setup_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/domain/cus/customer_model.dart';
import 'package:restaurant_kot/domain/orders/order_model.dart';
import 'package:restaurant_kot/domain/printer/priter_config.dart';
import 'package:restaurant_kot/infrastructure/img.dart';
import 'package:restaurant_kot/presendation/screen%20bill%20preview/bill_success.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/widgets/img.dart';
import 'package:restaurant_kot/presendation/settings/printer/printer_page.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';
import 'package:shimmer/shimmer.dart';

class BillPage extends StatefulWidget {
  const BillPage({super.key, required this.order});
  final Order order;
  @override
  _BillPageState createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  bool isPaid = false; // Paid/Unpaid state

  // Payment dropdown variables
  String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Center(
            child: Text(
          'Bill Preview',
          style: TextStyle(fontSize: 18, color: Colors.white),
        )),
        backgroundColor: appbarbg,
        actions: const [
          SizedBox(
            width: 60,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<BillSubmitPrintBloc, BillSubmitPrintState>(
          builder: (context, state) {
            final paymentType =
                context.read<InitalDataBloc>().state.paymentType;
            final customer =
                context.read<CustomerpartBloc>().state.selectedcustomer!;
            return state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
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
                                            color: Colors.black,
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
                                                    color: Colors.black,
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
                                  ),
                                  const Divider(
                                    height: 0,
                                  ),
                                  ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 3),
                                    splashColor:
                                        const Color.fromARGB(0, 255, 255, 255),
                                    tileColor:
                                        const Color.fromARGB(0, 255, 255, 255),
                                    title: Text(
                                      'Table No:${state.table!.tableName}',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    subtitle: Text(
                                        'Order No: ${state.orderid ?? ""}',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  // const Divider(
                                  //   height: 0,
                                  // )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: List.generate(
                                    state.billitems.length,
                                    (index) {
                                      final item = state.billitems[index];

                                      return Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 2),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
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
                                                        getimgpath(
                                                            item.productImg),
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
                                                const SizedBox(width: 8),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        item.itemName,
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      const SizedBox(height: 3),
                                                      Text(
                                                        '₹ ${item.basicRate * item.qty}/-',
                                                        style: const TextStyle(
                                                            fontSize: 12),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          const TextSpan(
                                                            text: 'Qty: ',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.black,
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
                                                              color: mainclr,
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
                                            const Divider(height: 12),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 12),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Sub Total',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        Text(
                                          '₹ ${state.subTotal?.toStringAsFixed(2)}',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Tax'),
                                        Text(
                                            '₹ ${state.tax?.toStringAsFixed(2)}'),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Cess'),
                                        Text(
                                            '₹ ${state.cess?.toStringAsFixed(2)}'),
                                      ],
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(bottom: 2, top: 8),
                                      child: Divider(),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Total Amount',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        Text(
                                          '₹ ${state.totalAmt?.toStringAsFixed(2)}',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    if (isPaid)
                                      ListTile(
                                        contentPadding:
                                            const EdgeInsets.symmetric(),
                                        title: const Text('Payment Method'),
                                        trailing: DropdownButton<String>(
                                          value: state.paytypeValue ??
                                              paymentType.first,
                                          onChanged: (value) {
                                            BlocProvider.of<
                                                        BillSubmitPrintBloc>(
                                                    context)
                                                .add(BillSubmitPrintEvent
                                                    .payType(
                                                        paytypeValue: value!));

                                            // setState(() {
                                            //   selectedPaymentMethod = value!;
                                            // });
                                          },
                                          items: paymentType
                                              .toSet() // Ensure unique values
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ListTile(
                                      contentPadding: const EdgeInsets.all(0),
                                      title: Text(isPaid ? 'Paid' : 'Unpaid'),
                                      trailing: Switch(
                                        trackOutlineWidth:
                                            const WidgetStatePropertyAll(1),
                                        inactiveTrackColor: Colors.white,
                                        inactiveThumbColor: mainclr,
                                        trackOutlineColor:
                                            const WidgetStatePropertyAll(
                                                mainclr),
                                        activeColor: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        activeTrackColor: mainclr,
                                        value: isPaid,
                                        onChanged: (value) {
                                          setState(() {
                                            isPaid = value;
                                          });

                                          BlocProvider.of<BillSubmitPrintBloc>(
                                                  context)
                                              .add(BillSubmitPrintEvent.payType(
                                                  paytypeValue:
                                                      paymentType.first));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Column(
                          children: [
                            BlocConsumer<BillSubmitPrintBloc,
                                BillSubmitPrintState>(
                              listener: (context, state) {
                                log(' billsubmission -------${state.billsubmission}');
                                if (state.billsubmission) {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return BillPrintpage(
                                        order: widget.order,
                                      );
                                    },
                                  ));
                                }
                              },
                              builder: (context, state) {
                                return state.loading
                                    ? const LinearProgressIndicator(
                                        color: mainclr,
                                      )
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8),
                                        child: MainButton(
                                            label: 'Submit Bill',
                                            onpress: () {
                                              showModalBottomSheet(
                                                context: context,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                          top: Radius.circular(
                                                              20)),
                                                ),
                                                builder:
                                                    (BuildContext context) {
                                                  bool billPrint = true;

                                                  return StatefulBuilder(
                                                    builder: (BuildContext
                                                            context,
                                                        StateSetter setState) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(16.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            const Text(
                                                              'Preferences',
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 10),
                                                            const Divider(),
                                                            ListTile(
                                                              title: const Text(
                                                                'Bill Print',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                              subtitle:
                                                                  const Text(
                                                                'Enable if you want to print the Bill.',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                              trailing:
                                                                  Checkbox(
                                                                value:
                                                                    billPrint,
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    billPrint =
                                                                        value ??
                                                                            false;
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 20),
                                                            MainButton(
                                                                label:
                                                                    'Confirm',
                                                                onpress: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                  if (widget
                                                                          .order
                                                                          .billNumber ==
                                                                      '') {
                                                                    handlePrinterSetup(
                                                                      billprint:
                                                                          billPrint,
                                                                      context:
                                                                          context,
                                                                      order: widget
                                                                          .order,
                                                                      isPaid:
                                                                          isPaid, // or false based on your condition
                                                                    );
                                                                  } else {
                                                                    if (isPaid &&
                                                                            billEdit! ||
                                                                        !isPaid) {
                                                                      handlePrinterSetup(
                                                                        billprint:
                                                                            billPrint,
                                                                        context:
                                                                            context,
                                                                        order: widget
                                                                            .order,
                                                                        isPaid:
                                                                            isPaid, // or false based on your condition
                                                                      );
                                                                    } else {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        const SnackBar(
                                                                          content:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            children: [
                                                                              Text(
                                                                                "Sorry",
                                                                                style: TextStyle(
                                                                                  color: Colors.white,
                                                                                  fontSize: 15,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                "You have no permission to process the bill",
                                                                                style: TextStyle(
                                                                                  color: Colors.white,
                                                                                  fontSize: 12,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          backgroundColor:
                                                                              mainclr,
                                                                          behavior:
                                                                              SnackBarBehavior.floating,
                                                                          margin:
                                                                              EdgeInsets.all(12),
                                                                          duration:
                                                                              Duration(seconds: 4),
                                                                        ),
                                                                      );
                                                                    }
                                                                  }
                                                                })
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              );
                                            }),
                                      );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      )
                    ],
                  );
          },
        ),
      ),
    );
  }
}

void handlePrinterSetup(
    {required BuildContext context,
    required Order order,
    required bool isPaid,
    required bool billprint}) {
  if (billprint) {
    PrinterConfig? printer =
        context.read<PrinterSetupBloc>().state.billPrinterInfo;

    if (printer != null) {
      if (order.billNumber.isEmpty) {
        log('order.billNumber.isEmpty');
        BlocProvider.of<BillSubmitPrintBloc>(context).add(
          BillSubmitPrintEvent.billSubmitAndPrint(
            mergedOrders: order.mergedOrders,
            mergedTables: order.mergedTables,
            mergedorNot: order.mergedorNot,
            billPrint: billprint,
            userID: context.read<LoginBloc>().state.userId ?? '--',
            printer: printer,
            paid: isPaid,
          ),
        );
      } else {
        BlocProvider.of<BillSubmitPrintBloc>(context).add(
          BillSubmitPrintEvent.billUpdateAndPrint(
            mergedOrders: order.mergedOrders,
            mergedTables: order.mergedTables,
            mergedorNot: order.mergedorNot,
            billPrint: billprint,
            userId: context.read<LoginBloc>().state.userId ?? '--',
            printer: printer,
            invNo: order.billNumber,
            paid: isPaid,
          ),
        );
      }
    } else {
      BlocProvider.of<PrinterSetupBloc>(context).add(
        const PrinterSetupEvent.fetchkitchenPrinter(kitchen: 'Bill'),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PrinterSetupPage(kitchen: 'Bill'),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Sorry",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Please Add Bill Printer",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          backgroundColor: mainclr,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(12),
          duration: Duration(seconds: 4),
        ),
      );

      log('Bill printer not added');
    }
  } else {
    if (order.billNumber.isEmpty) {
      log('order.billNumber.isEmpty');
      BlocProvider.of<BillSubmitPrintBloc>(context).add(
        BillSubmitPrintEvent.billSubmitAndPrint(
          mergedOrders: order.mergedOrders, mergedTables: order.mergedTables,
          mergedorNot: order.mergedorNot,

          billPrint: billprint,
          userID: context.read<LoginBloc>().state.userId ?? '--',
          // printer: printer,
          paid: isPaid,
        ),
      );
    } else {
      BlocProvider.of<BillSubmitPrintBloc>(context).add(
        BillSubmitPrintEvent.billUpdateAndPrint(
          mergedOrders: order.mergedOrders, mergedTables: order.mergedTables,
          mergedorNot: order.mergedorNot,

          billPrint: billprint,
          userId: context.read<LoginBloc>().state.userId ?? '--',
          // printer: printer,
          invNo: order.billNumber,
          paid: isPaid,
        ),
      );
    }
  }
}
