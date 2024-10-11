import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';

class TableViewForTableChange extends StatelessWidget {
   TableViewForTableChange({super.key});
  final List<String> options = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          MediaQuery.of(context).size.height * 0.8, // Max height 90% of screen
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
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
           ExpansionTile(
                  collapsedBackgroundColor: boxbgwhite,
                  backgroundColor: boxbgwhite,
                  leading: Icon(
                    Icons.line_weight_sharp,
                    color: mainclr,
                  ),
                  title: const Text('Choose Floor'),
                  children: options.map((option) {
                    return Container(
                      decoration: BoxDecoration(color: Colors.white),
                      child: ListTile(
                        title: Text(option),
                        onTap: () {},
                      ),
                    );
                  }).toList(),
                ),
                          const SizedBox(height: 16),

          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 1,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Return the selected category and close bottom sheet
                    // Navigator.pop();
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(color: index == 1 ? mainclr : boxbgwhite),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Center(
                          child: Text(
                        'TB001',
                        style: TextStyle(
                            color: index == 1
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
          MainButton(label: 'Confirm', onpress: (){})
        ],
      ),
    );
  }
}
