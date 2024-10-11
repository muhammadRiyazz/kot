// import 'package:flutter/material.dart';
// import 'package:restaurant_kot/consts/colors.dart';
// import 'package:restaurant_kot/presendation/widgets/buttons.dart';

// class SettingsPage extends StatefulWidget {
//   @override
//   _SettingsPageState createState() => _SettingsPageState();
// }

// class _SettingsPageState extends State<SettingsPage> {
//   // Controllers for Passcode and Server fields
//   TextEditingController _passcodeController = TextEditingController();
//   TextEditingController _ipController = TextEditingController();
//   TextEditingController _databaseController = TextEditingController();
//   TextEditingController _usernameController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   TextEditingController _portController = TextEditingController();

//   // Form keys for validation
//   final _passcodeFormKey = GlobalKey<FormState>();
//   final _serverFormKey = GlobalKey<FormState>();

//   // Function to validate and submit the server connection form
//   void _submitServerForm() {
//     if (_serverFormKey.currentState!.validate()) {
//       // If the form is valid, save the server connection details
//       Navigator.pop(context);
//             Navigator.pop(context);


//     }
//   }

//   // Function to validate and submit passcode
//   void _submitPasscodeForm() {
//     if (_passcodeFormKey.currentState!.validate()) {
//       Navigator.of(context).push(
//           MaterialPageRoute(builder: (context) => ServerConnectionPage()));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: mainclrbg,
//       appBar: AppBar(
//         backgroundColor: appbarbg,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
//         child: Form(
//           key: _passcodeFormKey,
//           child: ListView(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: boxbgwhite,
//                   boxShadow: [
//                     BoxShadow(
//                       color: const Color.fromARGB(255, 225, 225, 225)
//                           .withOpacity(0.3),
//                       blurRadius: 15,
//                       spreadRadius: 5,
//                       offset: Offset(0, 5),
//                     ),
//                   ],
//                 ),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Enter Passcode',
//                         style: TextStyle(color: mainclr, fontSize: 18,fontWeight: FontWeight.w500),
//                       ),                      SizedBox(height: 20),

//                       TextFormField(
//                         controller: _passwordController,
//                         keyboardType: TextInputType.number,
//                         obscureText: true,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter a valid passcode';
//                           }
//                           if (value.length < 4) {
//                             return 'Passcode must be at least 4 digits';
//                           }
//                           return null;
//                         },
//                         decoration: InputDecoration(
//                           labelText: 'Passcode',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15),
//                             borderSide: BorderSide(
//                                 color:
//                                     const Color.fromARGB(255, 192, 192, 192)),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15),
//                             borderSide: BorderSide(
//                                 color:
//                                     const Color.fromARGB(255, 192, 192, 192)),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15),
//                             borderSide: BorderSide(
//                                 color:
//                                     const Color.fromARGB(255, 192, 192, 192)),
//                           ),
//                           prefixIcon: Icon(Icons.password_rounded),
//                           prefixIconColor: mainclr, // Set the icon color
//                         ),
//                       ),

//                       SizedBox(height: 20),

//                       // Next Button
//                       MainButton(label: 'Next', onpress: _submitPasscodeForm)
//                     ],
//                   ),
//                 ),
//               )
//               // Passcode Text Field
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ServerConnectionPage extends StatefulWidget {
//   @override
//   _ServerConnectionPageState createState() => _ServerConnectionPageState();
// }

// class _ServerConnectionPageState extends State<ServerConnectionPage> {
//   // Controllers for text fields
//   TextEditingController _ipController = TextEditingController();
//   TextEditingController _databaseController = TextEditingController();
//   TextEditingController _usernameController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   TextEditingController _portController = TextEditingController();

//   // Form key for validation
//   final _serverFormKey = GlobalKey<FormState>();

//   // Function to validate and submit the server connection form
//   void _submitServerForm() {
//     if (_serverFormKey.currentState!.validate()) {
//       Navigator.pop(context);
//       Navigator.pop(context);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Server details saved successfully!')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(backgroundColor: mainclrbg,
//       appBar: AppBar(
//         actions: [SizedBox(width: 60,)],
//         title: Center(child: Text('Server Connection',style: TextStyle(fontSize: 16),))),
//       body: Form(
//         key: _serverFormKey,
//         child: ListView(
//           children: [
      
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 18,),
//               child: Container(decoration: BoxDecoration( borderRadius: BorderRadius.circular(12),
//                   color: boxbgwhite,),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 18),
//                   child: Column(children: [ TextFormField(
//                     controller: _ipController,
//                     decoration: InputDecoration(labelText: 'IP Address'),
//                     keyboardType: TextInputType.text,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter IP Address';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 10),
                  
//                   // Database Name
//                   TextFormField(
//                     controller: _databaseController,
//                     decoration: InputDecoration(labelText: 'Database Name'),
//                     keyboardType: TextInputType.text,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter Database Name';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 10),
                  
//                   // Username
//                   TextFormField(
//                     controller: _usernameController,
//                     decoration: InputDecoration(labelText: 'Username'),
//                     keyboardType: TextInputType.text,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter Username';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 10),
                  
//                   // Password
//                   TextFormField(
//                     controller: _passwordController,
//                     decoration: InputDecoration(labelText: 'Password'),
//                     obscureText: true,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter Password';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 10),
                  
//                   // Port Number
//                   TextFormField(
//                     controller: _portController,
//                     decoration: InputDecoration(labelText: 'Port Number'),
//                     keyboardType: TextInputType.number,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter Port Number';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 20),
                  
//                   // Confirm Button
//                   MainButton(
//                     onpress: _submitServerForm,
//                     label: 'Confirm',
//                   ),],),
//                 ),
//               ),
//             )
//             // IP Address
           
//           ],
//         ),
//       ),
//     );
//   }
// }
