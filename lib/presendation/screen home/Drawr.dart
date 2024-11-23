import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/login%20b/login_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/infrastructure/initalfetchdata/stock_mng.dart';
import 'package:restaurant_kot/presendation/screen%20customers/customer_list.dart';
import 'package:restaurant_kot/presendation/screen%20login/login.dart';
import 'package:restaurant_kot/presendation/settings/stock_mng.dart';

import '../../core/printer/network_printer.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, // Remove any default padding
        children: <Widget>[
          // Drawer Header with User Profile
          const UserAccountsDrawerHeader(
            accountName: Text('John Doe'), // Replace with dynamic data
            accountEmail:
                Text('john.doe@example.com'), // Replace with dynamic data
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/img/profile/profile.jpg'), // Replace with your asset or network image
              backgroundColor: Colors.white,
            ),
            decoration: BoxDecoration(
              color: mainclr, // Background color of the header
            ),
          ),
          // Navigation Options
          const SizedBox(
            height: 40,
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              '  Settings',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.stacked_bar_chart),
            title: const Text('Stock Management'),
            onTap: () {
              // Handle navigation to Settings
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return MngStockPage();
                },
              ));
              // Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
          const Padding(
            padding: EdgeInsets.only(right: 55, left: 20),
            child: Divider(
              height: 5,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.supervised_user_circle_outlined),
            title: const Text('Customer Mangament'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return CustomerView();
                },
              ));
            },
          ),
          const Padding(
            padding: EdgeInsets.only(right: 55, left: 20),
            child: Divider(
              height: 5,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Option 4'),
            onTap: () {
              // Handle navigation to Settings
              Navigator.pop(context);
              // Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),

          const SizedBox(
            height: 50,
          ),
          Divider(),
          // A divider between navigation and logout
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Handle logout logic here
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Logout'),
                  content: Text('Are you sure you want to logout?'),
                  actions: [
                    TextButton(
                      child: Text('Cancel'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    TextButton(
                      child: Text('Logout'),
                      onPressed: () {
                        // Dispatch logout event
                        context
                            .read<LoginBloc>()
                            .add(const LoginEvent.logout());
                        // Navigate to Login Screen after logout
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => ScreenLogin()),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
  // final List<int> test = await NetworkPrinter().testTicket();
              // NetworkPrinter().printTicket(test);
              // Handle navigation to Settings
              // Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));