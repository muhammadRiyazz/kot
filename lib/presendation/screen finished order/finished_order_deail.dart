import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';

class FinishedOrderDetail extends StatefulWidget {
  @override
  _FinishedOrderDetailState createState() => _FinishedOrderDetailState();
}

class _FinishedOrderDetailState extends State<FinishedOrderDetail> {
  // List of ordered items
  List<Map<String, dynamic>> orderedItems = [
    {
      'image':
          'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
      'name': 'Malabari Chicken Biriyani',
      'qty': 2,
      'price': 200
    },
    {
      'image':
          'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
      'name': 'Chicken tikka',
      'qty': 1,
      'price': 150
    },
    {
      'image':
          'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
      'name': 'Periperi Chicken',
      'qty': 2,
      'price': 200
    },
    {
      'image':
          'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
      'name': 'Biriyani',
      'qty': 1,
      'price': 150
    },
    {
      'image':
          'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
      'name': 'Item 1',
      'qty': 2,
      'price': 200
    },
    {
      'image':
          'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
      'name': 'Mango Juce',
      'qty': 4,
      'price': 150
    },
    {
      'image':
          'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
      'name': 'Item 1',
      'qty': 2,
      'price': 200
    },
    {
      'image':
          'https://t3.ftcdn.net/jpg/04/41/20/18/360_F_441201852_XQqp1wbAQj9udOC3iT7D0ahKgaf71bns.jpg',
      'name': 'Apple Shake',
      'qty': 1,
      'price': 150
    },
    // Add more items as necessary
  ];

  // Variables for payment calculation
  double gst = 18; // Assume 18% GST
  double discount = 50; // Flat discount
  double totalAmount = 0.0;
  double grandTotal = 0.0;
  bool isPaid = false; // Paid/Unpaid state

  // Payment dropdown variables
  String selectedPaymentMethod = 'Cash';
  Map<String, double> paymentBreakdown = {
    'Cash': 0.0,
    'GPay': 0.0,
    'Card': 0.0
  };

  @override
  void initState() {
    super.initState();
    calculateTotal();
  }

  // Calculate total and grand total
  void calculateTotal() {
    totalAmount = orderedItems.fold(
        0, (sum, item) => sum + (item['qty'] * item['price']));
    double gstAmount = totalAmount * gst / 100;
    grandTotal = totalAmount + gstAmount - discount;
  }

  // Update the payment breakdown
  void updatePayment(String method, double amount) {
    setState(() {
      paymentBreakdown[method] = amount;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // borderRadius: BorderRadius.circular(15),
                    ),
                    child: const ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      splashColor: Color.fromARGB(0, 255, 255, 255),
                      tileColor: Color.fromARGB(0, 255, 255, 255),
                      title: Text(
                        'Table No: TB 001',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                      
                      subtitle: Text('Order No: ORD001',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: List.generate(
                          4,
                          (index) {
                            final item = orderedItems[index];

                            return Column(
                              children: [
                                ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 10),

                                  title: Padding(
                                    padding: const EdgeInsets.only(bottom: 6),
                                    child: Text(
                                      '${index + 1}     ${item['name']}',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  // subtitle: Text('        Qty: ${item['qty']}'),
                                  trailing: Text(
                                    ' ₹${item['qty'] * item['price']}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 15),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sub Total',
                                style: TextStyle(fontSize: 17),
                              ),
                              Text(
                                '₹ 2300',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Tax'),
                              Text('₹ 20'),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 2, top: 12),
                            child: Divider(
                              color: Color.fromARGB(255, 223, 223, 223),
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Amount',
                                style: TextStyle(fontSize: 17),
                              ),
                              Text(
                                '₹ 2320',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          // const Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text(
                          //       'Status',
                          //       style: TextStyle(fontSize: 17),
                          //     ),
                          //     Text(
                          //       'Paid',
                          //       style: TextStyle(
                          //           fontSize: 18, fontWeight: FontWeight.w500),
                          //     ),
                          //   ],
                          // ),
                          // const SizedBox(
                          //   height: 12,
                          // ),
                          // const Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text(
                          //       'Pyment Method',
                          //       style: TextStyle(fontSize: 17),
                          //     ),
                          //     Text(
                          //       'Cash',
                          //       style: TextStyle(
                          //           fontSize: 18, fontWeight: FontWeight.w500),
                          //     ),
                          //   ],
                          // ),
                          const SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: [
                              MainButton(
                                  label: 'Print Bill',
                                  onpress: () {
                                    // submitAndPrint();
                                  }),
                                  SizedBox(height: 12,),
                                 ElevatedButton(
                                     style: ElevatedButton.styleFrom(
                                       backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Set the button background color
                                 
                                       minimumSize: Size(double.infinity, 55), // Full-width button
                                       shape: RoundedRectangleBorder(
                                         side: BorderSide(color: mainclr),
                                         borderRadius:
                                             BorderRadius.circular(20), // Border radius of 10
                                       ),
                                     ),
                                     onPressed: () {
                                       // Navigator.push(context, MaterialPageRoute(
                                       //   builder: (context) {
                                       //     return BillPage();
                                       //   },
                                       // ));
                                     },
                                     child: Text(
                                       'Restore Order',
                                       style: TextStyle(fontWeight: FontWeight.bold,color: mainclr),
                                     )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


