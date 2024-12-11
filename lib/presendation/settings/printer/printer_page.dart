import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/printer%20setup/printer_setup_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/core/printer/network_printer.dart';
import 'package:restaurant_kot/presendation/printer%20ui/kot_print.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';

class PrinterSetupPage extends StatelessWidget {
  const PrinterSetupPage({super.key, required this.kitchen});
  final String kitchen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '$kitchen - Printer',
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<PrinterSetupBloc>(context).add(
                    PrinterSetupEvent.fetchkitchenPrinter(kitchen: kitchen));
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<PrinterSetupBloc>(context)
              .add(const PrinterSetupEvent.fetchPrinter());
        },
        child: BlocConsumer<PrinterSetupBloc, PrinterSetupState>(
          listener: (context, state) {
            if (state.updated == 1) {

              BlocProvider.of<PrinterSetupBloc>(context)
                  .add(PrinterSetupEvent.fetchkitchenPrinter(kitchen: kitchen));

              BlocProvider.of<PrinterSetupBloc>(context)
                  .add(PrinterSetupEvent.fetchPrinter(kitchen: kitchen));
            }
          },
          builder: (context, state) {
            return state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          state.priterinfo != null
                              ? Column(
                                  children: [
                                    ListTile(
                                      title: const Text(
                                        'Selected Printer',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.black,
                                        ),
                                      ),
                                      subtitle: Text(
                                        state.priterinfo!.computerName,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      trailing: const Icon(
                                        Icons.print_rounded,
                                        color: Colors.black,
                                        size: 35,
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      child: Divider(
                                        height: 1,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Printer IP -',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            state.priterinfo!.printerName,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      'No Printer Found',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        'It seems there’s no printer here. Please add one to get started!',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                          Image.asset('assets/img/printer/printerb.jpg'),
                          const SizedBox(
                            height: 5,
                          ),
                          state.priterinfo == null
                              ? const SizedBox()
                              : Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, right: 12, left: 12),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors
                                            .white, // Set the button background color
                                        minimumSize: const Size(double.infinity,
                                            55), // Full-width button
                                        shape: RoundedRectangleBorder(
                                          side:
                                              const BorderSide(color: mainclr),
                                          borderRadius: BorderRadius.circular(
                                              20), // Border radius of 10
                                        ),
                                      ),
                                      onPressed: () async {
                                        final List<int> test =
                                            await NetworkPrinter().testTicket();

                                        NetworkPrinter().testprintTicket(
                                            test,
                                            state.priterinfo!.printerName,
                                            context);
                                      },
                                      child: const Text(
                                        'Test Print',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: mainclr),
                                      )),
                                ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            child: state.isLoading
                                ? const LinearProgressIndicator()
                                : MainButton(
                                    label: state.priterinfo == null
                                        ? 'Add Printer'
                                        : 'Update Printer',
                                    onpress: () {
                                      _showUpdatePrinterDialog(
                                          context, kitchen);
                                    }),
                          ),
                        ],
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }

  void _showUpdatePrinterDialog(BuildContext context, String kitchen) {
    final TextEditingController ipController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Update Printer',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          content: SingleChildScrollView(
            // Make the dialog scrollable
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Printer IP field with validation
                  TextFormField(
                    controller: ipController,
                    decoration: InputDecoration(
                      labelText: 'Printer IP',
                      hintText: 'Enter Printer IP',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the printer IP';
                      }
                      const ipPattern =
                          r'^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.'
                          r'(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.'
                          r'(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.'
                          r'(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$';
                      final ipRegex = RegExp(ipPattern);
                      if (!ipRegex.hasMatch(value)) {
                        return 'Please enter a valid IP address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),

                  // Fixed Kitchen Name field (not editable but styled)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 240, 240, 240),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          kitchen,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Fixed Printer Name field (not editable but styled)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[200],
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Mob-II01',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                'Cancel',
              ),
            ),
            TextButton(
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  BlocProvider.of<PrinterSetupBloc>(context).add(
                      PrinterSetupEvent.addPrinter(
                          ip: ipController.text.trim(), kitchen: kitchen));

                  // Proceed with the action to update printer
                  Navigator.of(context)
                      .pop(); // Close the dialog after updating
                }
              },
              child: const Text(
                'Add',
                style: TextStyle(color: mainclr, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }
}
