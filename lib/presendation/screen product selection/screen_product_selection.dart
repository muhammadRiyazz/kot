import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/order%20details/order_details_bloc.dart';
import 'package:restaurant_kot/application/stock/stock_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/domain/item/kot_item_model.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/category_selection.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/selected_product.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/widgets/update.dart';
import 'package:shimmer/shimmer.dart';

class ProductChoosingPage extends StatelessWidget {
  ProductChoosingPage({super.key, this.order, required this.tableinfo,required this.billNo,});

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
          iconTheme: IconThemeData(color: Colors.white),
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
        body: RefreshIndicator(
          backgroundColor: mainclr,
          color: mainclrbg,
          onRefresh: () async {
            searchController.clear();
            BlocProvider.of<StockBloc>(context).add(StockEvent.itemInitalFetch(
                acOrNonAc: tableinfo.acOrNonAc == 'AC' ? true : false));
          },
          child: BlocBuilder<StockBloc, StockState>(
            builder: (context, state) {
              return state.isLoading
                  ? Center(
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            color: Colors.white, // Placeholder box for title
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount:
                                  10, // Number of shimmer tiles to display
                              itemBuilder: (context, index) {
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      // leading: Container(
                                      //   width: 40,
                                      //   height: 40,
                                      //   color: Colors
                                      //       .white, // Placeholder box for leading widget
                                      // ),
                                      title: Container(
                                        height: 20,
                                        color: Colors
                                            .white, // Placeholder box for title
                                      ),
                                      subtitle: Container(
                                        height: 12,
                                        color: Colors
                                            .white, // Placeholder box for subtitle
                                      ),
                                      trailing: Container(
                                        width: 45,
                                        height: 30,
                                        color: Colors
                                            .white, // Placeholder box for trailing widget
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
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
                                              .add(const StockEvent.typeChange(
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
                                                  fontSize: state.goodsOrSER ==
                                                          'Service'
                                                      ? 14
                                                      : 10, // Font size for the active tab
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Container(
                                              height:
                                                  state.goodsOrSER == 'Service'
                                                      ? 2
                                                      : 0,
                                              color:
                                                  state.goodsOrSER == 'Service'
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
                                              .add(const StockEvent.typeChange(
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
                                                  fontSize: state.goodsOrSER ==
                                                          'Goods'
                                                      ? 14
                                                      : 10, // Font size for the active tab
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Container(
                                              height:
                                                  state.goodsOrSER == 'Goods'
                                                      ? 2
                                                      : 0,
                                              color: state.goodsOrSER == 'Goods'
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
                        SizedBox(
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
                                              .withOpacity(0.3), // Shadow color
                                          spreadRadius:
                                              1, // How much the shadow spreads
                                          blurRadius:
                                              7, // Softness of the shadow
                                          offset: const Offset(0,
                                              4), // Position of the shadow (x, y)
                                        ),
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    child: InkWell(
                                      onTap: () {
                                        searchController.clear();
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
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
                                                : state.selectedcategory!
                                                    .pdtFilter,
                                            style: const TextStyle(
                                                color: mainclr,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          state.selectedcategory != null
                                              ? InkWell(
                                                  onTap: () {
                                                    BlocProvider.of<StockBloc>(
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
                                    horizontal: 10, vertical: 2),
                                child: Container(
                                  padding: EdgeInsets.all(0),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(
                                                255, 206, 206, 206)
                                            .withOpacity(0.3), // Shadow color
                                        spreadRadius:
                                            1, // How much the shadow spreads
                                        blurRadius: 7, // Softness of the shadow
                                        offset: const Offset(0,
                                            4), // Position of the shadow (x, y)
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          controller: searchController,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(12),
                                            filled:
                                                true, // Fills the background
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
                                            suffix: InkWell(
                                                onTap: () {
                                                  if (searchController
                                                      .text.isNotEmpty) {
                                                    searchController.clear();
                                                    BlocProvider.of<StockBloc>(
                                                            context)
                                                        .add(const StockEvent
                                                            .clearcategory());
                                                  }
                                                },
                                                child: const Icon(
                                                  Icons.close,
                                                  color: Color.fromARGB(
                                                      255, 105, 105, 105),
                                                )),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(
                                                  15.0), // Rounded corners with radius 15
                                              borderSide: BorderSide
                                                  .none, // No border when enabled
                                            ),
                                          ),
                                          onChanged: (value) {
                                            log(value);
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      IconButton(
                                          padding: const EdgeInsets.all(0),
                                          onPressed: () {
                                            if (searchController.text != '') {
                                              BlocProvider.of<StockBloc>(
                                                      context)
                                                  .add(StockEvent.search(
                                                      searchQuary:
                                                          searchController.text,
                                                      acOrNonAc:
                                                          tableinfo.acOrNonAc ==
                                                                  'AC'
                                                              ? true
                                                              : false));
                                            }
                                          },
                                          icon: Container(
                                              height: 55,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: const Color
                                                              .fromARGB(255,
                                                              206, 206, 206)
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
                                                      BorderRadius.circular(
                                                          10)),
                                              child: const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15),
                                                child: Icon(
                                                  Icons.search,
                                                  color: Colors.white,
                                                ),
                                              )))
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 0),
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

                                            return Column(
                                              children: [
                                                Card(
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 8,
                                                  ),
                                                  elevation: 0,
                                                  // borderOnForeground: true,
                                                  shadowColor:
                                                      const Color.fromARGB(
                                                          255, 241, 241, 241),
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 8),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: ListTile(
                                                      onTap: () {
                                                        String dialogContent =
                                                            '''
Item quantity : ${product.quantity}
                                                Item qty : ${product.qty}
                                                
                                                Item Name: ${product.itemName}
                                                Kitchen Name: ${product.kitchenName}
                                                Service or Goods: ${product.serOrGoods}
                                                Basic Rate: ${product.basicRate.toString()}
                                                Unit Taxable Amount Before Discount: ${product.unitTaxableAmountBeforeDiscount.toString()}
                                                Unit Taxable Amount: ${product.unitTaxableAmount.toString()}
                                                Cess Percentage: ${product.cessPer.toString()}
                                                GST Percentage: ${product.gstPer.toString()}
                                                ''';

                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              title: const Text(
                                                                  'Product Details'),
                                                              content:
                                                                  SingleChildScrollView(
                                                                child: Text(
                                                                    dialogContent),
                                                              ),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop(),
                                                                  child:
                                                                      const Text(
                                                                          'OK'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      },
                                                      contentPadding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              top: 5,
                                                              bottom: 5),
                                                      leading: Container(
                                                        height: 100,
                                                        width: 60,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: boxbgclr,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          child: Image.network(
                                                            'https://www.shutterstock.com/shutterstock/photos/2468105649/display_1500/stock-photo--chicken-biryani-quick-and-tasty-chicken-biryani-chicken-dum-biryani-plan-background-2468105649.jpg',
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                      title: Text(
                                                        product.itemName,
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
                                                                    .quantity ==
                                                                0
                                                            ? '₹ ${product.basicRate} /-'
                                                            : '₹ ${product.basicRate * product.quantity} /-'),
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
                                                                          .all(
                                                                              5),
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
                                                                      productid:
                                                                          product
                                                                              .itemCode,
                                                                      qty: 1));
                                                              if (product
                                                                      .quantity !=
                                                                  0) {
                                                                BlocProvider.of<
                                                                            OrderDetailsBloc>(
                                                                        context)
                                                                    .add(OrderDetailsEvent
                                                                        .cancelQty(
                                                                            currentItemid:
                                                                                product.itemCode));
                                                              }

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
                                                              product.quantity
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
                                                                      EdgeInsets
                                                                          .all(
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
                                                                      productid:
                                                                          product
                                                                              .itemCode,
                                                                      qty: 1));

                                                              BlocProvider
                                                                      .of<OrderDetailsBloc>(
                                                                          context)
                                                                  .add(OrderDetailsEvent.addQty(
                                                                      currentItemid:
                                                                          product
                                                                              .itemCode));
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                      onLongPress: () {
                                                        log('onLongPress goods');
                                                        updatebox(
                                                          context: context,
                                                          productid:
                                                              product.itemCode,
                                                          qty: product.quantity
                                                              .toString(),
                                                          saleAmount:
                                                              product.basicRate,
                                                          serOrGoods: product
                                                              .serOrGoods,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 12),
                                                  child: Divider(
                                                    height: 0,
                                                  ),
                                                )
                                              ],
                                            );
                                          },
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(color: Colors.white),
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
                                              // BlocProvider.of<ItemsToKotBloc>(
                                              //        context)
                                              //        .add(ItemsToKotEvent
                                              //        .itemsFromOrder(
                                              //        items: state.toKOTitems));
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                builder: (context) {
                                                  return SelectedProductsPage(billNo: billNo,
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
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            trailing: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 5),
                                              decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  color: Colors.white),
                                              child: const Row(
                                                mainAxisSize: MainAxisSize.min,
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
                                                    text:
                                                        state.toKOTitems.isEmpty
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
                                                            255, 255, 255, 255),
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
                                                            255, 255, 255, 255),
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
                    );
            },
          ),
        ),
      ),
    );
  }
}
