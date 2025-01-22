import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/stock/stock_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';

Future<dynamic> updatebox({
  required BuildContext context,
  required String productid,
  required double saleAmount,
  required String qty,
  required String serOrGoods,
}) {
  final TextEditingController amountController =
      TextEditingController(text: saleAmount.toString());
  final TextEditingController qtyController =
      TextEditingController(text: int.parse(qty) == 0 ? null : qty);

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
                  final enteredAmount = double.tryParse(value);
                  if (enteredAmount == null) {
                    return 'Enter a valid number';
                  }
                  if (enteredAmount <= 0) {
                    return 'Amount must be greater than 0';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Quantity TextField
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
                  final enteredQty = double.tryParse(value); // Parse as double
                  if (enteredQty == null) {
                    return 'Enter a valid quantity';
                  }
                  if (enteredQty <= 0) {
                    return 'Quantity must be greater than 0';
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

                BlocProvider.of<StockBloc>(context).add(StockEvent.add(
                  isIncrement: true,
                  update: true,
                  amount: double.parse(amount),
                  productid: productid,
                  qty: int.parse(qty),
                )); // Parse qty as int

                Navigator.of(context).pop(); // Close dialog after update
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: mainclr,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
