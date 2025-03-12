import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/order%20details/order_details_bloc.dart';
import 'package:restaurant_kot/application/stock/stock_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/domain/cus/customer_model.dart';
import 'package:restaurant_kot/domain/item/kot_item_model.dart';
import 'package:restaurant_kot/infrastructure/img.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/widgets/img.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/widgets/update.dart';
import 'package:shimmer/shimmer.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final kotItem product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          elevation: 0,
          // borderOnForeground: true,
          shadowColor: const Color.fromARGB(255, 241, 241, 241),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              onTap: () {
                showProductDetails(context, product);
              },
              contentPadding: const EdgeInsets.only(left: 8, top: 5, bottom: 5),
              leading: Container(
                  height: 100,
                  width: 60,
                  decoration: BoxDecoration(
                    color: boxbgclr,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      getimgpath(product.productImg),
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        // Fallback error image
                        return Image.asset(
                          'assets/img/no data/noimg.png',
                          fit: BoxFit.fill,
                        );
                      },
                    ),
                  )),
              title: Text(
                product.itemName,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(product.quantity == 0
                    ? '₹ ${product.basicRate} /-'
                    : '₹ ${product.basicRate * product.quantity} /-'),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Container(
                        decoration: BoxDecoration(
                            color: mainclr,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 17,
                          ),
                        )),
                    onPressed: () {
                      BlocProvider.of<StockBloc>(context).add(StockEvent.add(
                          isIncrement: false,
                          productid: product.itemCode,
                          qty: 1));
                      if (product.quantity != 0) {
                        BlocProvider.of<OrderDetailsBloc>(context).add(
                            OrderDetailsEvent.cancelQty(
                                currentItemid: product.itemCode));
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
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Text(
                      product.quantity.toString(),
                      style: const TextStyle(fontSize: 17),
                    ),
                  ),
                  IconButton(
                    icon: Container(
                        decoration: BoxDecoration(
                            color: mainclr,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.add,
                            size: 17,
                            color: Colors.white,
                          ),
                        )),
                    onPressed: () {
                      BlocProvider.of<StockBloc>(context).add(StockEvent.add(
                          isIncrement: true,
                          productid: product.itemCode,
                          qty: 1));

                      BlocProvider.of<OrderDetailsBloc>(context).add(
                          OrderDetailsEvent.addQty(
                              currentItemid: product.itemCode));
                    },
                  ),
                ],
              ),
              onLongPress: () {
                if (billEdit!) {
                  log('onLongPress goods');
                  updatebox(
                    context: context,
                    productid: product.itemCode,
                    qty: product.quantity.toString(),
                    saleAmount: product.basicRate,
                    serOrGoods: product.serOrGoods,
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Sorry",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "You have no permission to update the Amount",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      backgroundColor: mainclr,
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.all(12),
                      duration: Duration(seconds: 4),
                    ),
                  );
                }
              },
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Divider(
            height: 0,
          ),
        )
      ],
    );
  }
}

Widget _buildDetailRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      children: [
        const SizedBox(width: 4),
        Text(
          "$label: ",
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        ),
      ],
    ),
  );
}

void showProductDetails(BuildContext context, kotItem product) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.itemName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: mainclr,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.red),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 8),
              _buildDetailRow("Item Code", product.itemCode),
              _buildDetailRow("kitchen Name", product.kitchenName),
              _buildDetailRow("Cess Rate", "${product.cessPer}%"),
              _buildDetailRow("GST Rate", "${product.gstPer}%"),
              _buildDetailRow("Item Rate", "₹ ${product.basicRate}"),
              const SizedBox(height: 16),
            ],
          ),
        ),
      );
    },
  );
}
