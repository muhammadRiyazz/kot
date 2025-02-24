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

  final String? order;
  final TableInfo tableinfo;
  final String billNo;

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<StockBloc>()
          .add(const StockEvent.typeChange(type: 'Service'));
    });

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: mainclrbg,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: mainclr,
          title: const Center(
            child: Text(
              'Items',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          actions: const [
            SizedBox(width: 60),
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
                  context.read<StockBloc>().add(
                        StockEvent.itemInitalFetch(
                          acOrNonAc: tableinfo.acOrNonAc == 'AC',
                        ),
                      );
                } else {
                  context.read<StockBloc>().add(
                        StockEvent.categorySelection(
                          acOrNonAc: tableinfo.acOrNonAc == 'AC',
                          category: state.selectedcategory!,
                        ),
                      );
                }
              },
              child: state.isLoading
                  ? buildShimmerList()
                  : Column(
                      children: [
                        _buildTypeSelector(context, state),
                        const SizedBox(height: 10),
                        Expanded(
                          child: Column(
                            children: [
                              _buildCategorySelector(context, state),
                              const SizedBox(height: 5),
                              _buildSearchBar(context, state),
                              const SizedBox(height: 3),
                              _buildProductList(context, state),
                            ],
                          ),
                        ),
                        _buildBottomBar(context, state),
                      ],
                    ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTypeSelector(BuildContext context, StockState state) {
    return Container(
      color: mainclr,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTypeButton(
              context,
              label: 'Service',
              isActive: state.goodsOrSER == 'Service',
              onTap: () {
                searchController.clear();
                if (state.goodsOrSER != 'Service') {
                  context
                      .read<StockBloc>()
                      .add(const StockEvent.typeChange(type: 'Service'));
                }
              },
            ),
            const SizedBox(width: 12),
            _buildTypeButton(
              context,
              label: 'Goods',
              isActive: state.goodsOrSER == 'Goods',
              onTap: () {
                searchController.clear();
                if (state.goodsOrSER != 'Goods') {
                  context
                      .read<StockBloc>()
                      .add(const StockEvent.typeChange(type: 'Goods'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeButton(BuildContext context,
      {required String label,
      required bool isActive,
      required VoidCallback onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Column(
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isActive ? 14 : 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: isActive ? 2 : 0,
                color: isActive ? Colors.white : Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategorySelector(BuildContext context, StockState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 206, 206, 206).withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 4),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: InkWell(
            onTap: () {
              searchController.clear();
              showModalBottomSheet(
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                context: context,
                builder: (BuildContext context) {
                  return CategoryBottomSheet(
                    ac: tableinfo.acOrNonAc == 'AC',
                  );
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  state.selectedcategory ?? 'All Category',
                  style: const TextStyle(
                    color: mainclr,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                state.selectedcategory != null
                    ? InkWell(
                        onTap: () {
                          context
                              .read<StockBloc>()
                              .add(const StockEvent.clearcategory());
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.close,
                            color: mainclr,
                          ),
                        ),
                      )
                    : const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: mainclr,
                        size: 30,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context, StockState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 206, 206, 206).withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
          controller: searchController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Type to search...',
            labelText: 'Search',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                if (searchController.text.isNotEmpty) {
                  searchController.clear();
                  context
                      .read<StockBloc>()
                      .add(const StockEvent.clearcategory());
                }
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onChanged: (value) {
            log(value);
            if (value.isNotEmpty) {
              context.read<StockBloc>().add(
                    StockEvent.search(
                      searchQuary: value,
                      acOrNonAc: tableinfo.acOrNonAc == 'AC',
                    ),
                  );
            }
          },
          textInputAction: TextInputAction.search,
        ),
      ),
    );
  }

  Widget _buildProductList(BuildContext context, StockState state) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: state.stocklist.isEmpty
            ? SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Center(
                  child: Image.asset('assets/img/no data/No_data.png'),
                ),
              )
            : ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 3),
                itemCount: state.stocklist.length,
                itemBuilder: (context, index) {
                  final product = state.stocklist[index];
                  return ProductCard(product: product);
                },
              ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context, StockState state) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 0, right: 3, left: 3),
        child: Card(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: mainclr,
            ),
            child: Column(
              children: [
                if (state.toKOTitems.isNotEmpty)
                  ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                    onTap: () {
                      context
                          .read<KotSubmitPrintBloc>()
                          .add(const KotSubmitPrintEvent.parcel(parcel: false));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectedProductsPage(
                            billNo: billNo,
                            orderNo: order,
                            table: tableinfo,
                          ),
                        ),
                      );
                    },
                    title: Text(
                      '${state.toKOTitems.length} Items Added',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '   Proceed',
                            style: TextStyle(
                              color: mainclr,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 3),
                          Icon(
                            Icons.arrow_right,
                            color: mainclr,
                          ),
                        ],
                      ),
                    ),
                  ),
                if (state.toKOTitems.isNotEmpty) const Divider(height: 1),
                Container(
                  decoration: const BoxDecoration(
                    color: mainclr,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              if (state.toKOTitems.isEmpty)
                                const TextSpan(
                                  text: 'Table No\n',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              TextSpan(
                                text: tableinfo.tableName,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (order != null)
                          RichText(
                            text: TextSpan(
                              children: [
                                if (state.toKOTitems.isEmpty)
                                  const TextSpan(
                                    text: 'Order No\n',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                TextSpan(
                                  text: order,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
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
    );
  }
}

Widget buildShimmerList() {
  return ListView(
    children: [
      const SizedBox(height: 25.0),
      Column(
        children: List.generate(
          55,
          (index) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Container(
                                width: 150.0,
                                height: 15.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 12.0),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 70.0,
                                  height: 15.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18.0),
                    Container(
                      width: double.infinity,
                      height: 1.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
