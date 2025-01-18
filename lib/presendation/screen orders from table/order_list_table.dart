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
import 'package:restaurant_kot/presendation/screen%20home/loadings.dart';
import 'package:restaurant_kot/presendation/screen%20order%20details/screen_order_detail.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/screen_product_selection.dart';

class ScreenOrdersList extends StatelessWidget {
  const ScreenOrdersList({
    super.key,
    required this.table,
  });
  final TableModel table;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth < 1024;

    double textSize = isMobile
        ? 16
        : isTablet
            ? 16
            : 18;
    double titlePadding = isMobile ? 8 : 12;
    double subtitlePadding = isMobile ? 6 : 10;
    double iconSize = isMobile
        ? 28
        : isTablet
            ? 24
            : 30;
    double leadingPadding = isMobile ? 8 : 12;
    // double cardPadding = isMobile ? 4 : 12;
    double buttonPadding = isMobile ? 10 : 15;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: appbarbg,
        title: Center(
          child: Text(
            'Orders Of ${table.tableName}',
            style: TextStyle(fontSize: textSize, color: Colors.white),
          ),
        ),
        actions: const [SizedBox(width: 50)],
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
            if (state.isLoading) {
              return ordersloading();
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: boxbgwhite,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: titlePadding,
                      vertical: 0,
                    ),
                    title: Text(
                      'Table No: ${table.tableName}',
                      style: TextStyle(
                          fontSize: textSize, fontWeight: FontWeight.w600),
                    ),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainclr,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
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
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.symmetric(vertical: subtitlePadding),
                      child: Text(
                        'Total: ₹ ${table.totalOrderPrice}/-',
                        style: TextStyle(fontSize: textSize),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                state.tableOrders.isEmpty
                    ? Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 50),
                              Image.asset(
                                'assets/img/no data/No_data.png',
                                height: isMobile ? 200 : 400,
                              ),
                              const Text(
                                'No Orders Assigned Specifically\nfor You',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      isMobile ? 1 : (isTablet ? 2 : 3),
                                  crossAxisSpacing:
                                      isMobile ? 2 : (isTablet ? 10 : 10),
                                  mainAxisSpacing:
                                      isMobile ? 2 : (isTablet ? 10 : 10),
                                  childAspectRatio: isMobile ? 3.7 : 3.5,
                                ),
                                itemCount: state.tableOrders.length,
                                itemBuilder: (context, index) {
                                  final order = state.tableOrders[index];
                                  return Card(
                                    color: Colors.white,
                                    elevation: 2,
                                    child: Center(
                                      child: ListTile(
                                        contentPadding:
                                            EdgeInsets.only(right: 12, left: 5),
                                        onTap: () {
                                          BlocProvider.of<StockBloc>(context)
                                              .add(const ClearSelection());

                                          BlocProvider.of<OrderDetailsBloc>(
                                                  context)
                                              .add(OrderDetailsEvent.orderItems(
                                                  orderNo: order.orderNumber));
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return OrderDetailsPage(
                                                table: TableInfo(
                                                  acOrNonAc: table.tableType,
                                                  floor: table.floorName,
                                                  tableName: table.tableName,
                                                ),
                                                order: order,
                                              );
                                            },
                                          ));
                                          BlocProvider.of<StockBloc>(context)
                                              .add(const StockEvent.typeChange(
                                                  type: 'Service'));
                                        },
                                        leading: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Container(
                                            padding:
                                                EdgeInsets.all(leadingPadding),
                                            decoration: BoxDecoration(
                                              color: mainclr,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Icon(
                                              Icons.restaurant,
                                              color: Colors.white,
                                              size: iconSize,
                                            ),
                                          ),
                                        ),
                                        title: Text(
                                          order.orderNumber,
                                          style: TextStyle(fontSize: textSize),
                                        ),
                                        subtitle: Text(
                                            'Amount: ₹${order.totalAmount}'),
                                        trailing: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Icon(
                                                  Icons.timer_sharp,
                                                  color: Colors.grey,
                                                  size: 18,
                                                ),
                                                const SizedBox(width: 6),
                                                Text(time(DateTime.parse(
                                                    order.startTime))),
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
