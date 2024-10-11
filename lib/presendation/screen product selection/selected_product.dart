import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/presendation/screen%20product%20selection/screen_product_selection.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';

class SelectedProductsPage extends StatelessWidget {
  final List<Product> selectedProducts;

  SelectedProductsPage(this.selectedProducts);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainclrbg,
        appBar: AppBar(
          backgroundColor: appbarbg,
          title: const Center(
              child: Text(
            'Selected Items',
            style: TextStyle(fontSize: 18),
          )),
          actions: const [
            // Navigation to selected products page
            SizedBox(
              width: 60,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Items',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: List.generate(
                            selectedProducts.length,
                            (index) {
                              final product = selectedProducts[index];

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Card(margin: EdgeInsets.all(0),
                                                    
                                                    elevation: 2,borderOnForeground: true,shadowColor: const Color.fromARGB(255, 255, 255, 255),
                                  child: Container(padding:const EdgeInsets.only(bottom: 0,right: 2,left: 5 ,),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15)),
                                    child: ListTile(
                                      contentPadding: EdgeInsets.only(
                                          left: 8, top: 8, bottom: 8),
                                      // leading: Container(
                                      //   height: 100,
                                      //   width: 60,
                                      //   decoration: BoxDecoration(
                                      //     color: boxbgclr,
                                      //     borderRadius: BorderRadius.circular(10),
                                      //   ),
                                      //   child: ClipRRect(
                                      //     borderRadius: BorderRadius.circular(10),
                                      //     child: Image.network(
                                      //       product.image,
                                      //       fit: BoxFit.fill,
                                      //     ),
                                      //   ),
                                      // ),
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
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: Colors.white,
                                                    size: 17,
                                                  ),
                                                )),
                                            onPressed: () {
                                              // setState(() {
                                              //   if (product.quantity == 1) {
                                              //     // Remove the product if its quantity is 1
                                              //     selectedProducts.remove(product);
                                              //   }
                                              //   if (product.quantity > 0)
                                              //     product.quantity--;
                                              // });
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
                                              // setState(() {
                                              //   product.quantity++;
                                              //   if (!selectedProducts.contains(product)) {
                                              //     selectedProducts.add(product);
                                              //   } else {
                                              //     // Update the quantity of the existing product
                                              //     selectedProducts
                                              //         .firstWhere((p) => p == product)
                                              //         .quantity = product.quantity;
                                              //   }
                                              // });
                                            },
                                          ),
                                        ],
                                      ),
                                      onLongPress: () {
                                        // showQuantityInput(product);
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: boxbgwhite,
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 225, 225, 225)
                                .withOpacity(0.3),
                            blurRadius: 15,
                            spreadRadius: 5,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'If any note, please add here', // Short title added
                              style: TextStyle(
                                color: mainclr,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              obscureText: true,
                              validator: (value) {
                                // Not required field, so no validation if it's empty
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Note', // Label for the text field
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: const Color.fromARGB(
                                        255, 192, 192, 192),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: const Color.fromARGB(
                                        255, 192, 192, 192),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: const Color.fromARGB(
                                        255, 192, 192, 192),
                                  ),
                                ),
                                prefixIcon: Icon(Icons.note_alt_outlined),
                                prefixIconColor: mainclr, // Set the icon color
                              ),
                            ),
                            SizedBox(height: 10,),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Parcel Order'),
                               Checkbox(
                                                    activeColor: mainclr,
                                                    value: true,
                                                    onChanged: (bool? value) {
                                                    
                                                    },
                                                  )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    )
                  ],
                ),
              ),
              MainButton(label: 'Confirm', onpress: () {}),
              const SizedBox(
                height: 12,
              )
            ],
          ),
        ));
  }
}
