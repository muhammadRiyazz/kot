import 'dart:developer';

import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/items%20To%20Kot/items_to_kot_bloc.dart';
import 'package:restaurant_kot/application/stock/stock_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/presendation/conn/bluetooth.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/widgets/update.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';

class SelectedProductsPage extends StatelessWidget {
  const SelectedProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainclrbg,
      appBar: AppBar(
        backgroundColor: appbarbg,
        title: const Center(
          child: Text(
            'Selected Items',
            style: TextStyle(fontSize: 18),
          ),
        ),
        actions: const [
          SizedBox(width: 60),
        ],
      ),
      body: BlocBuilder<StockBloc, StockState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '   ${state.toKOTitems.length} Items',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Column(
                            children: List.generate(
                              state.toKOTitems.length,
                              (index) {
                                final product = state.toKOTitems[index];

                                return Card(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  elevation: 6,
                                  borderOnForeground: true,
                                  shadowColor:
                                      const Color.fromARGB(255, 244, 244, 244),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: ListTile(
                                      contentPadding: const EdgeInsets.only(
                                          left: 8, top: 8, bottom: 8),
                                      title: Text(
                                        product.productName,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      subtitle: Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Text(product.changedQty == 0
                                            ? '₹ ${product.saleAmount} /-'
                                            : '₹ ${(double.parse(product.saleAmount) * product.changedQty).toDouble()} /-'),
                                      ),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: Container(
                                              decoration: BoxDecoration(
                                                  color: mainclr,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: const Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Icon(
                                                  Icons.remove,
                                                  color: Colors.white,
                                                  size: 17,
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              if (state.toKOTitems.length ==
                                                      1 &&
                                                  product.changedQty == 1) {
                                                Navigator.pop(context);
                                              }
                                              BlocProvider.of<StockBloc>(
                                                      context)
                                                  .add(StockEvent.add(
                                                      isIncrement: false,
                                                      from: product.serOrGoods,
                                                      product: product,
                                                      qty: 1));
                                            },
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 2),
                                            child: Text(
                                              product.changedQty.toString(),
                                              style:
                                                  const TextStyle(fontSize: 17),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Container(
                                              decoration: BoxDecoration(
                                                  color: mainclr,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: const Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Icon(
                                                  Icons.add,
                                                  size: 17,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              BlocProvider.of<StockBloc>(
                                                      context)
                                                  .add(StockEvent.add(
                                                      isIncrement: true,
                                                      from: product.serOrGoods,
                                                      product: product,
                                                      qty: 1));
                                            },
                                          ),
                                        ],
                                      ),
                                      onLongPress: () {
                                        updatebox(context, product);
                                        log('onLongPress ser');
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 18),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: boxbgwhite,
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 103, 103, 103)
                                    .withOpacity(0.3),
                                blurRadius: 15,
                                spreadRadius: 5,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'If any note, please add here',
                                  style: TextStyle(
                                    color: mainclr,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  obscureText: false,
                                  validator: (value) {
                                    return null; // No validation
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Note',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 192, 192, 192),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 192, 192, 192),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 192, 192, 192),
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.note_alt_outlined),
                                    prefixIconColor: mainclr,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Parcel Order'),
                                    Checkbox(
                                      activeColor: mainclr,
                                      value: true,
                                      onChanged: (bool? value) {},
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: MainButton(
                    label: 'Print KOT',
                    onpress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScreenBluetooth(),
                          ));
                    },
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          );
        },
      ),
    );
  }
}
