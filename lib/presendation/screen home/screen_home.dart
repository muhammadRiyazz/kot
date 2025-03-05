import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/finished%20order/finishad_order_bloc.dart';
import 'package:restaurant_kot/application/orders/orders_bloc.dart';
import 'package:restaurant_kot/application/stock/stock_bloc.dart';
import 'package:restaurant_kot/application/tables/tables_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/infrastructure/initalfetchdata/taxtype.dart';
import 'package:restaurant_kot/presendation/screen%20home/Drawr.dart';
import 'package:restaurant_kot/presendation/screen%20home/finished_orders.dart';
import 'package:restaurant_kot/presendation/screen%20home/tables_part.dart';

import 'orders_part.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.from});
  final int from;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (from == 1) {
        BlocProvider.of<FinishadOrderBloc>(context)
            .add(FinishadOrderEvent.fetchBills());

        BlocProvider.of<TablesBloc>(context).add(const TablesEvent.taledata());
        BlocProvider.of<OrdersBloc>(context).add(const AllOrders());
      }

      //  BlocProvider.of<StockBloc>(context)
      //   .add(const StockEvent.fetchStocks());
    });
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        drawer: const AppDrawer(), // Add the Drawer here

        backgroundColor: mainclrbg,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(72), // Adjust height here
          child: AppBar(
            iconTheme: IconThemeData(
                color: Colors.white, size: 34, applyTextScaling: true),
            // elevation: 5,
            backgroundColor: mainclr,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 6,
                ),
                const Text(
                  'Restaurant KOT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Billing & Printing System',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.grey[300], // Subtle subtitle color
                  ),
                ),
              ],
            ),

            actions: [
              InkWell(
                onTap: () {
                  log(inc.toString());
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 16, top: 10, bottom: 10),
                  child: Icon(
                    Icons.restaurant_menu,
                    color: Color.fromARGB(255, 255, 255, 255),
                    size: 25,
                  ),
                ),
              ),
            ],
            // leading: Padding(
            //   padding: const EdgeInsets.only(left: 10),
            //   child: C
            // ircleAvatar(
            //     radius: 22,
            //     backgroundColor: Colors.white,
            //     child: Icon(
            //       Icons.restaurant_menu,
            //       color: mainclr,
            //       size: 24,
            //     ),
            //   ),
            // ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  // bottom: Radius.circular(20),
                  ),
            ),
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.only(top: 12, right: 5, left: 5),
          child: Column(
            children: [
              // Custom styled TabBar with background, border, and selected tab color
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 206, 206, 206)
                          .withOpacity(0.3), // Shadow color
                      spreadRadius: 1, // How much the shadow spreads
                      blurRadius: 7, // Softness of the shadow
                      offset:
                          const Offset(0, 4), // Position of the shadow (x, y)
                    ),
                  ],
                  color: boxbgwhite,
                  // borderRadius: BorderRadius.circular(15.0), // Rounded corners
                ),
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                    child: TabBar(
                      dividerHeight: 0,
                      indicator: BoxDecoration(
                        color: mainclr, // Selected tab background color
                        borderRadius:
                            BorderRadius.circular(15.0), // Rounded corners
                      ),
                      unselectedLabelStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily:
                            'Montserrat', // Apply Montserrat font globally
                      ),
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily:
                            'Montserrat', // Apply Montserrat font globally
                      ),
                      labelColor: Colors.white, // Selected text color
                      unselectedLabelColor:
                          Colors.black, // Unselected text color
                      indicatorSize:
                          TabBarIndicatorSize.tab, // Full width of the tab
                      tabs: const [
                        Tab(text: 'Tables'),
                        Tab(text: 'Orders'),
                        Tab(text: 'Bills'),
                      ],
                    )),
              ),

              // SizedBox(
              //   height: 12,
              // ),
              Divider(
                height: 0,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Tablespart(), // First tab content
                    OrderPage(), // Second tab content
                    FinishedOrders(), // 3 tab content
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// First Tab Content
