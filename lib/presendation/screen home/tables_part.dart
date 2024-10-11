import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/presendation/screen%20orders%20from%20table/order_list_table.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/screen_product_selection.dart';

class Tablespart extends StatelessWidget {
  Tablespart({super.key});

  final List<String> options = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // CrossAxisCount based on screen width
    int crossAxisCount = screenWidth < 650
        ? 2
        : screenWidth > 650 && screenWidth < 1110
            ? 3
            : 5; // 2 columns for phones, 3 for tablets

    // Define dynamic text size and box size adjustments based on screen size
    double textSize = screenWidth < 650 ? 16 : 18; // Larger text on tablets
    double boxImageSize =
        screenWidth < 650 ? 45 : 60; // Box image size for mobile and tablet
    double boxPadding =
        screenWidth < 650 ? 10 : 20; // Padding based on screen size
    double childAspectRatio = screenWidth < 650
        ? (screenWidth / (screenHeight / 1.9)) // Adjust for mobile
        : (screenWidth / (screenHeight / .6)); // Adjust for tablet
    return RefreshIndicator(
      backgroundColor: mainclr,
      color: mainclrbg,
      onRefresh: () async {
        log('message');
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            // ListView with ExpansionTile
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 206, 206, 206)
                            .withOpacity(0.3), // Shadow color
                        spreadRadius: 1, // How much the shadow spreads
                        blurRadius: 7, // Softness of the shadow
                        offset:
                            const Offset(0, 4), // Position of the shadow (x, y)
                      ),
                    ],
                  ),
                  child: ExpansionTile(
                    collapsedBackgroundColor: boxbgwhite,
                    backgroundColor: boxbgwhite,
                    leading:
                        const Icon(Icons.line_weight_sharp, color: mainclr),
                    title: const Text('Choose Floor'),
                    children: options.map((option) {
                      return Container(
                        decoration: const BoxDecoration(color: Colors.white),
                        child: ListTile(
                          title: Text(option),
                          onTap: () {},
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            // GridView.builder with dynamic columns
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: childAspectRatio,
                crossAxisCount: crossAxisCount, // Dynamic number of columns
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(3),
                  elevation: 8,
                  borderOnForeground: true,
                  shadowColor: const Color.fromARGB(255, 241, 241, 241),
                  child: InkWell(
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ProductChoosingPage();
                          },
                        ));
                      } else {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ScreenOrdersList();
                          },
                        ));
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(boxPadding),
                      decoration: BoxDecoration(
                        color: boxbgwhite,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              'Table 0$index',
                              style: TextStyle(
                                  color: mainclr,
                                  fontWeight: FontWeight.bold,
                                  fontSize: textSize),
                            ),
                          ),
                          const Divider(height: 0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Container(
                                    width: boxImageSize + 8,
                                    height: boxImageSize,
                                    decoration: BoxDecoration(
                                      color:
                                          index == 0 || index == 1 || index == 2
                                              ? mainclr
                                              : Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: mainclr),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 6),
                                      child: Image.asset(
                                        index == 0 || index == 1 || index == 2
                                            ? 'assets/img/table/tableicon.png'
                                            : 'assets/img/table/emptytable.png',
                                        fit: BoxFit.contain,
                                        color: index == 0 ||
                                                index == 1 ||
                                                index == 2
                                            ? Colors.white
                                            : null,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '5 Orders',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: textSize -
                                            1, // slightly smaller for order info
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '10 : 30 Am',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize:
                                            textSize - 4, // smaller for time
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Amount',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: textSize - 3,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                '₹ 2500',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: textSize - 2,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
