import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/printer%20setup/printer_setup_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/infrastructure/initalfetchdata/stock_mng.dart';
import 'package:restaurant_kot/presendation/settings/printer/printer_page.dart';

class KitchensPage extends StatelessWidget {
  const KitchensPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kitchens",
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocBuilder<PrinterSetupBloc, PrinterSetupState>(
          builder: (context, state) {
            return state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: List.generate(
                              state.kitchenlist.length,
                              (index) {
                                return Column(
                                  children: [
                                    ListTile(
                                      onTap: () {
                                        BlocProvider.of<PrinterSetupBloc>(
                                                context)
                                            .add(PrinterSetupEvent
                                                .fetchkitchenPrinter(
                                                    kitchen: state
                                                        .kitchenlist[index]));

                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return PrinterSetupPage(
                                              kitchen: state.kitchenlist[index],
                                            );
                                          },
                                        ));
                                      },
                                      title: Text(
                                        state.kitchenlist[index],
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                      subtitle: Text(
                                        "Manage ${state.kitchenlist[index]} Printer",
                                        style: const TextStyle(
                                            fontSize: 13, color: Colors.grey),
                                      ),
                                    ),
                                    Divider(
                                        height: 12,
                                        color: Colors.grey.shade300),
                                  ],
                                );
                              },
                            ),
                          )),
                      Spacer(),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
