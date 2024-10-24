import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/stock/stock_bloc.dart';

import '../../consts/colors.dart';

class CategoryBottomSheet extends StatelessWidget {
  const CategoryBottomSheet({super.key, required this.from});
  final String from;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StockBloc, StockState>(
      builder: (context, state) {
        return Container(
          height: MediaQuery.of(context).size.height *
              0.85, // Max height 90% of screen
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              // Handle grip (optional)
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2),
                ),
                margin: const EdgeInsets.only(bottom: 16),
              ),
              // Title
              const Text(
                'Select Category',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // GridView of Categories
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: .9,
                  ),
                  itemCount: from == 'SER'
                      ? state.serCategory.length
                      : state.goodsCategory.length,
                  itemBuilder: (context, index) {
                    final category = from == 'SER'
                        ? state.serCategory[index]
                        : state.goodsCategory[index];
                    return GestureDetector(
                      onTap: () {
                        BlocProvider.of<StockBloc>(context)
                            .add(StockEvent.categorySelection(
                          category: from == 'SER'
                              ? state.serCategory[index]
                              : state.goodsCategory[index],
                          from: from,
                        ));

                        // Return the selected category and close bottom sheet
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: from == 'SER'
                                ? state.sercategory != null &&
                                        state.serCategory[index] ==
                                            state.sercategory
                                    ? mainclr
                                    : boxbgwhite
                                : from == 'GOODS'
                                    ? state.goodscategory != null &&
                                            state.goodsCategory[index] ==
                                                state.goodscategory
                                        ? mainclr
                                        : boxbgwhite
                                    : null,
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Padding(
                              //   padding: const EdgeInsets.symmetric(
                              //       horizontal: 10, vertical: 6),
                              //   child: ClipRRect(
                              //     borderRadius: BorderRadius.circular(12),
                              //     child: Image.network(category.image,
                              //         height: 80, fit: BoxFit.fill),
                              //   ),
                              // ),
                              const SizedBox(height: 8),
                              Text(
                                category.pdtFilter,
                                style: TextStyle(
                                    color: from == 'SER'
                                        ? state.sercategory != null &&
                                                state.serCategory[index] ==
                                                    state.sercategory
                                            ? boxbgwhite
                                            : mainclr
                                        : from == 'GOODS'
                                            ? state.goodscategory != null &&
                                                    state.goodsCategory[
                                                            index] ==
                                                        state.goodscategory
                                                ? boxbgwhite
                                                : mainclr
                                            : null),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
