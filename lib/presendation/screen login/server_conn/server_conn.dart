// server_connection_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/server%20conn/server_conn_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';

class ServerConnectionPage extends StatefulWidget {
  const ServerConnectionPage({Key? key}) : super(key: key);

  @override
  _ServerConnectionPageState createState() => _ServerConnectionPageState();
}

class _ServerConnectionPageState extends State<ServerConnectionPage> {
  final _serverFormKey = GlobalKey<FormState>();

  // Controllers for text fields
  late final TextEditingController _ipController;
  late final TextEditingController _databaseController;
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _portController;

  @override
  void initState() {
    super.initState();
    _ipController = TextEditingController();
    _databaseController = TextEditingController();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _portController = TextEditingController(text: '1433'); // Default SQL port
  }

  @override
  void dispose() {
    _ipController.dispose();
    _databaseController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _portController.dispose();
    super.dispose();
  }

  void _submitServerForm() {
    if (_serverFormKey.currentState!.validate()) {
      final bloc = BlocProvider.of<ServerConnBloc>(context);
      bloc.add(ServerConnEvent.conn(
        ip: _ipController.text.trim(),
        port: _portController.text.trim(),
        databaseName: _databaseController.text.trim(),
        username: _usernameController.text.trim(),
        password: _passwordController.text,
      ));
    }
  }

  String? _validatePort(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Port Number';
    }
    final port = int.tryParse(value);
    if (port == null || port < 1 || port > 65535) {
      return 'Enter a valid port number (1-65535)';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainclrbg,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Server Connection',
            style: TextStyle(fontSize: 16),
          ),
        ),
        actions: const [SizedBox(width: 60)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Form(
          key: _serverFormKey,
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: boxbgwhite,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                child: Column(
                  children: [
                    // IP Address
                    _buildTextField(
                      controller: _ipController,
                      labelText: 'IP Address',
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter IP Address';
                        }
                        // Basic IP address validation
                        final ipRegex = RegExp(
                            r'^((25[0-5]|(2[0-4]|1\d|[1-9]|)\d)\.?\b){4}$');
                        if (!ipRegex.hasMatch(value.trim())) {
                          return 'Enter a valid IP address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // Database Name
                    _buildTextField(
                      controller: _databaseController,
                      labelText: 'Database Name',
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Database Name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // Username
                    _buildTextField(
                      controller: _usernameController,
                      labelText: 'Username',
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // Password
                    _buildTextField(
                      controller: _passwordController,
                      labelText: 'Password',
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // Port Number
                    _buildTextField(
                      controller: _portController,
                      labelText: 'Port Number',
                      keyboardType: TextInputType.number,
                      validator: _validatePort,
                    ),
                    const SizedBox(height: 20),

                    // Confirm Button with BlocConsumer
                    BlocConsumer<ServerConnBloc, ServerConnState>(
                      listener: (context, state) {
                        if (state.conn) {
                          // Navigate to desired page after successful connection
                          Navigator.pop(context);
                          Navigator.pop(context);

                          // Optionally, show a success message
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text(
                                'Server connected successfully!',
                                style: const TextStyle(fontSize: 15),
                              ),
                              backgroundColor: mainclr,
                            ),
                          );
                        }

                        if (state.connErrorMsg != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: mainclr,
                              content: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      'Sorry!',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      state.connErrorMsg!,
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
                        if (state.isLoading) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: LinearProgressIndicator(
                              minHeight: 5,
                              backgroundColor: Colors.transparent,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(mainclr),
                            ),
                          );
                        }

                        return MainButton(
                          onpress: _submitServerForm,
                          label: 'Confirm',
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build text fields
  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: labelText),
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}
