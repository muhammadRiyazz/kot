import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_kot/application/demo/demo_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/presendation/screen%20splash/screen_splash.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';

class DemoRegisterPage extends StatefulWidget {
  final String type; // Accept type as a parameter

  const DemoRegisterPage({Key? key, required this.type}) : super(key: key);

  @override
  _DemoRegisterPageState createState() => _DemoRegisterPageState();
}

class _DemoRegisterPageState extends State<DemoRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _businessNameController = TextEditingController();
  final _businessAddressController = TextEditingController();
  final _mobileController = TextEditingController();
  
  String? _selectedState;
  late String _type; // Store type value
  List<String> _states = [];
  bool _isLoading = true; // To show full-page loading

  @override
  void initState() {
    super.initState();
    _type = widget.type; // Assign widget type to local variable
    _loadStates();
  }

  Future<void> _loadStates() async {
    try {
      List<String> states = await fetchStates();
      setState(() {
        _states = states;
        _isLoading = false; // Stop loading once data is ready
      });
    } catch (e) {
      log('Error fetching states: $e');
      setState(() {
        _isLoading = false; // Stop loading even on failure
      });
    }
  }

  Future<List<String>> fetchStates() async {
    final response =
        await http.get(Uri.parse('https://ballast.in/restaurant/state.txt'));

    if (response.statusCode == 200) {
      return response.body.split('\n').map((state) => state.trim()).toList();
    } else {
      throw Exception('Failed to load states');
    }
  }

  @override
  void dispose() {
    _businessNameController.dispose();
    _businessAddressController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: mainclr,
        title: const Text(
          'Demo Register',
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          /// **Main Content**
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _businessNameController,
                      decoration: InputDecoration(
                        labelText: 'Business Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your business name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _businessAddressController,
                      decoration: InputDecoration(
                        labelText: 'Business Address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your business address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    /// **State Dropdown**
                    DropdownButtonFormField<String>(
                      value: _selectedState,
                      decoration: InputDecoration(
                        labelText: 'State',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      items: _states.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedState = newValue;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select your state';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _mobileController,
                      decoration: InputDecoration(
                        labelText: 'Phone No',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your mobile number';
                        }
                        if (value.length != 10) {
                          return 'Mobile number must be 10 digits';
                        }
                        return null;
                      },
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
                    }                      },
                      builder: (context, state) {
                        return state.isLoading
                            ? const LinearProgressIndicator(
                                color: mainclr,
                              )
                            : MainButton(
                                label: 'SUBMIT to Demo',
                                onpress: () {
                                  if (_formKey.currentState!.validate()) {
                                    BlocProvider.of<DemoBloc>(context).add(
                                      DemoEvent.demodatabase(exist: false,
                                        type: _type, // Fixed reference
                                        address: _businessAddressController.text,
                                        name: _businessNameController.text,
                                        phoneNo: _mobileController.text,
                                        state: _selectedState ?? '', // Ensure it's not null
                                      ),
                                    );
                                  }
                                });
                      },
                    )
                  ],
                ),
              ),
            ),
          ),

          /// **Full-Screen Loader**
          if (_isLoading)
            Container(
              color: Colors.white.withOpacity(0.8),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
