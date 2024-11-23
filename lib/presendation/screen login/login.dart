import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/initalData/inital_data_bloc.dart';
import 'package:restaurant_kot/application/login%20b/login_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/infrastructure/initalfetchdata/stock_mng.dart';
import 'package:restaurant_kot/presendation/screen%20home/screen_home.dart';
import 'package:restaurant_kot/presendation/screen%20login/passcose/passcode.dart';
import 'package:restaurant_kot/presendation/screen%20splash/screen_splash.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';
import 'package:restaurant_kot/presendation/widgets/loading_bar.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Get screen width
    final screenWidth = MediaQuery.of(context).size.width;

    // Define breakpoints for padding and font size
    double padding;

    if (screenWidth < 600) {
      // Phone
      padding = 10.0;
    } else if (screenWidth >= 600 && screenWidth < 900) {
      // Mini Tablet
      padding = 40.0;
    } else if (screenWidth >= 900 && screenWidth < 1200) {
      // Large Tablet
      padding = 100.0;
    } else {
      // Desktop
      padding = 130.0;
    }

    return Scaffold(
      backgroundColor: mainclrbg,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/img/loginpage/login.jpg',
                fit: BoxFit.contain,
              ),
            ),
            Container(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 00),
                decoration: BoxDecoration(
                    // color: Colors.white,
                    // borderRadius: BorderRadius.circular(18.0),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: const Color.fromARGB(255, 202, 202, 202)
                    //         .withOpacity(0.3),
                    //     blurRadius: 15,
                    //     spreadRadius: 5,
                    //     offset: Offset(0, 5),
                    //   ),
                    // ],
                    ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: 15),
                      // Container(
                      //   height: 35,
                      //   child: Align(
                      //     alignment: Alignment.center,
                      //     child: Image.asset(
                      //       'assets/img/logo/splashlogo.png',
                      //       fit: BoxFit.contain,
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(height: 30),
                      // Username Field
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 192, 192, 192)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 192, 192, 192)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 192, 192, 192)),
                          ),
                          prefixIcon: const Icon(Icons.person),
                          prefixIconColor: mainclr,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      // Password Field
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 192, 192, 192)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 192, 192, 192)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 192, 192, 192)),
                          ),
                          prefixIcon: Icon(Icons.lock),
                          prefixIconColor: mainclr,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      // Login Button
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

                            await StockMng().changestockmngGoods(value: false);
                            await StockMng()
                                .changestockmngService(value: false);
                          }
                          if (state.errorMsg != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: mainclr,
                                content: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Sorry!',
                                          style: TextStyle(fontSize: 18)),
                                      Text(state.errorMsg.toString(),
                                          style: const TextStyle(fontSize: 15)),
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
                              : MainButton(
                                  label: 'Login',
                                  onpress: () {
                                    if (_formKey.currentState!.validate()) {
                                      BlocProvider.of<LoginBloc>(context).add(
                                        LoginEvent.login(
                                          pass: _passwordController.text.trim(),
                                          username:
                                              _usernameController.text.trim(),
                                        ),
                                      );
                                    }
                                  },
                                );
                        },
                      ),
                      const SizedBox(height: 5),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PasscodePage()));
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Settings',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: mainclr)),
                            Icon(Icons.arrow_right_rounded, color: mainclr),
                          ],
                        ),
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: IconButton(
                              onPressed: () {},
                              icon: const Row(
                                children: [
                                  Icon(Icons.support_agent_outlined,
                                      size: 15, color: Colors.blue),
                                  Text(' Support',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.blue)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
