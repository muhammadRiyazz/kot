import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/stock/stock_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/domain/stock/stock_model.dart';

Future<dynamic> updatebox(BuildContext context, Product product) {
    final TextEditingController amountController =
        TextEditingController(text: product.saleAmount);
    final TextEditingController qtyController = TextEditingController(
        text: product.changedQty == 0 ? null : product.changedQty.toString());

    final _formKey = GlobalKey<FormState>(); // Form key for validation

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Update',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 7),
              Text(
                'Update the quantity or amount\nbelow',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          content: Form(
            key: _formKey, // Wrap content in Form widget
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Amount TextField
                TextFormField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Amount is required';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Enter a valid number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Quantity TextField with totalStock validation
                TextFormField(
                  controller: qtyController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Quantity',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Quantity is required';
                    }
                    final enteredQty =
                        double.tryParse(value); // Parse as double
                    if (enteredQty == null) {
                      return 'Enter a valid quantity';
                    }
                    final totalStock = double.tryParse(
                        product.totalStock); // Parse totalStock as double
                    if (enteredQty > totalStock!) {
                      return 'Quantity exceeds available stock (${product.totalStock})';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog without saving
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: mainclr),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Check if the form is valid before performing the update
                if (_formKey.currentState!.validate()) {
                  String amount = amountController.text;
                  String qty = qtyController.text;

                  // Perform update operation with amount and qty
                  if (product.serOrGoods == 'GOODS') {
                    BlocProvider.of<StockBloc>(context).add(StockEvent.add(
                        isIncrement: true,
                        from: 'GOODS',
                        update: true,
                        amount: amount,
                        product: product,
                        qty: int.parse(qty))); // Parse qty as int
                  } else if (product.serOrGoods == 'SER') {
                    BlocProvider.of<StockBloc>(context).add(StockEvent.add(
                        isIncrement: true,
                        from: 'SER',
                        update: true,
                        amount: amount,
                        product: product,
                        qty: int.parse(qty))); // Parse qty as int
                  }
                  Navigator.of(context).pop(); // Close dialog after update
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: mainclr,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Update',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }