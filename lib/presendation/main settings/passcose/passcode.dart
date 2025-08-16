import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/presendation/main%20settings/offline/offline_db_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:restaurant_kot/application/server%20conn/server_conn_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/presendation/main%20settings/online/server_conn/server_conn.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';
import 'package:restaurant_kot/presendation/widgets/loading_bar.dart';

class PasscodePage extends StatefulWidget {
  const PasscodePage({super.key});

  @override
  State<PasscodePage> createState() => _PasscodePageState();
}

class _PasscodePageState extends State<PasscodePage> {
  final TextEditingController passcodeController = TextEditingController();
  final _passcodeFormKey = GlobalKey<FormState>();

  bool isOffline = false;

  @override
  void initState() {
    super.initState();
    _loadDbMode();
  }

  Future<void> _loadDbMode() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isOffline = prefs.getBool("db_mode_offline") ?? false;
    });
  }

  Future<void> _toggleDbMode(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("db_mode_offline", value);
    setState(() {
      isOffline = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainclrbg,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: appbarbg,
        title:
            const Text("Authentication", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        child: Form(
          key: _passcodeFormKey,
          child: ListView(
            children: [
              // Database Mode Selection Card
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Database Mode",
                      style: TextStyle(
                        color: mainclr,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey.shade200,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => _toggleDbMode(false),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: isOffline
                                      ? Colors.grey.shade200
                                      : mainclr,
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.cloud_outlined,
                                          color: isOffline
                                              ? Colors.black
                                              : Colors.white),
                                      const SizedBox(width: 5),
                                      Text(
                                        "Online",
                                        style: TextStyle(
                                          color: isOffline
                                              ? Colors.black
                                              : Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => _toggleDbMode(true),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: isOffline
                                      ? mainclr
                                      : Colors.grey.shade200,
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.storage_rounded,
                                          color: isOffline
                                              ? Colors.white
                                              : Colors.black),
                                      const SizedBox(width: 5),
                                      Text(
                                        "Offline",
                                        style: TextStyle(
                                          color: isOffline
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Passcode Card
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5,
                      offset: const Offset(0, 5),
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
                      const SizedBox(height: 20),
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
                          ),
                          prefixIcon: const Icon(Icons.password_rounded),
                          prefixIconColor: mainclr,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Next Button
                      BlocConsumer<ServerConnBloc, ServerConnState>(
                        listener: (context, state) {
                          if (state.passcode) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SettingsPage(),
                              ),
                            );
                          }

                          if (state.passcodeErrorMsg != null) {
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
                                      const Text(
                                        'Sorry!',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                        state.passcodeErrorMsg.toString(),
                                        style: const TextStyle(fontSize: 15),
                                      ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
