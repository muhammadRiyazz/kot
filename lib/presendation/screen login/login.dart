// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:restaurant_kot/application/initalData/inital_data_bloc.dart';
// import 'package:restaurant_kot/application/login%20b/login_bloc.dart';
// import 'package:restaurant_kot/consts/colors.dart';
// import 'package:restaurant_kot/presendation/screen%20login/passcose/passcode.dart';
// import 'package:restaurant_kot/presendation/screen%20splash/screen_splash.dart';
// import 'package:restaurant_kot/presendation/widgets/loading_bar.dart';

// class ScreenLogin extends StatefulWidget {
//   const ScreenLogin({Key? key}) : super(key: key);

//   @override
//   _ScreenLoginState createState() => _ScreenLoginState();
// }

// class _ScreenLoginState extends State<ScreenLogin> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   bool _isPasswordVisible = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.all(20.0),
//         decoration: const BoxDecoration(color: mainclr),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const CircleAvatar(
//                     radius: 50,
//                     backgroundColor: Colors.white,
//                     child: Icon(Icons.restaurant, size: 40, color: mainclr),
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     "Welcome Back",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   const Text(
//                     "Login to your account",
//                     style: TextStyle(
//                       color: Colors.white70,
//                       fontSize: 16,
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                   TextFormField(
//                     controller: _emailController,
//                     style: const TextStyle(color: Colors.white),
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.person, color: Colors.white),
//                       hintText: 'User Name',
//                       hintStyle: const TextStyle(color: Colors.white70),
//                       filled: true,
//                       fillColor: Colors.white.withOpacity(0.2),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your username';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 15),
//                   TextFormField(
//                     controller: _passwordController,
//                     obscureText: !_isPasswordVisible,
//                     style: const TextStyle(color: Colors.white),
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.lock, color: Colors.white),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _isPasswordVisible
//                               ? Icons.visibility
//                               : Icons.visibility_off,
//                           color: Colors.white70,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _isPasswordVisible = !_isPasswordVisible;
//                           });
//                         },
//                       ),
//                       hintText: 'Password',
//                       hintStyle: const TextStyle(color: Colors.white70),
//                       filled: true,
//                       fillColor: Colors.white.withOpacity(0.2),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your password';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 15),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => PasscodePage()));
//                           },
//                           child: Text(
//                             "Settings",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                         Icon(Icons.arrow_right_rounded, color: Colors.white),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   BlocConsumer<LoginBloc, LoginState>(
//                     listener: (context, state) async {
//                       if (state.loged) {
//                         Navigator.pushAndRemoveUntil(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const SplashScreen()),
//                           (route) => false,
//                         );
//                         BlocProvider.of<InitalDataBloc>(context)
//                             .add(const InitalDataEvent.addinitaldatas());
//                       }
//                       if (state.errorMsg != null) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             behavior: SnackBarBehavior.floating,
//                             backgroundColor: mainclr,
//                             content: Text(state.errorMsg ?? "Error",
//                                 style: const TextStyle(fontSize: 15)),
//                           ),
//                         );
//                       }
//                     },
//                     builder: (context, state) {
//                       return state.isLoading
//                           ? const Loading()
//                           : SizedBox(
//                               width: double.infinity,
//                               height: 50,
//                               child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 100, vertical: 15),
//                                   backgroundColor: Colors.white,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                 ),
//                                 onPressed: () {
//                                   if (_formKey.currentState!.validate()) {
//                                     BlocProvider.of<LoginBloc>(context).add(
//                                       LoginEvent.login(
//                                         pass: _passwordController.text.trim(),
//                                         username: _emailController.text.trim(),
//                                       ),
//                                     );
//                                   }
//                                 },
//                                 child: const Text(
//                                   "Login",
//                                   style: TextStyle(
//                                       color: mainclr,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ));
//                     },
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text(
//                         "Need any help?",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       TextButton(
//                         onPressed: () {},
//                         child: const Text(
//                           "Support",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: const Text(
//                       "Demo",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/demo/demo_bloc.dart';
import 'package:restaurant_kot/application/initalData/inital_data_bloc.dart';
import 'package:restaurant_kot/application/login%20b/login_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';

import 'package:restaurant_kot/presendation/screen%20login/passcose/passcode.dart';
import 'package:restaurant_kot/presendation/screen%20splash/screen_splash.dart';
import 'package:restaurant_kot/presendation/screen%20support/screen_support.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';
import 'package:restaurant_kot/presendation/widgets/loading_bar.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double padding;
    if (screenWidth < 600) {
      padding = 20.0;
    } else if (screenWidth >= 600 && screenWidth < 900) {
      padding = 40.0;
    } else if (screenWidth >= 900 && screenWidth < 1200) {
      padding = 100.0;
    } else {
      padding = 130.0;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Image.asset(
                    'assets/img/loginpage/login.jpg',
                    fit: BoxFit.contain,
                    // height: 250,
                  ),
                ),
                // const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text(
                          'Welcome Back',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: mainclr,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: mainclr),
                            ),
                            prefixIcon: Icon(Icons.person, color: mainclr),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: mainclr),
                            ),
                            prefixIcon: Icon(Icons.lock, color: mainclr),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        BlocConsumer<LoginBloc, LoginState>(
                          listener: (context, state) async {
                            if (state.loged) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SplashScreen()),
                                (route) => false,
                              );
                              BlocProvider.of<InitalDataBloc>(context)
                                  .add(const InitalDataEvent.addinitaldatas());
                              // await BillDesignMng()
                              //     .changebilldesignLogo(value: false);
                              // await BillDesignMng()
                              //     .changesbilldesignName(value: false);
                              // await StockMng()
                              //     .changestockmngGoods(value: false);
                              // await StockMng()
                              //     .changestockmngService(value: false);
                            }
                            if (state.errorMsg != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.red.shade700,
                                  content: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Oops!',
                                            style: TextStyle(fontSize: 18)),
                                        Text(state.errorMsg.toString(),
                                            style:
                                                const TextStyle(fontSize: 15)),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                          builder: (context, state) {
                            return state.isLoading
                                ? const Loading()
                                : Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: mainclr,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          BlocProvider.of<LoginBloc>(context)
                                              .add(
                                            LoginEvent.login(
                                              pass: _passwordController.text
                                                  .trim(),
                                              username: _usernameController.text
                                                  .trim(),
                                            ),
                                          );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: const Text(
                                        'Login',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  );
                          },
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PasscodePage()),
                            );
                          },
                          child: Text(
                            'Settings',
                            style: TextStyle(
                              color: mainclr,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SupportPage()),
                                );
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.support_agent_outlined,
                                      size: 20, color: mainclr),
                                  SizedBox(width: 5),
                                  Text(
                                    'Support',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: mainclr,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                _showOptionsBottomSheet(context);
                              },
                              child: Text(
                                'Demo',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: mainclr,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class ScreenLogin extends StatefulWidget {
//   const ScreenLogin({Key? key}) : super(key: key);

//   @override
//   _ScreenLoginState createState() => _ScreenLoginState();
// }

// class _ScreenLoginState extends State<ScreenLogin> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _isPasswordVisible = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.all(20.0),
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [mainclr, mainclr],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const CircleAvatar(
//                   radius: 50,
//                   backgroundColor: Colors.white,
//                   child: Icon(Icons.restaurant, size: 40, color: mainclr),
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   "Welcome Back",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 const Text(
//                   "Login to your account",
//                   style: TextStyle(
//                     color: Colors.white70,
//                     fontSize: 16,
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 TextField(
//                   controller: _emailController,
//                   style: const TextStyle(color: Colors.white),
//                   decoration: InputDecoration(
//                     prefixIcon: const Icon(Icons.person, color: Colors.white),
//                     hintText: 'User Name',
//                     hintStyle: const TextStyle(color: Colors.white70),
//                     filled: true,
//                     fillColor: Colors.white.withOpacity(0.2),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 TextField(
//                   controller: _passwordController,
//                   obscureText: !_isPasswordVisible,
//                   style: const TextStyle(color: Colors.white),
//                   decoration: InputDecoration(
//                     prefixIcon: const Icon(Icons.lock, color: Colors.white),
//                     hintText: 'Password',
//                     hintStyle: const TextStyle(color: Colors.white70),
//                     filled: true,
//                     fillColor: Colors.white.withOpacity(0.2),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide.none,
//                     ),
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _isPasswordVisible
//                             ? Icons.visibility
//                             : Icons.visibility_off,
//                         color: Colors.white,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _isPasswordVisible = !_isPasswordVisible;
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       TextButton(
//                         onPressed: () {},
//                         child: Text(
//                           "Settings",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                       Icon(Icons.arrow_right_rounded, color: Colors.white),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     child: const Text(
//                       "LOGIN",
//                       style: TextStyle(
//                         color: mainclr,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Need any help?",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     TextButton(
//                       onPressed: () {},
//                       child: const Text(
//                         "Support",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

void _showOptionsBottomSheet(BuildContext context) {
  String selectedOption = 'Non-Veg Restaurant'; // Default selected option

  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Makes the bottom sheet take more space
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 16),

                // Title
                Text(
                  'Select Restaurant Type',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                // Radio Button for Non-Veg Restaurant
                RadioListTile<String>(
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: const Text(
                    'Non-Veg Restaurant',
                    style: TextStyle(fontSize: 16),
                  ),
                  value: 'Non-Veg Restaurant',
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                  activeColor: mainclr, // Custom color for selected radio
                ),
                Divider(),
                // Radio Button for Veg Restaurant
                RadioListTile<String>(
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: Text(
                    'Veg Restaurant',
                    style: TextStyle(fontSize: 16),
                  ),
                  value: 'Veg Restaurant',
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                  activeColor: mainclr, // Custom color for selected radio
                ),

                SizedBox(height: 20),

                // Full-Width Next Button
                BlocConsumer<DemoBloc, DemoState>(
                  listener: (context, state) {
                    if (state.loged) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SplashScreen()),
                        (route) => false,
                      );
                    }
                  },
                  builder: (context, state) {
                    return state.isLoading
                        ? LinearProgressIndicator(
                            color: mainclr,
                          )
                        : MainButton(
                            label: 'Next',
                            onpress: () {
                              BlocProvider.of<DemoBloc>(context).add(
                                  DemoEvent.demodatabase(type: selectedOption));
                            });
                  },
                )
              ],
            ),
          );
        },
      );
    },
  );
}
