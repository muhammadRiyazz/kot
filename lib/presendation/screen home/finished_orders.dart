import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/finished%20order/finishad_order_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/domain/invoice/inv_order_model.dart';
import 'package:restaurant_kot/presendation/screen%20finished%20order/finished_order_deail.dart';

class FinishedOrders extends StatelessWidget {
  FinishedOrders({super.key});

  // void mergeOrders() {
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
          'Finished Orders',
          style: TextStyle(fontSize: 19),
        ),
      ),
      body: RefreshIndicator(
        backgroundColor: mainclr,
        color: mainclrbg,
        onRefresh: () async {
          log('Page refreshed');
          BlocProvider.of<FinishadOrderBloc>(context)
              .add(const FinishadOrderEvent.fetchBills());
          // Implement your refresh logic here
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            return BlocBuilder<FinishadOrderBloc, FinishadOrderState>(
              builder: (context, state) {
                log('lengthhh -----${state.invoices.length}');
                return state.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : state.invoices.isEmpty
                        ? Container(
                            // color: Colors.amberAccent,
                            child: Center(
                              child:
                                  Image.asset('assets/img/no data/No_data.png'),
                            ),
                          )
                        : GridView.builder(
                            padding: const EdgeInsets.all(3),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: childAspectRatio,
                            ),
                            itemCount: state.invoices.length,
                            itemBuilder: (context, index) {
                              InvoicesList order = state.invoices[index];
                              return Card(
                                margin: EdgeInsets.zero,
                                elevation: 5,
                                shadowColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    BlocProvider.of<FinishadOrderBloc>(context)
                                        .add(FinishadOrderEvent.fetchDetails(
                                            invNo: order.custominvno!));

                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return FinishedOrderDetail(
                                          invoice: order,
                                        );
                                      },
                                    ));
                                  },
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
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: const Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Icon(
                                                  Icons.restaurant,
                                                  color: mainclr,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  order.custominvno ?? '',
                                                  style: TextStyle(
                                                    fontSize: textSize,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  'Total: ₹${order.totalHaveToPayAmount}',
                                                  style: TextStyle(
                                                    fontSize: textSize - 2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 237, 237, 237),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Text(
                                                  order.tableNumber ?? '',
                                                  style: TextStyle(
                                                    color: mainclr,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: textSize - 4,
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
                                        // Order Time
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${order.orderNumber}',
                                              style: TextStyle(
                                                fontSize: textSize,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.person_2_outlined,
                                                  color: Color.fromARGB(
                                                      255, 204, 204, 204),
                                                  size: 18,
                                                ),
                                                const SizedBox(width: 6),
                                                Text(
                                                  order.cusname!,
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
                          );
              },
            );
          },
        ),
      ),
    );
  }
}
