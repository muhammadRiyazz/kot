import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/stock/stock_bloc.dart';
import 'package:restaurant_kot/infrastructure/img.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/screen_product_selection.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/widgets/img.dart';
import 'package:shimmer/shimmer.dart';
import '../../consts/colors.dart';

class CategoryBottomSheet extends StatelessWidget {
  const CategoryBottomSheet({super.key, required this.ac});
  final bool ac;
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
              const SizedBox(
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
                    childAspectRatio: 0.8, // Adjust for more height
                  ),
                  itemCount: state.category.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        BlocProvider.of<StockBloc>(context).add(
                          StockEvent.categorySelection(
                            acOrNonAc: ac,
                            category: state.category[index],
                          ),
                        );

                        // Close the bottom sheet
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: state.selectedcategory != null &&
                                      state.category[index] ==
                                          state.selectedcategory
                                  ? mainclr
                                  : boxbgwhite),
                          color: boxbgwhite,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 70,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: boxbgclr,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child:ProductImageWidget(itemCode:state.category[index] ,),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Flexible(
                                child: Text(
                                  state.category[index],
                                  textAlign: TextAlign.center,
                                  maxLines:
                                      2, // Allow for up to 2 lines of text
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: mainclr,
                                  ),
                                ),
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
