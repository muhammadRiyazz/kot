import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';

class AppDrawer extends StatelessWidget {
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
                  'assets/profile.jpg'), // Replace with your asset or network image
              backgroundColor: Colors.white,
            ),
            decoration: BoxDecoration(
              color: mainclr, // Background color of the header
            ),
          ),
          // Navigation Options
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Option 1'),
            onTap: () {
              // Handle navigation to Settings
              Navigator.pop(context);
              // Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Option 2'),
            onTap: () {
              // Handle navigation to Settings
              Navigator.pop(context);
              // Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Option 3'),
            onTap: () {
              // Handle navigation to Settings
              Navigator.pop(context);
              // Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Option 4'),
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
                      onPressed: () {},
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
