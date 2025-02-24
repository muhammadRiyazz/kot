import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/demo/demo_bloc.dart';
import 'package:restaurant_kot/application/login%20b/login_bloc.dart';
import 'package:restaurant_kot/application/initalData/inital_data_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/infrastructure/initalfetchdata/bill_design_mng.dart';
import 'package:restaurant_kot/presendation/screen%20login/passcose/passcode.dart';
import 'package:restaurant_kot/presendation/screen%20splash/screen_splash.dart';
import 'package:restaurant_kot/presendation/screen%20support/screen_support.dart';
import 'package:restaurant_kot/presendation/widgets/loading_bar.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double padding = (screenWidth < 600)
        ? 20.0
        : (screenWidth < 900)
            ? 40.0
            : (screenWidth < 1200)
                ? 100.0
                : 130.0;

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
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Image.asset(
                    'assets/img/loginpage/login.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
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

                        // Username Field
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

                        // Password Field
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

                        // Login Button
                        BlocConsumer<LoginBloc, LoginState>(
                          listener: (context, state) {
                            if (state.loged) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SplashScreen()),
                                (route) => false,
                              );
                              BlocProvider.of<InitalDataBloc>(context)
                                  .add(const InitalDataEvent.addinitaldatas());
                              BillDesignMng().changebilldesignLogo(value: true);
                              BillDesignMng()
                                  .changesbilldesignName(value: true);
                            }
                            if (state.errorMsg != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.red.shade700,
                                  content: Text(
                                    'Oops! ${state.errorMsg}',
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ),
                              );
                            }
                          },
                          builder: (context, state) {
                            return state.isLoading
                                ? const Loading()
                                : SizedBox(
                                    width: double.infinity,
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
                                        backgroundColor: mainclr,
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

                        // Settings Button
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

                        // Support and Demo Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SupportPage()),
                                );
                              },
                              icon: const Icon(Icons.support_agent_outlined,
                                  size: 20, color: mainclr),
                              label: const Text(
                                'Support',
                                style: TextStyle(fontSize: 16, color: mainclr),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                _showOptionsBottomSheet(context);

                                // Implement demo functionality
                              },
                              child: Text(
                                'Demo',
                                style: TextStyle(fontSize: 16, color: mainclr),
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

void _showOptionsBottomSheet(BuildContext context) {
  String selectedOption = 'Non-Veg Restaurant';

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                const Text(
                  'Select Restaurant Type',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                RadioListTile<String>(
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: const Text('Non-Veg Restaurant',
                      style: TextStyle(fontSize: 16)),
                  value: 'Non-Veg Restaurant',
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() => selectedOption = value!);
                  },
                  activeColor: mainclr,
                ),
                const Divider(),
                RadioListTile<String>(
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: const Text('Veg Restaurant',
                      style: TextStyle(fontSize: 16)),
                  value: 'Veg Restaurant',
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() => selectedOption = value!);
                  },
                  activeColor: mainclr,
                ),
                const SizedBox(height: 20),
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
                    return SizedBox(
                      width: double.infinity,
                      child: state.isLoading
                          ? LinearProgressIndicator(color: mainclr)
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: mainclr,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                BlocProvider.of<DemoBloc>(context).add(
                                  DemoEvent.demodatabase(type: selectedOption),
                                );
                              },
                              child: const Text('Next',
                                  style: TextStyle(color: Colors.white)),
                            ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
