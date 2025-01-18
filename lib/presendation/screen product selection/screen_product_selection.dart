import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/KotSubmitPrint/kot_submit_print_bloc.dart';
import 'package:restaurant_kot/application/order%20details/order_details_bloc.dart';
import 'package:restaurant_kot/application/stock/stock_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/domain/cus/customer_model.dart';
import 'package:restaurant_kot/domain/item/kot_item_model.dart';
import 'package:restaurant_kot/infrastructure/img.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/category_selection.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/selected_product.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/widgets/product_card.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/widgets/update.dart';
import 'package:shimmer/shimmer.dart';

class ProductChoosingPage extends StatelessWidget {
  ProductChoosingPage({
    super.key,
    this.order,
    required this.tableinfo,
    required this.billNo,
  });

  // // Selected products
  String? order;
  final TableInfo tableinfo;
  final String billNo;

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<StockBloc>(context)
          .add(const StockEvent.typeChange(type: 'Service'));
    });

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: mainclrbg,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          // bottom: const TabBar(
          //   tabs: [
          //     Tab(
          //       text: 'Goods',
          //     ), // Use Tab instead of Text for better styling
          //     Tab(text: 'Service'), // Use Tab instead of Text
          //   ],
          //   labelStyle: TextStyle(
          //     fontFamily: 'Montserrat', // Apply Montserrat font globally

          //     fontSize: 16, // Font size for the active tab
          //     fontWeight: FontWeight.bold, // Font weight for the active tab
          //   ),
          //   unselectedLabelStyle: TextStyle(
          //     fontFamily: 'Montserrat', // Apply Montserrat font globally

          //     fontSize: 15, // Font size for inactive tab
          //     fontWeight: FontWeight.w500, // Font weight for inactive tab
          //   ),
          //   labelColor: mainclr, // Color for the active tab text
          //   unselectedLabelColor:
          //       Colors.grey, // Color for the inactive tab text
          //   indicator: UnderlineTabIndicator(
          //     borderSide: BorderSide(
          //       width: 4.0, // Thickness of the underline
          //       color: mainclr, // Color of the underline
          //     ),
          //     insets: EdgeInsets.symmetric(
          //         horizontal: 30.0), // Controls the width of the underline
          //   ),
          //   indicatorSize: TabBarIndicatorSize
          //       .tab, // Makes the underline span the whole tab
          // ),
          backgroundColor: mainclr,
          title: const Center(
              child: Text(
            'Items',
            style: TextStyle(fontSize: 18, color: Colors.white),
          )),
          actions: const [
            // Navigation to selected products page
            SizedBox(
              width: 60,
            )
          ],
        ),
        body: BlocBuilder<StockBloc, StockState>(
          builder: (context, state) {
            return RefreshIndicator(
                backgroundColor: mainclr,
                color: mainclrbg,
                onRefresh: () async {
                  searchController.clear();

                  if (state.selectedcategory == null) {
                    BlocProvider.of<StockBloc>(context).add(
                        StockEvent.itemInitalFetch(
                            acOrNonAc:
                                tableinfo.acOrNonAc == 'AC' ? true : false));
                  } else {
                    BlocProvider.of<StockBloc>(context).add(
                      StockEvent.categorySelection(
                        acOrNonAc: tableinfo.acOrNonAc == 'AC' ? true : false,
                        category: state.selectedcategory!,
                      ),
                    );
                  }
                },
                child: state.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: [
                          // const SizedBox(
                          //   height: 5,
                          // ),
                          Container(
                            color: mainclr,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 0,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          searchController.clear();

                                          if (state.goodsOrSER != 'Service') {
                                            BlocProvider.of<StockBloc>(context)
                                                .add(
                                                    const StockEvent.typeChange(
                                                        type: 'Service'));
                                          }
                                        },
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                'Service',
                                                style: TextStyle(
                                                    color: state.goodsOrSER ==
                                                            'Service'
                                                        ? const Color.fromARGB(
                                                            255, 255, 255, 255)
                                                        : Colors.grey,
                                                    fontSize: state
                                                                .goodsOrSER ==
                                                            'Service'
                                                        ? 14
                                                        : 10, // Font size for the active tab
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Container(
                                                height: state.goodsOrSER ==
                                                        'Service'
                                                    ? 2
                                                    : 0,
                                                color: state.goodsOrSER ==
                                                        'Service'
                                                    ? const Color.fromARGB(
                                                        255, 255, 255, 255)
                                                    : const Color.fromARGB(
                                                        0, 121, 9, 86),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          searchController.clear();

                                          if (state.goodsOrSER != 'Goods') {
                                            BlocProvider.of<StockBloc>(context)
                                                .add(
                                                    const StockEvent.typeChange(
                                                        type: 'Goods'));
                                          }
                                        },
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                'Goods',
                                                style: TextStyle(
                                                    color: state.goodsOrSER ==
                                                            'Goods'
                                                        ? const Color.fromARGB(
                                                            255, 255, 255, 255)
                                                        : Colors.grey,
                                                    fontSize: state
                                                                .goodsOrSER ==
                                                            'Goods'
                                                        ? 14
                                                        : 10, // Font size for the active tab
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Container(
                                                height:
                                                    state.goodsOrSER == 'Goods'
                                                        ? 2
                                                        : 0,
                                                color:
                                                    state.goodsOrSER == 'Goods'
                                                        ? const Color.fromARGB(
                                                            255, 255, 255, 255)
                                                        : const Color.fromARGB(
                                                            0, 121, 9, 86),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color.fromARGB(
                                                    255, 206, 206, 206)
                                                .withOpacity(
                                                    0.3), // Shadow color
                                            spreadRadius:
                                                1, // How much the shadow spreads
                                            blurRadius:
                                                7, // Softness of the shadow
                                            offset: const Offset(0,
                                                4), // Position of the shadow (x, y)
                                          ),
                                        ],
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      child: InkWell(
                                        onTap: () {
                                          searchController.clear();
                                          showModalBottomSheet(
                                            isScrollControlled: true,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top: Radius.circular(16)),
                                            ),
                                            context: context,
                                            builder: (BuildContext context) {
                                              return CategoryBottomSheet(
                                                ac: tableinfo.acOrNonAc == 'AC'
                                                    ? true
                                                    : false,
                                              );
                                            },
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              state.selectedcategory == null
                                                  ? 'All Category'
                                                  : state.selectedcategory!,
                                              style: const TextStyle(
                                                  color: mainclr,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            state.selectedcategory != null
                                                ? InkWell(
                                                    onTap: () {
                                                      BlocProvider.of<
                                                                  StockBloc>(
                                                              context)
                                                          .add(const StockEvent
                                                              .clearcategory());
                                                    },
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: Icon(
                                                        Icons.close,
                                                        color: mainclr,
                                                      ),
                                                    ))
                                                : const Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: mainclr,
                                                    size: 30,
                                                  )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color.fromARGB(
                                                  255, 206, 206, 206)
                                              .withOpacity(0.3), // Shadow color
                                          spreadRadius:
                                              1, // How much the shadow spreads
                                          blurRadius:
                                              7, // Softness of the shadow
                                          offset: const Offset(0,
                                              4), // Position of the shadow (x, y)
                                        ),
                                      ],
                                    ),
                                    child: TextField(
                                      controller: searchController,
                                      decoration: InputDecoration(          filled: true, // Fills the background
                                        fillColor: const Color.fromARGB(
                                            255,
                                            255,
                                            255,
                                            255), // Set background color to white
                                        hintText: 'Type to search...',
                                        labelText: 'Search',
                                        prefixIcon: const Icon(Icons.search),
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.clear),
                                          onPressed: () {
                                            if (searchController
                                                .text.isNotEmpty) {
                                              searchController.clear();
                                              BlocProvider.of<StockBloc>(
                                                      context)
                                                  .add(const StockEvent
                                                      .clearcategory());
                                            }
                                          },
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onChanged: (value) {
                                        log(value);
                                        if (value != '') {
                                          BlocProvider.of<StockBloc>(context)
                                              .add(StockEvent.search(
                                                  searchQuary: value,
                                                  acOrNonAc:
                                                      tableinfo.acOrNonAc ==
                                                              'AC'
                                                          ? true
                                                          : false));
                                        }
                                      },
                                      textInputAction: TextInputAction
                                          .search, // Keyboard "Search" action
                                    ),
                                  ),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 10, vertical: 2),
                                //   child: Container(
                                //     padding: EdgeInsets.all(0),
                                //     decoration: BoxDecoration(
                                //   boxShadow: [
                                //     BoxShadow(
                                //       color: const Color.fromARGB(
                                //               255, 206, 206, 206)
                                //           .withOpacity(0.3), // Shadow color
                                //       spreadRadius:
                                //           1, // How much the shadow spreads
                                //       blurRadius:
                                //           7, // Softness of the shadow
                                //       offset: const Offset(0,
                                //           4), // Position of the shadow (x, y)
                                //     ),
                                //   ],
                                // ),
                                //     child: TextField(
                                //       controller: searchController,
                                //       decoration: InputDecoration(
                                //         // contentPadding:
                                //         //     EdgeInsets.all(15),
                                        // filled: true, // Fills the background
                                        // fillColor: const Color.fromARGB(
                                        //     255,
                                        //     255,
                                        //     255,
                                        //     255), // Set background color to white
                                //         hintText: 'Search',
                                //         labelStyle: const TextStyle(
                                //           color:
                                //               mainclr, // Set label color to green
                                //         ),
                                //         prefixIcon: const Icon(
                                //           Icons.search,
                                //           color:
                                //               mainclr, // Set icon color to green
                                //         ),
                                //         // Remove any visible borders and add 15.0 radius
                                //         border: OutlineInputBorder(
                                //           borderRadius: BorderRadius.circular(
                                //               15.0), // Rounded corners with radius 15
                                //           borderSide:
                                //               BorderSide.none, // No border
                                //         ),
                                //         // When the TextField is focused, keep the borderless style
                                //         focusedBorder: OutlineInputBorder(
                                //           borderRadius: BorderRadius.circular(
                                //               15.0), // Rounded corners with radius 15
                                //           borderSide: BorderSide
                                //               .none, // No border on focus
                                //         ),
                                //         suffix: InkWell(
                                //             onTap: () {
                                //               if (searchController
                                //                   .text.isNotEmpty) {
                                //                 searchController.clear();
                                //                 BlocProvider.of<StockBloc>(
                                //                         context)
                                //                     .add(const StockEvent
                                //                         .clearcategory());
                                //               }
                                //             },
                                //             child: const Padding(
                                //               padding: EdgeInsets.all(5.0),
                                //               child: Icon(
                                //                 Icons.close,
                                //                 color: Color.fromARGB(
                                //                     255, 0, 0, 0),
                                //               ),
                                //             )),
                                //         enabledBorder: OutlineInputBorder(
                                //           borderRadius: BorderRadius.circular(
                                //               15.0), // Rounded corners with radius 15
                                //           borderSide: BorderSide
                                //               .none, // No border when enabled
                                //         ),
                                //       ),
                                //       onChanged: (value) {
                                //         log(value);
                                //         if (value != '') {
                                //           BlocProvider.of<StockBloc>(context)
                                //               .add(StockEvent.search(
                                //                   searchQuary: value,
                                //                   acOrNonAc:
                                //                       tableinfo.acOrNonAc ==
                                //                               'AC'
                                //                           ? true
                                //                           : false));
                                //         }
                                //       },
                                //     ),
                                //   ),
                                // ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0),
                                    child: state.stocklist.isEmpty
                                        ? SingleChildScrollView(
                                            physics:
                                                const AlwaysScrollableScrollPhysics(),
                                            child: Center(
                                              child: Image.asset(
                                                  'assets/img/no data/No_data.png'),
                                            ),
                                          )
                                        : ListView.separated(
                                            separatorBuilder: (context, index) {
                                              return const SizedBox(
                                                height: 3,
                                              );
                                            },
                                            itemCount: state.stocklist.length,
                                            itemBuilder: (context, index) {
                                              final product =
                                                  state.stocklist[index];

                                              return ProductCard(
                                                  product: product);
                                            },
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 0, right: 3, left: 3),
                              child: Card(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: mainclr,
                                  ),
                                  child: Column(
                                    children: [
                                      state.toKOTitems.isEmpty
                                          ? const SizedBox()
                                          : ListTile(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 3,
                                                      horizontal: 15),
                                              onTap: () {
                                                BlocProvider.of<
                                                            KotSubmitPrintBloc>(
                                                        context)
                                                    .add(
                                                        const KotSubmitPrintEvent
                                                            .parcel(
                                                            parcel: false));
                                                // BlocProvider.of<ItemsToKotBloc>(
                                                //        context)
                                                //        .add(ItemsToKotEvent
                                                //        .itemsFromOrder(
                                                //        items: state.toKOTitems));
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                  builder: (context) {
                                                    return SelectedProductsPage(
                                                      billNo: billNo,
                                                      orderNo: order,
                                                      table: tableinfo,
                                                    );
                                                  },
                                                ));
                                              },
                                              title: Text(
                                                '${state.toKOTitems.length} Items Added',
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              trailing: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5, horizontal: 5),
                                                decoration: const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    color: Colors.white),
                                                child: const Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      '   Proceed',
                                                      style: TextStyle(
                                                          color: mainclr,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    SizedBox(
                                                      width: 3,
                                                    ),
                                                    Icon(
                                                      Icons.arrow_right,
                                                      color: mainclr,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                      state.toKOTitems.isEmpty
                                          ? const SizedBox()
                                          : Divider(
                                              height: 1,
                                            ),
                                      Container(
                                        decoration: const BoxDecoration(
                                            color: mainclr,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 18),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: state.toKOTitems
                                                              .isEmpty
                                                          ? 'Table No\n'
                                                          : '',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'Montserrat', // Apply Montserrat font globally

                                                        fontSize: 12,
                                                        color: Color.fromARGB(
                                                            255, 255, 255, 255),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: tableinfo.tableName,
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'Montserrat', // Apply Montserrat font globally

                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color.fromARGB(
                                                            255, 255, 255, 255),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if (order != null)
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: state.toKOTitems
                                                                .isEmpty
                                                            ? 'Order No\n'
                                                            : '',
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                          fontFamily:
                                                              'Montserrat', // Apply Montserrat font globally

                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: order,
                                                        style: const TextStyle(
                                                          fontSize: 15,
                                                          fontFamily:
                                                              'Montserrat', // Apply Montserrat font globally

                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ));
          },
        ),
      ),
    );
  }
}
