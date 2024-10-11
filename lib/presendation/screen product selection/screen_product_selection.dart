import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/category_selection.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/selected_product.dart';

class ProductChoosingPage extends StatefulWidget {
  @override
  _ProductChoosingPageState createState() => _ProductChoosingPageState();
}

class _ProductChoosingPageState extends State<ProductChoosingPage> {
  // Sample product list
  List<Product> products = [
    Product(
        'Malabari Biriyani ',
        100.0,
        'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
        0),
    Product(
        'Priperi Chicken',
        150.0,
        'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
        0),
    Product(
        'Malabar Chicken Mandhi',
        200.0,
        'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
        0),
    Product(
        'Priperi Chicken',
        150.0,
        'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
        0),
    Product(
        'Priperi Chicken',
        150.0,
        'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
        0),
  ];

  // Selected products
  List<Product> selectedProducts = [];

  // Search query
  String searchQuery = '';

  // Selected category
  String? selectedCategory;

  // Method to filter products based on search query
  List<Product> get filteredProducts {
    if (searchQuery.isEmpty) {
      return products;
    } else {
      return products
          .where((product) =>
              product.name.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    }
  }

  void navigateToSelectedProductsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectedProductsPage(selectedProducts),
      ),
    );
  }

  // Method to show category selection bottom sheet
  void showCategoryBottomSheet() async {
    final selectedCategory = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return CategoryBottomSheet();
      },
    );

    if (selectedCategory != null) {
      setState(() {
        this.selectedCategory = selectedCategory;
      });
    }
  }

  // Method to handle long press and input custom quantity
  void showQuantityInput(Product product) {
    TextEditingController quantityController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter Quantity'),
          content: TextField(
            controller: quantityController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Enter quantity"),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                setState(() {
                  product.quantity = int.parse(quantityController.text);
                  if (!selectedProducts.contains(product)) {
                    selectedProducts.add(product);
                  } else {
                    // Update the quantity of the existing product
                    selectedProducts.firstWhere((p) => p == product).quantity =
                        product.quantity;
                  }
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: mainclrbg,
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Goods',
              ), // Use Tab instead of Text for better styling
              Tab(text: 'Service'), // Use Tab instead of Text
            ],
            labelStyle: TextStyle(
              fontFamily: 'Montserrat', // Apply Montserrat font globally

              fontSize: 16, // Font size for the active tab
              fontWeight: FontWeight.bold, // Font weight for the active tab
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: 'Montserrat', // Apply Montserrat font globally

              fontSize: 15, // Font size for inactive tab
              fontWeight: FontWeight.w500, // Font weight for inactive tab
            ),
            labelColor: mainclr, // Color for the active tab text
            unselectedLabelColor:
                Colors.grey, // Color for the inactive tab text
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 4.0, // Thickness of the underline
                color: mainclr, // Color of the underline
              ),
              insets: EdgeInsets.symmetric(
                  horizontal: 30.0), // Controls the width of the underline
            ),
            indicatorSize: TabBarIndicatorSize
                .tab, // Makes the underline span the whole tab
          ),
          backgroundColor: appbarbg,
          
          title: const Center(
              child: Text(
            'Select Items',
            style: TextStyle(fontSize: 18),
          )),
          
          actions: const [
            // Navigation to selected products page
            SizedBox(
              width: 60,
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 206, 206, 206)
                                          .withOpacity(0.3), // Shadow color
                                  spreadRadius:
                                      1, // How much the shadow spreads
                                  blurRadius: 7, // Softness of the shadow
                                  offset: const Offset(
                                      0, 4), // Position of the shadow (x, y)
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: InkWell(
                              onTap: () {
                                showCategoryBottomSheet();
                              },
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'All Category',
                                    style: TextStyle(
                                        color: mainclr,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: mainclr,
                                    size: 30,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 10),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(15),
                      //     ),
                      //     child: const ListTile(
                      //       contentPadding: EdgeInsets.symmetric(
                      //           horizontal: 15, vertical: 3),
                      //       splashColor: Color.fromARGB(0, 255, 255, 255),
                      //       tileColor: Color.fromARGB(0, 255, 255, 255),
                      //       title: Text(
                      //         'Table No: TB 001',
                      //         style: TextStyle(
                      //             fontSize: 16, fontWeight: FontWeight.w600),
                      //       ),
                      //       // subtitle: Text('Order No: ORD001', style: TextStyle(
                      //       //       fontSize: 15, fontWeight: FontWeight.w500)),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        child: Container(
                          decoration: BoxDecoration(
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
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true, // Fills the background
                              fillColor: const Color.fromARGB(255, 255, 255,
                                  255), // Set background color to white
                              hintText: 'Search',
                              labelStyle: const TextStyle(
                                color: mainclr, // Set label color to green
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: mainclr, // Set icon color to green
                              ),
                              // Remove any visible borders and add 15.0 radius
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    15.0), // Rounded corners with radius 15
                                borderSide: BorderSide.none, // No border
                              ),
                              // When the TextField is focused, keep the borderless style
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    15.0), // Rounded corners with radius 15
                                borderSide:
                                    BorderSide.none, // No border on focus
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    15.0), // Rounded corners with radius 15
                                borderSide:
                                    BorderSide.none, // No border when enabled
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                searchQuery = value;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: RefreshIndicator(
                          backgroundColor: mainclr,
                          color: mainclrbg,
                          onRefresh: () async {
                            log('message');
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 7,
                                );
                              },
                              itemCount: filteredProducts.length,
                              itemBuilder: (context, index) {
                                final product = filteredProducts[index];
                                return Card(
                                  margin: EdgeInsets.all(3),
                                  elevation: 2,
                                  borderOnForeground: true,
                                  shadowColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: ListTile(
                                      contentPadding: EdgeInsets.only(
                                          left: 8, top: 8, bottom: 8),
                                      leading: Container(
                                        height: 100,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          color: boxbgclr,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            product.image,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        product.name,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      subtitle: Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Text('₹ ${product.price}/-'),
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
                                                )),
                                            onPressed: () {
                                              setState(() {
                                                if (product.quantity == 1) {
                                                  // Remove the product if its quantity is 1
                                                  selectedProducts
                                                      .remove(product);
                                                }
                                                if (product.quantity > 0) {
                                                  product.quantity--;
                                                }
                                              });
                                            },
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 2),
                                            child: Text(
                                              '${product.quantity}',
                                              style: TextStyle(fontSize: 17),
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
                                                )),
                                            onPressed: () {
                                              setState(() {
                                                product.quantity++;
                                                if (!selectedProducts
                                                    .contains(product)) {
                                                  selectedProducts.add(product);
                                                } else {
                                                  // Update the quantity of the existing product
                                                  selectedProducts
                                                          .firstWhere((p) =>
                                                              p == product)
                                                          .quantity =
                                                      product.quantity;
                                                }
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      onLongPress: () {
                                        showQuantityInput(product);
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(child: Text('data'))
                ],
              ),
            ),
            selectedProducts.isNotEmpty
                ? Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(bottom: 7, right: 10, left: 10),
                      child: Card(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: mainclr,
                          ),
                          child: ListTile(
                            onTap: () {
                              navigateToSelectedProductsPage();
                            },
                            title: Text(
                              '${selectedProducts.length} Items Added',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            trailing: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'View',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.arrow_right,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}

// Product model
class Product {
  String name;
  double price;
  String image;
  int quantity;

  Product(this.name, this.price, this.image, this.quantity);
}

// Selected Products Page


// 