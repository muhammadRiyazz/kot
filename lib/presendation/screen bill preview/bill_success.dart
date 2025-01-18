import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:restaurant_kot/application/BillSubmitPrint/bill_submit_print_bloc.dart';
import 'package:restaurant_kot/application/printer%20setup/printer_setup_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/domain/orders/order_model.dart';
import 'package:restaurant_kot/domain/printer/priter_config.dart';
import 'package:restaurant_kot/presendation/screen%20home/screen_home.dart';

class BillPrintpage extends StatefulWidget {
  final Order order;

  BillPrintpage({Key? key, required this.order}) : super(key: key);

  @override
  State<BillPrintpage> createState() => _BillPrintpageState();
}

class _BillPrintpageState extends State<BillPrintpage> {
  @override
  void initState() {
    super.initState();
    HapticFeedback.lightImpact();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(from: 1),
          ),
          (route) => false,
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child:
                      BlocConsumer<BillSubmitPrintBloc, BillSubmitPrintState>(
                    listener: (context, state) {
                      // Handle state changes if needed
                    },
                    builder: (context, state) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSuccessSection(state),
                          const SizedBox(height: 20),
                          _buildPrinterStatusSection(state),
                        ],
                      );
                    },
                  ),
                ),
              ),
              _buildLargeDoneButton(context), // Large Done Button at Bottom
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessSection(BillSubmitPrintState state) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundColor: mainclr,
          child: Icon(
            Icons.done_rounded,
            size: 73,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Bill Submitted',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        Text(
          'Order No: ${state.orderid ?? ''}',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Text(
          state.invNo,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildPrinterStatusSection(BillSubmitPrintState state) {
    PrinterConfig? printer =
        context.read<PrinterSetupBloc>().state.billPrinterInfo;

    if (state.printerstatus == 1) {
      return const SizedBox();
    } else if (state.printerstatus == 2) {
      return Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Image.asset(
                'assets/img/printer/printerb.jpg',
                fit: BoxFit.contain,
              ),
            ),
          ),
          const Text(
            'Printing was not completed\nPlease check the printer for any issues.',
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: () {
              BlocProvider.of<BillSubmitPrintBloc>(context)
                  .add(BillSubmitPrintEvent.billRePrint(
                mergedOrders: widget.order.mergedOrders,
                mergedTables: widget.order.mergedTables,
                mergedorNot: widget.order.mergedorNot,
                printer: printer!,
              ));
            },
            child: const Text(
              'Re-Print',
              style: TextStyle(fontWeight: FontWeight.bold, color: mainclr),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Divider(),
          ),
        ],
      );
    } else {
      return const Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 70),
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: mainclr,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Printing ......',
            textAlign: TextAlign.center,
            style: TextStyle(color: mainclr, fontSize: 12),
          ),
        ],
      );
    }
  }

  Widget _buildLargeDoneButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: mainclr,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(from: 1),
            ),
            (route) => false,
          );
        },
        child: const Text(
          'Done',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
