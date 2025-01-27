import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/initalData/inital_data_bloc.dart';
import 'package:restaurant_kot/application/login%20b/login_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/presendation/screen%20customers/customer_list.dart';
import 'package:restaurant_kot/presendation/screen%20home/Drawr.dart';
import 'package:restaurant_kot/presendation/settings/printer/kitchen_listing.dart';
import 'package:restaurant_kot/presendation/settings/stock_mng.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: appbarbg,
        title: const Text(
          'Settings',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Profile Section
          BlocBuilder<InitalDataBloc, InitalDataState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        AssetImage('assets/img/profile/profile.jpg'),
                    backgroundColor: mainclr,
                  ),
                  const SizedBox(height: 20),
                  state.isloading
                      ? const SizedBox()
                      : Column(
                          children: [
                            Text(
                              state.settingsData?.cmpname ?? '---',
                              style: const TextStyle(
                                fontSize: 18,
                                color: mainclr,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              state.settingsData?.companyContactNo ?? '---',
                              style: const TextStyle(
                                fontSize: 16,
                                color: mainclr,
                              ),
                            ),
                          ],
                        ),
                ],
              );
            },
          ),
          const SizedBox(height: 40),

          // Management Section
          _buildSettingsSection(
            title: "Manage",
            settings: [
              _buildListTile(
                icon: Icons.stacked_bar_chart,
                title: "Stock Management",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MngStockPage()),
                  );
                },
              ),
              _divider(),
              _buildListTile(
                icon: Icons.supervised_user_circle_outlined,
                title: "Customer Management",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CustomerView()),
                  );
                },
              ),
              _divider(),
              _buildListTile(
                icon: Icons.print_rounded,
                title: "Printer Management",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KitchensPage()),
                  );
                },
              ),
              _divider(),
              _buildListTile(
                icon: Icons.edit_document,
                title: "Bill Design",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KitchensPage()),
                  );
                },
              ),
            ],
          ),

          const SizedBox(height: 20),

          // General Settings
          _buildSettingsSection(
            title: "General",
            settings: [
              _buildDisabledTile(
                icon: Icons.language,
                title: "Language",
                subtitle: "English",
              ),
              _divider(),
              _buildDisabledTile(
                icon: Icons.dark_mode,
                title: "Theme",
                trailing: Switch(
                  value: false,
                  onChanged: null,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Account Settings
          _buildSettingsSection(
            title: "Account Settings",
            settings: [
              _buildDisabledTile(
                icon: Icons.lock,
                title: "Change Password",
              ),
              _divider(),
              _buildDisabledTile(
                icon: Icons.subscriptions,
                title: "Manage Subscriptions",
              ),
            ],
          ),

          const SizedBox(height: 20),

          // App Settings
          _buildSettingsSection(
            title: "App Settings",
            settings: [
              _buildDisabledTile(
                icon: Icons.notifications,
                title: "Notification Preferences",
              ),
              _divider(),
              _buildDisabledTile(
                icon: Icons.info,
                title: "App Version",
                subtitle: "1.0.0",
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Support Section
          _buildSettingsSection(
            title: "Support",
            settings: [
              _buildDisabledTile(
                icon: Icons.help,
                title: "FAQ",
              ),
            ],
          ),

          const SizedBox(height: 40),

          // Footer
          Container(
            width: double.infinity,
            color: mainclr,
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: const Column(
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
          ),
        ],
      ),
    );
  }

  // Settings Section Builder
  Widget _buildSettingsSection({
    required String title,
    required List<Widget> settings,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: mainclr,
          ),
        ),
        const SizedBox(height: 10),
        Column(children: settings),
      ],
    );
  }

  // Custom ListTile Builder
  Widget _buildListTile({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: mainclr),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: trailing,
      onTap: onTap,
    );
  }

  // Disabled ListTile Builder
  Widget _buildDisabledTile({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(title, style: const TextStyle(color: Colors.grey)),
      subtitle: subtitle != null
          ? Text(subtitle, style: const TextStyle(color: Colors.grey))
          : null,
      // trailing: trailing ?? const Icon(Icons.lock, color: Colors.grey),
      // onTap: () {
      //   // // Show Coming Soon Tooltip
      //   // ScaffoldMessenger.of(context).showSnackBar(
      //   //   const SnackBar(
      //   //     content: Text('Coming Soon'),
      //   //     duration: Duration(seconds: 2),
      //   //   ),
      //   // );
      // },
    );
  }

  // Divider
  Widget _divider() {
    return const Divider(
      color: Colors.grey,
      height: 1,
      thickness: 0.5,
    );
  }
}
