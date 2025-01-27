
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/finished%20order/finishad_order_bloc.dart';
import 'package:restaurant_kot/application/printer%20setup/printer_setup_bloc.dart';
import 'package:restaurant_kot/application/printing/printing_bloc.dart';
import 'package:restaurant_kot/application/restore%20bill/restore_bill_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/domain/cus/customer_model.dart';
import 'package:restaurant_kot/domain/invoice/inv_order_model.dart';
import 'package:restaurant_kot/domain/item/kot_item_model.dart';
import 'package:restaurant_kot/domain/printer/priter_config.dart';
import 'package:restaurant_kot/presendation/screen%20home/loadings.dart';
import 'package:restaurant_kot/presendation/screen%20home/screen_home.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';

class FinishedOrderDetail extends StatelessWidget {
  const FinishedOrderDetail({super.key, required this.invoice});
  final InvoicesList invoice;
  // List of ordered items
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
        backgroundColor: mainclr,
        color: mainclrbg,
        onRefresh: () async {
          BlocProvider.of<FinishadOrderBloc>(context).add(
              FinishadOrderEvent.fetchDetails(invNo: invoice.custominvno!));
        },
        child: LayoutBuilder(builder: (context, constraints) {
          return BlocBuilder<FinishadOrderBloc, FinishadOrderState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: state.isLoading
                    ? ordersloading()
                    : state.invoices.isEmpty || state.invoiceDetails!.isEmpty
                        ? SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: SizedBox(
                              height: constraints.maxHeight,
                              child: Center(
                                child: Image.asset(
                                    'assets/img/no data/No_data.png'),
                              ),
                            ),
                          )
                        : Column(
                            children: [
                              Expanded(
                                child: ListView(
                                  children: [
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromARGB(
                                                  66, 188, 188, 188),
                                              blurRadius: 6,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 12),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    invoice.custominvno!,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black87,
                                                    ),
                                                  ),
                                                  invoice.mergedOrNot ==
                                                          'Merged'
                                                      ? const Text(
                                                          'Merged Bill',
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color: mainclr,
                                                          ),
                                                        )
                                                      : SizedBox()
                                                ],
                                              ),
                                              const Divider(),
                                              // Customer Name Section
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    'To:',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                    invoice.cusname!,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black87,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 5),

                                              // Bill Number Section

                                              // Table Number Section
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    'Table:',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                    invoice.tableNumber!,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black87,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 5),

                                              // Order Number Section
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    'Order:',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                    invoice.orderNumber!,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black87,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Text(
                                        'Items ${state.invoiceDetails!.length}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                    66, 188, 188, 188),
                                                blurRadius: 6,
                                                offset: Offset(0, 3),
                                              ),
                                            ]),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: List.generate(
                                              state.invoiceDetails!.length,
                                              (index) {
                                                final item = state
                                                    .invoiceDetails![index];

                                                return Column(
                                                  children: [
                                                    ListTile(
                                                      contentPadding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                              vertical: 2,
                                                              horizontal: 10),
                                                      title: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                bottom: 6),
                                                        child: Text(
                                                          item.pdtname!,
                                                          style: const TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      subtitle: Text(
                                                          'Qty: ${item.qty != null ? item.qty!.toInt().toString() : "0"}'),
                                                      trailing: Text(
                                                        '₹ ${item.totalAmount.toString()}',
                                                        style: const TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                    index !=
                                                            state.invoiceDetails!
                                                                    .length -
                                                                1
                                                        ? const Divider()
                                                        : const SizedBox()
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                    66, 163, 163, 163),
                                                blurRadius: 6,
                                                offset: Offset(0, 3),
                                              ),
                                            ]),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 15),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    'Sub Total',
                                                    style:
                                                        TextStyle(fontSize: 17),
                                                  ),
                                                  Text(
                                                    '₹ ${invoice.totalamount!.toStringAsFixed(2)}',
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 6,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text('Tax'),
                                                  Text(
                                                      '₹ ${invoice.totaltaxamount!.toStringAsFixed(2)}'),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 6,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text('Cess'),
                                                  Text(
                                                      '₹ ${invoice.totalCessAmount!.toStringAsFixed(2)}'),
                                                ],
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 2, top: 8),
                                                child: Divider(),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    'Total Amount',
                                                    style:
                                                        TextStyle(fontSize: 17),
                                                  ),
                                                  Text(
                                                    '₹ ${invoice.totalHaveToPayAmount!.toStringAsFixed(2)}',
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Status',
                                                    style:
                                                        TextStyle(fontSize: 17),
                                                  ),
                                                  Text(
                                                    'Paid',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    'Payment Method',
                                                    style:
                                                        TextStyle(fontSize: 17),
                                                  ),
                                                  Text(
                                                    state.paidBy ?? '--',
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                              // const SizedBox(
                                              //   height: 12,
                                              // ),
                                              //  Row(
                                              //   mainAxisAlignment:
                                              //       MainAxisAlignment.spaceBetween,
                                              //   children: [
                                              //     Text(
                                              //       'Pyment Method',
                                              //       style: TextStyle(fontSize: 17),
                                              //     ),
                                              //     Text(
                                              //       invoice.,
                                              //       style: TextStyle(
                                              //           fontSize: 18,
                                              //           fontWeight:
                                              //               FontWeight.w500),
                                              //     ),
                                              //   ],
                                              // ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              Column(
                                                children: [
                                                  BlocConsumer<PrintingBloc,
                                                      PrintingState>(
                                                    listener:
                                                        (context, state) {},
                                                    builder: (context, sstate) {
                                                      return sstate.isLoading
                                                          ? const LinearProgressIndicator(
                                                              color: mainclr,
                                                            )
                                                          : MainButton(
                                                              label:
                                                                  'Print Bill',
                                                              onpress: () {
                                                                PrinterConfig?
                                                                    printer =
                                                                    context
                                                                        .read<
                                                                            PrinterSetupBloc>()
                                                                        .state
                                                                        .billPrinterInfo;
                                                                BlocProvider.of<PrintingBloc>(context).add(PrintBill(
                                                                    mergedOrNot:
                                                                        invoice.mergedOrNot ??
                                                                            '',
                                                                    orderID: invoice
                                                                        .orderNumber!,
                                                                    printer:
                                                                        printer!,
                                                                    items: convert(
                                                                        invList:
                                                                            state
                                                                                .invoiceDetails!),
                                                                    invNo: invoice
                                                                        .custominvno!,
                                                                    taxable: invoice
                                                                        .subTotal!,
                                                                    netAmount:
                                                                        invoice
                                                                            .totalHaveToPayAmount!,
                                                                    cGst: invoice
                                                                        .totaltaxamount!,
                                                                    sGst: invoice
                                                                        .totalCessAmount!,
                                                                    tableName:
                                                                        invoice
                                                                            .tableNumber!));

                                                                // submitAndPrint();
                                                              });
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: 12,
                                                  ),
                                                  billEdit!
                                                      ? BlocConsumer<
                                                          RestoreBillBloc,
                                                          RestoreBillState>(
                                                          listener: (context,
                                                              sstate) {
                                                            if (sstate
                                                                .updated) {
                                                              Navigator.of(
                                                                      context)
                                                                  .pushAndRemoveUntil(
                                                                MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      const HomeScreen(
                                                                          from:
                                                                              1),
                                                                ),
                                                                (route) =>
                                                                    false,
                                                              );

                                                              const snackBar =
                                                                  SnackBar(
                                                                content: Row(
                                                                  children: [
                                                                    Icon(
                                                                        Icons
                                                                            .domain_verification,
                                                                        color: Colors
                                                                            .white,
                                                                        size:
                                                                            24),
                                                                    SizedBox(
                                                                        width:
                                                                            10),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        "Order has been restored ",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16),
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
                                                                    EdgeInsets
                                                                        .all(
                                                                            16),
                                                                duration:
                                                                    Duration(
                                                                        seconds:
                                                                            3),
                                                              );

                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      snackBar);
                                                            }
                                                          },
                                                          builder: (context,
                                                              sstate) {
                                                            return !sstate
                                                                    .isLoading
                                                                ? ElevatedButton(
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      backgroundColor: const Color
                                                                          .fromARGB(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          255), // Set the button background color

                                                                      minimumSize: const Size(
                                                                          double
                                                                              .infinity,
                                                                          55), // Full-width button
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        side: const BorderSide(
                                                                            color:
                                                                                mainclr),
                                                                        borderRadius:
                                                                            BorderRadius.circular(20), // Border radius of 10
                                                                      ),
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      BlocProvider.of<RestoreBillBloc>(context).add(Restore(
                                                                          ordNo: invoice
                                                                              .orderNumber!,
                                                                          invNo: invoice
                                                                              .custominvno!,
                                                                          amt: invoice
                                                                              .totalHaveToPayAmount!
                                                                              .toString()));
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                      'Restore Order',
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color:
                                                                              mainclr),
                                                                    ))
                                                                : const LinearProgressIndicator(
                                                                    color:
                                                                        mainclr,
                                                                  );
                                                          },
                                                        )
                                                      : const SizedBox()
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
              );
            },
          );
        }),
      ),
    );
  }
}

List<kotItem> convert({required List<InvoiceItem> invList}) {
  List<kotItem> printItems = [];
  for (var element in invList) {
    printItems.add(kotItem(updated: false,
      productImg: '',
        parcelOrnot: element.parcelOrNot ?? '',
        gstAmt: element.gstAmount!,
        cessAmt: element.cessAmount!,
        kotno: '',
        stock: 0,
        qty: element.qty!.toInt(),
        serOrGoods: '',
        kitchenName: '',
        itemName: element.pdtname!,
        itemCode: element.pdtcode!,
        quantity: 0,
        basicRate: element.unitPrice!,
        unitTaxableAmountBeforeDiscount: element.amount!,
        unitTaxableAmount: element.amount!,
        gstPer: 0,
        cessPer: 0));
  }
  return printItems;
}
