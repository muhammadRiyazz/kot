import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/BillSubmitPrint/bill_submit_print_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/core/printer/network_printer.dart';

class Printpage extends StatelessWidget {
  const Printpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: BlocConsumer<BillSubmitPrintBloc, BillSubmitPrintState>(
          listener: (context, state) {
            if (state.printerstatus == 2) {
              showErrorBottomSheet(context, () {});
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 25,
                ),
               
                const Text(
                  'Printing was not completed\nPlease check the printer for any issues.',
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'Try again',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Use Expanded or Flexible for responsive image
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Image.asset(
                      'assets/img/printer/printerb.jpg',
                      fit: BoxFit
                          .contain, // Adjust to ensure the image fits within the available space
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 32),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.white, // Set the button background color
                        minimumSize: const Size(
                            double.infinity, 55), // Full-width button
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: mainclr),
                          borderRadius:
                              BorderRadius.circular(20), // Border radius of 10
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Re-Print',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: mainclr),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
