import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/presendation/screen%20home/Drawr.dart';
import 'package:restaurant_kot/presendation/screen%20home/finished_orders.dart';
import 'package:restaurant_kot/presendation/screen%20home/tables_part.dart';

import 'orders_part.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        drawer: AppDrawer(), // Add the Drawer here

        backgroundColor: mainclrbg,
        appBar: AppBar(
          backgroundColor: appbarbg,
          // title: const Center(child: Text('ABC Hotel')),
          actions: const [
            SizedBox(
                // color: Colors.blue,
                height: 50,
                width: 50,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  // child: Image.asset('assets/img/logo/logoa.png'),
                )),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
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
                  borderRadius: BorderRadius.circular(15.0), // Rounded corners
                ),
                child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TabBar(
                      dividerHeight: 0,
                      indicator: BoxDecoration(
                        color: mainclr, // Selected tab background color
                        borderRadius:
                            BorderRadius.circular(15.0), // Rounded corners
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily:
                            'Montserrat', // Apply Montserrat font globally
                      ),
                      labelStyle: TextStyle(
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
              SizedBox(
                height: 12,
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
