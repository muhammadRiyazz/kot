import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/presendation/screen%20bill%20preview/print_bill_page.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';

class BillPage extends StatefulWidget {
  @override
  _BillPageState createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
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

  // Submit and print bill functionality
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Bill Preview',
          style: TextStyle(fontSize: 18),
        )),
        backgroundColor: appbarbg,
        actions: [
          SizedBox(
            width: 60,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            
            Expanded(
              child: ListView(
                children: [const SizedBox(
              height: 12,
            ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      splashColor: Color.fromARGB(0, 255, 255, 255),
                      tileColor: Color.fromARGB(0, 255, 255, 255),
                      title: Text(
                        'Table No: TB 001',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text('Order No: ORD001', style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                     
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
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
                                      vertical: 8, horizontal: 10),
                                  leading: Container(
                                    height: 70,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color: boxbgclr,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        item['image'],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  title: Padding(
                                    padding: const EdgeInsets.only(bottom: 6),
                                    child: Text(
                                      item['name'],
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  subtitle: Text('Qty: ${item['qty']}'),
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
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 12),
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
                            child: Divider(),
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
                            height: 10,
                          ),
                          if (isPaid)
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(),
                              title: Text('Payment Method'),
                              trailing: DropdownButton<String>(
                                value: selectedPaymentMethod,
                                onChanged: (value) {
                                  setState(() {
                                    selectedPaymentMethod = value!;
                                  });
                                },
                                items: <String>[
                                  'Cash',
                                  'GPay',
                                  'Card'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: Text(isPaid ? 'Paid' : 'Unpaid'),
                            trailing: Switch(
                              trackOutlineWidth: WidgetStatePropertyAll(1),
                              inactiveTrackColor: Colors.white,
                              inactiveThumbColor: mainclr,
                              trackOutlineColor:
                                  WidgetStatePropertyAll(mainclr),
                              activeColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              activeTrackColor: mainclr,
                              value: isPaid,
                              onChanged: (value) {
                                setState(() {
                                  isPaid = value;
                                });
                              },
                            ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Column(
                children: [
                  MainButton(
                      label: 'Submit & Print',
                      onpress: () {
Navigator.push(context, MaterialPageRoute(builder: (context) {
  return BillPrintpage();
},))             ;         }),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}

