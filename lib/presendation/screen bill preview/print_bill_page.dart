import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/BillSubmitPrint/bill_submit_print_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/core/printer/network_printer.dart';
import 'package:restaurant_kot/presendation/screen%20home/screen_home.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';

class BillPrintpage extends StatelessWidget {
  const BillPrintpage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => const HomeScreen(
                    from: 1,
                  )),
          (route) => false, // This removes all previous routes from the stack
        );
        return false; // Prevent back navigation
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: BlocConsumer<BillSubmitPrintBloc, BillSubmitPrintState>(
            listener: (context, state) {
              if (state.printerstatus == 2) {
                showErrorBottomSheet(context,(){});
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen(
                                          from: 1,
                                        )),
                                (route) =>
                                    false, // This removes all previous routes from the stack
                              );
                            },
                            icon: const Icon(
                              Icons.close,
                              size: 25,
                            )),
                      )),
                  Spacer(),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 50),
                    child: Column(
                      children: [
                        const Center(
                            child: CircleAvatar(
                          radius: 50,
                          backgroundColor: mainclr,
                          child: Icon(
                            Icons.done_rounded,
                            size: 73,
                            color: Colors.white,
                          ),
                        )),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Bill Submitted',
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          'Table No: TB 001',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        const Text('Order No: ORD001',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        const SizedBox(
                          height: 10,
                        ),
                        state.printerstatus == 1
                            ? const SizedBox()
                            : state.printerstatus == 2
                                ? TextButton(
                                    onPressed: () {},
                                    child: const Text('Re-Print'))
                                : const Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 70),
                                        child: LinearProgressIndicator(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                          color: mainclr,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Printing ......',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: mainclr,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Spacer(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
