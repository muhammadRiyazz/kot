import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/tables/tables_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/presendation/screen%20home/screen_home.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';

// ignore: must_be_immutable
class TableViewForTableChange extends StatelessWidget {
  TableViewForTableChange({
    required this.table,
    required this.orderNo,
    super.key,
  });

  final String table;
  final String orderNo;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocConsumer<TablesBloc, TablesState>(
        listener: (context, state) {
          if (state.changed) {
            const snackBar = SnackBar(
              content: Row(
                children: [
                  Icon(Icons.domain_verification,
                      color: Colors.white, size: 24),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Table Updated",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              backgroundColor: mainclr,
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.all(16),
              duration: Duration(seconds: 3),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => const HomeScreen(
                        from: 1,
                      )),
              (route) =>
                  false, // This removes all previous routes from the stack
            );
          }
        },
        builder: (context, state) {
          return Container(
            height: MediaQuery.of(context).size.height *
                0.8, // Max height 90% of screen
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
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
                  'Change Table',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                // GridView of Categories
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 206, 206, 206)
                                  .withOpacity(0.3), // Shadow color
                              spreadRadius: 1, // How much the shadow spreads
                              blurRadius: 7, // Softness of the shadow
                              offset: const Offset(
                                  0, 4), // Position of the shadow (x, y)
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: DropdownButton<String>(
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: mainclr,
                            size: 30,
                          ),
                          // Set the dropdown button's value to the selected floor
                          value: state.selectedFloor,
                          hint: const Text(
                            'Choose Floor',
                            style: TextStyle(
                              color: mainclr,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          items: state.floors.map((String floor) {
                            return DropdownMenuItem<String>(
                              value: floor,
                              child: Text(
                                floor,
                                style: const TextStyle(
                                  color: mainclr,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              log('Selected floor: $newValue');
                              context
                                  .read<TablesBloc>()
                                  .add(ChooseFloor(floor: newValue));
                            }
                          },
                          // Customize the dropdown appearance
                          underline: const SizedBox(), // Remove the underline
                          isExpanded:
                              true, // Make the dropdown expand to fill the width
                          style: const TextStyle(color: mainclr),
                        ),
                      )),
                ),
                const SizedBox(height: 16),

                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 1,
                    ),
                    itemCount: state.tables.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<TablesBloc>(context).add(
                              TablesEvent.select(
                                  tablename: state.tables[index].tableName));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: state.selectedtable != null &&
                                      state.selectedtable ==
                                          state.tables[index].tableName
                                  ? Border.all(width: 2, color: mainclr)
                                  : null,
                              color: table == state.tables[index].tableName
                                  ? mainclr
                                  : boxbgwhite),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Center(
                                child: Text(
                              state.tables[index].tableName,
                              style: TextStyle(
                                  color: table == state.tables[index].tableName
                                      ? const Color.fromARGB(255, 255, 255, 255)
                                      : mainclr,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                state.isLoading
                    ? const LinearProgressIndicator()
                    : MainButton(
                        label: 'Confirm',
                        onpress: () {
                          BlocProvider.of<TablesBloc>(context).add(
                              TablesEvent.change(
                                  tablename: state.selectedtable!,
                                  orderNo: orderNo));
                        })
              ],
            ),
          );
        },
      );
    });
  }
}
