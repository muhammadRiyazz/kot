import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/initalData/inital_data_bloc.dart';
import 'package:restaurant_kot/application/login%20b/login_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/presendation/screen%20customers/customer_list.dart';
import 'package:restaurant_kot/presendation/screen%20login/login.dart';
import 'package:restaurant_kot/presendation/settings/printer/kitchen_listing.dart';
import 'package:restaurant_kot/presendation/settings/stock_mng.dart';
import 'package:shimmer/shimmer.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Header Section
          BlocBuilder<InitalDataBloc, InitalDataState>(
            builder: (context, state) {
              return Container(
                color: mainclr,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    const CircleAvatar(
                      radius: 35,
                      backgroundImage:
                          AssetImage('assets/img/profile/profile.jpg'),
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(height: 15),
                    state.isloading
                        ? SizedBox()
                        : Column(
                            children: [
                              Text(
                                state.settingsData?.cmpname ?? '---',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                state.settingsData?.companyContactNo ?? '---',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                    state.isloading
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            child: LinearProgressIndicator(
                              color: mainclr,
                              minHeight: 1,
                            ),
                          )
                        : Divider(color: Colors.white60, thickness: 1),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'User ID:',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          Text(
                            context.read<LoginBloc>().state.userId ?? '--',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          // Navigation List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                  child: Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.stacked_bar_chart, color: mainclr),
                  title: const Text('Stock Management'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MngStockPage()),
                    );
                  },
                ),
                _divider(),
                ListTile(
                  leading: const Icon(Icons.supervised_user_circle_outlined,
                      color: mainclr),
                  title: const Text('Customer Management'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CustomerView()),
                    );
                  },
                ),
                _divider(),
                ListTile(
                  leading: const Icon(Icons.print_rounded, color: mainclr),
                  title: const Text('Printer Management'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => KitchensPage()),
                    );
                  },
                ),
                _divider(),
                SizedBox(
                  height: 30,
                ),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    _showLogoutDialog(context);
                  },
                ),
              ],
            ),
          ),

          // Footer Section
          Container(
            width: double.infinity,
            color: mainclr,
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: const Column(
              children: [
                Column(
                  children: [
                    Text(
                      'Powered by Eye2EyeTech',
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Divider Widget for Consistency
  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Divider(
        height: 5,
        color: Colors.grey,
      ),
    );
  }

  // Logout Confirmation Dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('Logout'),
            onPressed: () {
              context.read<LoginBloc>().add(const LoginEvent.logout());
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => ScreenLogin()),
              );
            },
          ),
        ],
      ),
    );
  }
}
