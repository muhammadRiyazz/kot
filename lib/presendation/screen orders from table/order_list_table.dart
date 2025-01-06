import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/initalData/inital_data_bloc.dart';
import 'package:restaurant_kot/application/order%20details/order_details_bloc.dart';
import 'package:restaurant_kot/application/orders/orders_bloc.dart';
import 'package:restaurant_kot/application/stock/stock_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/domain/item/kot_item_model.dart';
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
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: appbarbg,
        title: Center(
            child: Text(
          'Orders Of ${table.tableName}',
          style: const TextStyle(fontSize: 18, color: Colors.white),
        )),
        actions: const [
          SizedBox(
            width: 50,
          )
        ],
      ),
      body: RefreshIndicator(
        backgroundColor: mainclr,
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
                      SizedBox(
                        height: 10,
                      ),
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
                                    backgroundColor: mainclr,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(color: mainclr),
                                      borderRadius: BorderRadius.circular(
                                          20), // Border radius of 10
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return ProductChoosingPage(
                                          billNo: '',
                                          tableinfo: TableInfo(
                                              acOrNonAc: table.tableType,
                                              floor: table.floorName,
                                              tableName: table.tableName),
                                        );
                                      },
                                    ));
                                  },
                                  child: const Text(
                                    'Add New Order',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
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
                      state.tableOrders.isEmpty
                          ? SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Image.asset(
                                        'assets/img/no data/No_data.png'),
                                    const Text(
                                      'No Orders Assigned Specifically\nfor You',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize:
                                            13, // Adjusted for readability
                                        fontWeight: FontWeight
                                            .normal, // Semi-bold for emphasis
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 14),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                                      color: state
                                                                      .tableOrders[
                                                                          index]
                                                                      .billNumber !=
                                                                  '' &&
                                                              state
                                                                      .tableOrders[
                                                                          index]
                                                                      .creditOrPaid ==
                                                                  'Credit'
                                                          ? Colors.red
                                                          : mainclr,
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
                                                                  StockBloc>(
                                                              context)
                                                          .add(
                                                              const ClearSelection());

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
                                                          return OrderDetailsPage(
                                                            table: TableInfo(
                                                                acOrNonAc: table
                                                                    .tableType,
                                                                floor: table
                                                                    .floorName,
                                                                tableName: table
                                                                    .tableName),
                                                            order: state
                                                                    .tableOrders[
                                                                index],
                                                          );
                                                        },
                                                      ));
                                                      BlocProvider.of<
                                                                  StockBloc>(
                                                              context)
                                                          .add(const StockEvent
                                                              .typeChange(
                                                              type: 'Service'));
                                                    },
                                                    leading: Container(
                                                        decoration: BoxDecoration(
                                                            color: state.tableOrders[index].billNumber !=
                                                                        '' &&
                                                                    state
                                                                            .tableOrders[
                                                                                index]
                                                                            .creditOrPaid ==
                                                                        'Credit'
                                                                ? Colors.red
                                                                : mainclr,
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
                                                      state.tableOrders[index]
                                                          .orderNumber,
                                                      style: const TextStyle(
                                                          fontSize: 17),
                                                    ),
                                                    subtitle: Text(
                                                        'Amount: ₹${state.tableOrders[index].totalAmount}'),
                                                    trailing: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        SizedBox(),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            const Icon(
                                                              Icons.timer_sharp,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      204,
                                                                      204,
                                                                      204),
                                                              size: 18,
                                                            ),
                                                            const SizedBox(
                                                              width: 6,
                                                            ),
                                                            Text(time(DateTime
                                                                .parse(state
                                                                    .tableOrders[
                                                                        index]
                                                                    .startTime))),
                                                          ],
                                                        ),
                                                        state.tableOrders[index]
                                                                        .billNumber !=
                                                                    '' &&
                                                                state
                                                                        .tableOrders[
                                                                            index]
                                                                        .creditOrPaid ==
                                                                    'Credit'
                                                            ? Container(
                                                                // decoration: BoxDecoration(
                                                                //     borderRadius:
                                                                //         BorderRadius
                                                                //             .circular(
                                                                //                 8),
                                                                //     color: Colors
                                                                //         .red),
                                                                child: Text(
                                                                state
                                                                    .tableOrders[
                                                                        index]
                                                                    .billNumber,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color:
                                                                        mainclr),
                                                              ))
                                                            : const SizedBox(),
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
