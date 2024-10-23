
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/order%20details/order_details_bloc.dart';
import 'package:restaurant_kot/application/orders/orders_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/domain/tables/table_model.dart';
import 'package:restaurant_kot/infrastructure/dateOrtime/time_format_change.dart';
import 'package:restaurant_kot/presendation/screen%20order%20details/screen_order_detail.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/screen_product_selection.dart';

class ScreenOrdersList extends StatelessWidget {
  const ScreenOrdersList({super.key, required this.table});
  final TableModel table;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarbg,
        title: Center(
            child: Text(
          'Orders Of ${table.tableName}',
          style: const TextStyle(fontSize: 18),
        )),
        actions: const [
          SizedBox(
            width: 50,
          )
        ],
      ),
      body: RefreshIndicator(    backgroundColor: mainclr,
      color: mainclrbg,
        onRefresh: () async {
          BlocProvider.of<OrdersBloc>(context)
              .add(OrdersEvent.tableOrders(tableNo: table.tableName));
        },
        child: BlocBuilder<OrdersBloc, OrdersState>(
          builder: (context, state) {
            return state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: boxbgwhite,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 0),
                              splashColor:
                                  const Color.fromARGB(0, 255, 255, 255),
                              tileColor: const Color.fromARGB(0, 255, 255, 255),
                              title: Text(
                                'Table No: ${table.tableName}',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w600),
                              ),
                              trailing: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(color: mainclr),
                                      borderRadius: BorderRadius.circular(
                                          20), // Border radius of 10
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return ProductChoosingPage(table:table.tableName ,);
                                      },
                                    ));
                                  },
                                  child: const Text(
                                    'Add New Order',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: mainclr,
                                        fontWeight: FontWeight.bold),
                                  )),
                              subtitle:
                                  Text('Total: ₹ ${table.totalOrderPrice}/-'),
                            ),
                            const SizedBox(
                              height: 8,
                            )
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${state.tableOrders.length} Orders',
                              style: const TextStyle(fontSize: 20),
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
                            itemCount: state.tableOrders.length,
                            itemBuilder: (context, index) {
                              return Card(
                                margin: const EdgeInsets.all(3),
                                elevation: 2,
                                borderOnForeground: true,
                                shadowColor:
                                    const Color.fromARGB(255, 255, 255, 255),
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
                                                          BorderRadius.circular(
                                                              10)),
                                                ),
                                                Expanded(
                                                  child: ListTile(
                                                    contentPadding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                            vertical: 10,
                                                            horizontal: 10),
                                                    splashColor:
                                                        const Color.fromARGB(
                                                            0, 255, 255, 255),
                                                    tileColor:
                                                        const Color.fromARGB(
                                                            0, 255, 255, 255),
                                                    onTap: () {
                                                      BlocProvider.of<
                                                                  OrderDetailsBloc>(
                                                              context)
                                                          .add(OrderDetailsEvent
                                                              .orderItems(
                                                                  orderNo: state
                                                                      .tableOrders[
                                                                          index]
                                                                      .orderNumber));
                                                      Navigator.push(context,
                                                          MaterialPageRoute(
                                                        builder: (context) {
                                                          return  OrderDetailsPage(order:state.tableOrders[index] ,);
                                                        },
                                                      ));
                                                    },
                                                    leading: Container(
                                                        decoration: BoxDecoration(
                                                            color: mainclr,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Icon(
                                                            Icons.restaurant,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    255),
                                                          ),
                                                        )),
                                                    title: Text(
                                                      '${state.tableOrders[index].orderNumber}',
                                                      style: const TextStyle(
                                                          fontSize: 17),
                                                    ),
                                                    subtitle: Text(
                                                        'Amount: ₹${state.tableOrders[index].totalAmount}'),
                                                    trailing: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        const Icon(
                                                          Icons.timer_sharp,
                                                          color: Color.fromARGB(
                                                              255,
                                                              204,
                                                              204,
                                                              204),
                                                          size: 18,
                                                        ),
                                                        const SizedBox(
                                                          width: 6,
                                                        ),
                                                        Text(time(
                                                            DateTime.parse(state
                                                                .tableOrders[
                                                                    index]
                                                                .entryDate))),
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
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
