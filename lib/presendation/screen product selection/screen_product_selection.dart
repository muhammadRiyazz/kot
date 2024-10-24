import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/items%20To%20Kot/items_to_kot_bloc.dart';
import 'package:restaurant_kot/application/stock/stock_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/domain/stock/stock_model.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/category_selection.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/selected_product.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/widgets/update.dart';

class ProductChoosingPage extends StatelessWidget {
  ProductChoosingPage({super.key, required this.table, this.order});

  // // Selected products
  final String table;
  String? order;

  TextEditingController serController = TextEditingController();
  TextEditingController goodsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // BlocProvider.of<StockBloc>(context).add(const StockEvent.fetchStocks());
      // BlocProvider.of<StockBloc>(context).add(const StockEvent.fetchCategory());
    });

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: mainclrbg,
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Goods',
              ), // Use Tab instead of Text for better styling
              Tab(text: 'Service'), // Use Tab instead of Text
            ],
            labelStyle: TextStyle(
              fontFamily: 'Montserrat', // Apply Montserrat font globally

              fontSize: 16, // Font size for the active tab
              fontWeight: FontWeight.bold, // Font weight for the active tab
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: 'Montserrat', // Apply Montserrat font globally

              fontSize: 15, // Font size for inactive tab
              fontWeight: FontWeight.w500, // Font weight for inactive tab
            ),
            labelColor: mainclr, // Color for the active tab text
            unselectedLabelColor:
                Colors.grey, // Color for the inactive tab text
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 4.0, // Thickness of the underline
                color: mainclr, // Color of the underline
              ),
              insets: EdgeInsets.symmetric(
                  horizontal: 30.0), // Controls the width of the underline
            ),
            indicatorSize: TabBarIndicatorSize
                .tab, // Makes the underline span the whole tab
          ),
          backgroundColor: appbarbg,
          title: const Center(
              child: Text(
            'Select Items',
            style: TextStyle(fontSize: 18),
          )),
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
            BlocProvider.of<StockBloc>(context)
                .add(const StockEvent.fetchStocksAndCategory());
          },
          child: BlocBuilder<StockBloc, StockState>(
            builder: (context, state) {
              return state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: TabBarView(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 50,
                                          padding: const EdgeInsetsDirectional
                                              .symmetric(horizontal: 20),
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
                                              color: mainclr,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                table,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15,
                                                      vertical: 10),
                                              child: InkWell(
                                                onTap: () {
                                                  // goodsController.clear();
                                                  showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.vertical(
                                                              top: Radius
                                                                  .circular(
                                                                      16)),
                                                    ),
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return const CategoryBottomSheet(
                                                        from: 'GOODS',
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      state.goodscategory ==
                                                              null
                                                          ? 'All Category'
                                                          : state.goodscategory!
                                                              .pdtFilter,
                                                      style: const TextStyle(
                                                          color: mainclr,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    state.goodscategory != null
                                                        ? InkWell(
                                                            onTap: () {
                                                              BlocProvider.of<
                                                                          StockBloc>(
                                                                      context)
                                                                  .add(const StockEvent
                                                                      .clearcategory());
                                                            },
                                                            child:
                                                                const Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.0),
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
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 2),
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
                                      ),
                                      child: TextField(
                                        controller: goodsController,
                                        decoration: InputDecoration(
                                          filled: true, // Fills the background
                                          fillColor: const Color.fromARGB(
                                              255,
                                              255,
                                              255,
                                              255), // Set background color to white
                                          hintText: 'Search',
                                          labelStyle: const TextStyle(
                                            color:
                                                mainclr, // Set label color to green
                                          ),
                                          prefixIcon: const Icon(
                                            Icons.search,
                                            color:
                                                mainclr, // Set icon color to green
                                          ),
                                          // Remove any visible borders and add 15.0 radius
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                15.0), // Rounded corners with radius 15
                                            borderSide:
                                                BorderSide.none, // No border
                                          ),
                                          // When the TextField is focused, keep the borderless style
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                15.0), // Rounded corners with radius 15
                                            borderSide: BorderSide
                                                .none, // No border on focus
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                15.0), // Rounded corners with radius 15
                                            borderSide: BorderSide
                                                .none, // No border when enabled
                                          ),
                                        ),
                                        onChanged: (value) {
                                          log(value);
                                          BlocProvider.of<StockBloc>(context)
                                              .add(StockEvent.search(
                                                  searchQuary: value,
                                                  from: 'GOODS'));
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: RefreshIndicator(
                                      backgroundColor: mainclr,
                                      color: mainclrbg,
                                      onRefresh: () async {
                                        BlocProvider.of<StockBloc>(context).add(
                                            const StockEvent
                                                .fetchStocksAndCategory());
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0),
                                        child: state.goodsProducts.isEmpty
                                            ? Center(
                                                child: Image.asset(
                                                    'assets/img/no data/No_data.png'),
                                              )
                                            : ListView.separated(
                                                separatorBuilder:
                                                    (context, index) {
                                                  return const SizedBox(
                                                    height: 7,
                                                  );
                                                },
                                                itemCount:
                                                    state.goodsProducts.length,
                                                itemBuilder: (context, index) {
                                                  final product = state
                                                      .goodsProducts[index];
                                                  return Card(
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 12,
                                                        vertical: 3),
                                                    elevation: 6,
                                                    borderOnForeground: true,
                                                    shadowColor:
                                                        const Color.fromARGB(
                                                            255, 241, 241, 241),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      child: ListTile(
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 8,
                                                                top: 8,
                                                                bottom: 8),
                                                        // leading: Container(
                                                        //   height: 100,
                                                        //   width: 60,
                                                        //   decoration: BoxDecoration(
                                                        //     color: boxbgclr,
                                                        //     borderRadius:
                                                        //         BorderRadius.circular(
                                                        //             10),
                                                        //   ),
                                                        //   child: ClipRRect(
                                                        //     borderRadius:
                                                        //         BorderRadius.circular(
                                                        //             10),
                                                        //     // child: Image.network(
                                                        //     //   product,
                                                        //     //   fit: BoxFit.fill,
                                                        //     // ),
                                                        //   ),
                                                        // ),
                                                        title: Text(
                                                          product.productName,
                                                          style: const TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        subtitle: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 5),
                                                          child: Text(product
                                                                      .changedQty ==
                                                                  0
                                                              ? '₹ ${product.saleAmount} /-'
                                                              : '₹ ${(double.parse(product.saleAmount) * product.changedQty).toDouble()} /-'),
                                                        ),
                                                        trailing: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            IconButton(
                                                              icon: Container(
                                                                  decoration: BoxDecoration(
                                                                      color:
                                                                          mainclr,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child:
                                                                      const Padding(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(5),
                                                                    child: Icon(
                                                                      Icons
                                                                          .remove,
                                                                      color: Colors
                                                                          .white,
                                                                      size: 17,
                                                                    ),
                                                                  )),
                                                              onPressed: () {
                                                                BlocProvider.of<
                                                                            StockBloc>(
                                                                        context)
                                                                    .add(StockEvent.add(
                                                                        isIncrement:
                                                                            false,
                                                                        from:
                                                                            'GOODS',
                                                                        product:
                                                                            product,
                                                                        qty:
                                                                            1));
                                                                // BlocProvider.of<
                                                                //             ItemsToKotBloc>(
                                                                //         context)
                                                                //     .add(ItemsToKotEvent.add(
                                                                //         isIncrement:
                                                                //             false,
                                                                //         product:
                                                                //             product,
                                                                //         qty:
                                                                //             1));
                                                              },
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          2),
                                                              child: Text(
                                                                product
                                                                    .changedQty
                                                                    .toString(),
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            17),
                                                              ),
                                                            ),
                                                            IconButton(
                                                              icon: Container(
                                                                  decoration: BoxDecoration(
                                                                      color:
                                                                          mainclr,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child:
                                                                      const Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            5.0),
                                                                    child: Icon(
                                                                      Icons.add,
                                                                      size: 17,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  )),
                                                              onPressed: () {
                                                                BlocProvider.of<
                                                                            StockBloc>(
                                                                        context)
                                                                    .add(StockEvent.add(
                                                                        isIncrement:
                                                                            true,
                                                                        from:
                                                                            'GOODS',
                                                                        product:
                                                                            product,
                                                                        qty:
                                                                            1));

                                                                // BlocProvider.of<
                                                                //             ItemsToKotBloc>(
                                                                //         context)
                                                                //     .add(ItemsToKotEvent.add(
                                                                //         isIncrement:
                                                                //             true,
                                                                //         product:
                                                                //             product,
                                                                //         qty:
                                                                //             1));
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        onLongPress: () {
                                                          log('onLongPress goods');
                                                          updatebox(
                                                              context, product);
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

//
//
//
//
//
//
//
//
//
                              //
                              //
                              //
                              //
                              //
                              //
                              //
                              //
                              //
                              //
                              //
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 50,
                                          padding: const EdgeInsetsDirectional
                                              .symmetric(horizontal: 20),
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
                                              color: mainclr,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                table,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15,
                                                      vertical: 10),
                                              child: InkWell(
                                                onTap: () {
                                                  serController.clear();

                                                  showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.vertical(
                                                              top: Radius
                                                                  .circular(
                                                                      16)),
                                                    ),
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return const CategoryBottomSheet(
                                                        from: 'SER',
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      state.sercategory == null
                                                          ? 'All Category'
                                                          : state.sercategory!
                                                              .pdtFilter,
                                                      style: const TextStyle(
                                                          color: mainclr,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    state.sercategory != null
                                                        ? InkWell(
                                                            onTap: () {
                                                              BlocProvider.of<
                                                                          StockBloc>(
                                                                      context)
                                                                  .add(const StockEvent
                                                                      .clearcategory());
                                                            },
                                                            child:
                                                                const Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.0),
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
                                      ],
                                    ),
                                  ),
                                  // const SizedBox(
                                  //   height: 10,
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(horizontal: 10),
                                  //   child: Container(
                                  //     decoration: BoxDecoration(
                                  //       color: Colors.white,
                                  //       borderRadius: BorderRadius.circular(15),
                                  //     ),
                                  //     child: const ListTile(
                                  //       contentPadding: EdgeInsets.symmetric(
                                  //           horizontal: 15, vertical: 3),
                                  //       splashColor: Color.fromARGB(0, 255, 255, 255),
                                  //       tileColor: Color.fromARGB(0, 255, 255, 255),
                                  //       title: Text(
                                  //         'Table No: TB 001',
                                  //         style: TextStyle(
                                  //             fontSize: 16, fontWeight: FontWeight.w600),
                                  //       ),
                                  //       // subtitle: Text('Order No: ORD001', style: TextStyle(
                                  //       //       fontSize: 15, fontWeight: FontWeight.w500)),
                                  //     ),
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 2),
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
                                      ),
                                      child: TextField(
                                        controller: serController,
                                        decoration: InputDecoration(
                                          filled: true, // Fills the background
                                          fillColor: const Color.fromARGB(
                                              255,
                                              255,
                                              255,
                                              255), // Set background color to white
                                          hintText: 'Search',
                                          labelStyle: const TextStyle(
                                            color:
                                                mainclr, // Set label color to green
                                          ),
                                          prefixIcon: const Icon(
                                            Icons.search,
                                            color:
                                                mainclr, // Set icon color to green
                                          ),
                                          // Remove any visible borders and add 15.0 radius
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                15.0), // Rounded corners with radius 15
                                            borderSide:
                                                BorderSide.none, // No border
                                          ),
                                          // When the TextField is focused, keep the borderless style
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                15.0), // Rounded corners with radius 15
                                            borderSide: BorderSide
                                                .none, // No border on focus
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                15.0), // Rounded corners with radius 15
                                            borderSide: BorderSide
                                                .none, // No border when enabled
                                          ),
                                        ),
                                        onChanged: (value) {
                                          log(value);

                                          BlocProvider.of<StockBloc>(context)
                                              .add(StockEvent.search(
                                                  searchQuary: value,
                                                  from: 'SER'));
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: RefreshIndicator(
                                      backgroundColor: mainclr,
                                      color: mainclrbg,
                                      onRefresh: () async {
                                        BlocProvider.of<StockBloc>(context).add(
                                            const StockEvent
                                                .fetchStocksAndCategory());
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 00),
                                        child: state.serProducts.isEmpty
                                            ? Center(
                                                child: Image.asset(
                                                    'assets/img/no data/No_data.png'),
                                              )
                                            : ListView.separated(
                                                separatorBuilder:
                                                    (context, index) {
                                                  return const SizedBox(
                                                    height: 7,
                                                  );
                                                },
                                                itemCount:
                                                    state.serProducts.length,
                                                itemBuilder: (context, index) {
                                                  final product =
                                                      state.serProducts[index];
                                                  return Card(
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 12,
                                                        vertical: 3),
                                                    elevation: 6,
                                                    borderOnForeground: true,
                                                    shadowColor:
                                                        const Color.fromARGB(
                                                            255, 244, 244, 244),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      child: ListTile(
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 8,
                                                                top: 8,
                                                                bottom: 8),
                                                        // leading: Container(
                                                        //   height: 100,
                                                        //   width: 60,
                                                        //   decoration: BoxDecoration(
                                                        //     color: boxbgclr,
                                                        //     borderRadius:
                                                        //         BorderRadius.circular(
                                                        //             10),
                                                        //   ),
                                                        //   child: ClipRRect(
                                                        //     borderRadius:
                                                        //         BorderRadius.circular(
                                                        //             10),
                                                        //     // child: Image.network(
                                                        //     //   product,
                                                        //     //   fit: BoxFit.fill,
                                                        //     // ),
                                                        //   ),
                                                        // ),
                                                        title: Text(
                                                          product.productName,
                                                          style: const TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        subtitle: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 5),
                                                          child: Text(
                                                              '₹ ${product.saleAmount}/-'),
                                                        ),
                                                        trailing: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            IconButton(
                                                              icon: Container(
                                                                  decoration: BoxDecoration(
                                                                      color:
                                                                          mainclr,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child:
                                                                      const Padding(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(5),
                                                                    child: Icon(
                                                                      Icons
                                                                          .remove,
                                                                      color: Colors
                                                                          .white,
                                                                      size: 17,
                                                                    ),
                                                                  )),
                                                              onPressed: () {
                                                                BlocProvider.of<
                                                                            StockBloc>(
                                                                        context)
                                                                    .add(StockEvent.add(
                                                                        isIncrement:
                                                                            false,
                                                                        from:
                                                                            'SER',
                                                                        product:
                                                                            product,
                                                                        qty:
                                                                            1));

                                                                // BlocProvider.of<
                                                                //             ItemsToKotBloc>(
                                                                //         context)
                                                                //     .add(ItemsToKotEvent.add(
                                                                //         isIncrement:
                                                                //             false,
                                                                //         product:
                                                                //             product,
                                                                //         qty:
                                                                //             1));
                                                              },
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          2),
                                                              child: Text(
                                                                product
                                                                    .changedQty
                                                                    .toString(),
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            17),
                                                              ),
                                                            ),
                                                            IconButton(
                                                              icon: Container(
                                                                  decoration: BoxDecoration(
                                                                      color:
                                                                          mainclr,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child:
                                                                      const Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            5.0),
                                                                    child: Icon(
                                                                      Icons.add,
                                                                      size: 17,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  )),
                                                              onPressed: () {
                                                                BlocProvider.of<
                                                                            StockBloc>(
                                                                        context)
                                                                    .add(StockEvent.add(
                                                                        isIncrement:
                                                                            true,
                                                                        from:
                                                                            'SER',
                                                                        product:
                                                                            product,
                                                                        qty:
                                                                            1));
                                                                // BlocProvider.of<
                                                                //             ItemsToKotBloc>(
                                                                //         context)
                                                                //     .add(ItemsToKotEvent.add(
                                                                //         isIncrement:
                                                                //             true,
                                                                //         product:
                                                                //             product,
                                                                //         qty:
                                                                //             1));
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        onLongPress: () {
                                                          updatebox(
                                                              context, product);
                                                          log('onLongPress ser');
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // selectedProducts.isNotEmpty
                        //     ?
                        // BlocBuilder<ItemsToKotBloc, ItemsToKotState>(
                        //   builder: (context, state) {
                        //     return
                        state.toKOTitems.isEmpty
                            ? const SizedBox()
                            : Container(
                                decoration: const BoxDecoration(color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 7, right: 10, left: 10),
                                  child: Card(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: mainclr,
                                      ),
                                      child: ListTile(
                                        onTap: () {
                                          // BlocProvider.of<ItemsToKotBloc>(
                                          //         context)
                                          //     .add(ItemsToKotEvent
                                          //         .itemsFromOrder(
                                          //             items: state.toKOTitems));
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return const SelectedProductsPage();
                                            },
                                          ));
                                        },
                                        title: Text(
                                          '${state.toKOTitems.length} Items Added',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        trailing: const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'View',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.arrow_right,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }

  
}
