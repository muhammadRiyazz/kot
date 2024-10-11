// import 'package:flutter/material.dart';
// import 'package:restaurant_kot/consts/colors.dart';

// class ProfileManagementPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: mainclrbg,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         // title: Text('Waiter Profile'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(vertical: 22),
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(18.0),
//                 boxShadow: [
//                   BoxShadow(
//                        color: const Color.fromARGB(255, 234, 234, 234)
//                         .withOpacity(0.3),
//                     blurRadius: 15,
//                     spreadRadius: 5,
//                     offset: Offset(0, 5),
//                   ),
//                 ],
//               ),
//               child: const Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   // Profile Image
//                   CircleAvatar(
//                     backgroundColor: mainclr,
//                     radius: 60,
//                     child: Icon(
//                       Icons.person_2_outlined,
//                       size: 53,
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(height: 20),

//                   // Profile Name
//                   Text(
//                     'John Doe', // Waiter's name
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   Text(
//                     'John Doe', // Waiter's name
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   // Logout Button
//                 ],
//               ),
//             ),
// SizedBox(height: 16,),
//             Container(  decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(18.0),
//                 boxShadow: [
//                   BoxShadow(
//                     color: const Color.fromARGB(255, 234, 234, 234)
//                         .withOpacity(0.3),
//                     blurRadius: 15,
//                     spreadRadius: 5,
//                     offset: Offset(0, 5),
//                   ),
//                 ],
//               ),
//               child: ListTile(
//                 title: Text('Logout'),leading: Icon(Icons.logout_rounded),trailing:Icon(Icons.arrow_right_sharp) ,
//               ),
//             ),

//             Spacer(),

//             // Footer Text: Powered by Tic Tech, Version 1.0
//             Text(
//               'Powered by -- -- --',
//               style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//             ),
//             SizedBox(height: 5),
//             Text(
//               'Version 1.0',
//               style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Function to show logout confirmation dialog
//   void _showLogoutConfirmation(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Logout'),
//           content: Text('Are you sure you want to log out?'),
//           actions: [
//             TextButton(
//               child: Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: Text('Logout'),
//               onPressed: () {
//                 // Perform logout action and navigate to login screen
//                 Navigator.of(context).pop();
//                 Navigator.of(context).pushReplacementNamed('/login');
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
