import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/initalData/inital_data_bloc.dart';
import 'package:restaurant_kot/application/login%20b/login_bloc.dart';
import 'package:restaurant_kot/application/printer%20setup/printer_setup_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/domain/resto%20info/hotel_info.dart';
import 'package:restaurant_kot/infrastructure/initalfetchdata/stock_mng.dart';
import 'package:restaurant_kot/presendation/screen%20customers/customer_list.dart';
import 'package:restaurant_kot/presendation/screen%20login/login.dart';
import 'package:restaurant_kot/presendation/settings/printer/kitchen_listing.dart';
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
    String userid = context.read<LoginBloc>().state.userId ?? '--';
    Settings info = context.read<InitalDataBloc>().state.settingsData!;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, // Remove any default padding
        children: <Widget>[
          // Drawer Header with User Profile
          // const UserAccountsDrawerHeader(
          //   accountName: Text('John Doe'), // Replace with dynamic data
          //   accountEmail:
          //       Text('john.doe@example.com'), // Replace with dynamic data
          //   currentAccountPicture: CircleAvatar(
          //     backgroundImage: AssetImage(
          //         'assets/img/profile/profile.jpg'), // Replace with your asset or network image
          //     backgroundColor: Colors.white,
          //   ),
          //   decoration: BoxDecoration(
          //     color: mainclr, // Background color of the header
          //   ),
          // ),

          Container(
            color: mainclr, // Background color of the header

            child: Padding(
              padding:
                  EdgeInsets.only(bottom: 20, top: 60, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(
                        'assets/img/profile/profile.jpg'), // Replace with your asset or network image
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    info.cmpname,
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    info.companyContactNo,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        ' User',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '$userid ',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                  // Replace with dynamic data
                ],
              ),
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
            height: 13,
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
            leading: const Icon(Icons.print_rounded),
            title: const Text('Printer Mangament'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const KitchensPage();
                },
              ));
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
 
              // Handle navigation to Settings
              // Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));