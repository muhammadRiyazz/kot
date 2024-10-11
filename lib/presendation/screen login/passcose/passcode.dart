import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/server%20conn/server_conn_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/presendation/screen%20login/server_conn/server_conn.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';

class PasscodePage extends StatelessWidget {
  PasscodePage({super.key});
  TextEditingController passcodeController = TextEditingController();
  final _passcodeFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainclrbg,
      appBar: AppBar(
        backgroundColor: appbarbg,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        child: Form(
          key: _passcodeFormKey,
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: boxbgwhite,
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 225, 225, 225)
                          .withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Enter Passcode',
                        style: TextStyle(
                            color: mainclr,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 20),

                      TextFormField(
                        controller: passcodeController,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid passcode';
                          }
                          if (value.length < 4) {
                            return 'Passcode must be at least 4 digits';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Passcode',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color:
                                    const Color.fromARGB(255, 192, 192, 192)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color:
                                    const Color.fromARGB(255, 192, 192, 192)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color:
                                    const Color.fromARGB(255, 192, 192, 192)),
                          ),
                          prefixIcon: Icon(Icons.password_rounded),
                          prefixIconColor: mainclr, // Set the icon color
                        ),
                      ),

                      SizedBox(height: 20),

                      // Next Button
                      BlocConsumer<ServerConnBloc, ServerConnState>(
                        listener: (context, state) {
                          if (state.passcode) {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return ServerConnectionPage();
                              },
                            ));
                          }

                          if (state.passcodeErrorMsg != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: mainclr,
                                  content: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Sorry!',
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                        Text(
                                          state.passcodeErrorMsg.toString(),
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  )),
                            );
                          }
                        },
                        builder: (context, state) {
                          return state.isLoading
                              ? const LinearProgressIndicator(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: mainclr,
                                )
                              : MainButton(
                                  label: 'Next',
                                  onpress: () {
                                    if (_passcodeFormKey.currentState!
                                        .validate()) {
                                      BlocProvider.of<ServerConnBloc>(context)
                                          .add(Passcode(
                                              passcodepin:
                                                  passcodeController.text));
                                    }
                                  },
                                );
                        },
                      )
                    ],
                  ),
                ),
              )
              // Passcode Text Field
            ],
          ),
        ),
      ),
    );
  }
}
