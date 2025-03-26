import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/server%20conn/server_conn_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';
import 'package:restaurant_kot/presendation/widgets/loading_bar.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class ServerConnectionPage extends StatefulWidget {
  const ServerConnectionPage({Key? key}) : super(key: key);

  @override
  _ServerConnectionPageState createState() => _ServerConnectionPageState();
}

class _ServerConnectionPageState extends State<ServerConnectionPage> {
  final _serverFormKey = GlobalKey<FormState>();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

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
    _portController = TextEditingController();
  }

  @override
  void dispose() {
    _ipController.dispose();
    _databaseController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _portController.dispose();
    controller?.dispose();
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
        password: _passwordController.text.trim(),
      ));
    }
  }

  void _onQRCodeScanned(String qrData) {
    try {
      log(qrData);

      // Parse the JSON data
      final Map<String, dynamic> data = json.decode(qrData);

      // Validate expected keys
      if (data.containsKey("ip") &&
          data.containsKey("port") &&
          data.containsKey("database") &&
          data.containsKey("username") &&
          data.containsKey("password")) {
        setState(() {
          _ipController.text = data["ip"];
          _portController.text = data["port"];
          _databaseController.text = data["database"];
          _usernameController.text = data["username"];
          _passwordController.text = data["password"];
        });

        _submitServerForm(); // Submit the form automatically
      } else {
        showCustomSnackbar(
          context,
          'Invalid QR Code',
          true,
        );
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('Invalid QR Code format')),
        // );
      }
    } catch (e) {
      log("QR Code Parsing Error: $e"); // Log error
      showCustomSnackbar(
        context,
        'Invalid QR Code',
        true,
      );
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Error processing QR Code')),
      // );
    }
  }

  void _openQRScanner() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Scaffold(
                backgroundColor: Colors.black,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  title: Text('Scan QR Code',
                      style: TextStyle(color: Colors.white)),
                  centerTitle: true,
                ),
                body: Stack(
                  children: [
                    QRView(
                      key: qrKey,
                      overlay: QrScannerOverlayShape(
                        borderColor: Colors.blueAccent,
                        borderRadius: 10,
                        borderLength: 30,
                        borderWidth: 10,
                        cutOutSize: MediaQuery.of(context).size.width * 0.7,
                      ),
                      onQRViewCreated: (QRViewController controller) {
                        this.controller = controller;
                        controller.scannedDataStream.listen((scanData) {
                          _onQRCodeScanned(scanData.code!);
                          controller
                              .stopCamera(); // Stop scanning after getting the data
                          Navigator.pop(context);
                        });
                      },
                    ),
                    Positioned(
                      bottom: 50,
                      left: 0,
                      right: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Align the QR code within the frame",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(height: 15),
                          ElevatedButton.icon(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(Icons.close, color: Colors.white),
                            label: Text("Cancel"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainclrbg,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: appbarbg,
        title: const Center(
          child: Text(
            'Server Connection',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        actions: const [SizedBox(width: 60)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: _serverFormKey,
                child: ListView(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: boxbgwhite,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 15,
                            spreadRadius: 5,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                      child: Column(
                        children: [
                          _buildTextField(
                              controller: _ipController,
                              labelText: 'IP Address'),
                          SizedBox(height: 10),
                          _buildTextField(
                              controller: _databaseController,
                              labelText: 'Database Name'),
                          SizedBox(height: 10),
                          _buildTextField(
                              controller: _usernameController,
                              labelText: 'Username'),
                          SizedBox(height: 10),
                          _buildTextField(
                              controller: _passwordController,
                              labelText: 'Password',
                              obscureText: true),
                          SizedBox(height: 10),
                          _buildTextField(
                              controller: _portController,
                              labelText: 'Port Number',
                              keyboardType: TextInputType.number),
                          SizedBox(height: 20),
                          BlocConsumer<ServerConnBloc, ServerConnState>(
                            listener: (context, state) {
                              if (state.conn) {
                                Navigator.pop(context);
                                Navigator.pop(context);

                                showCustomSnackbar(
                                    context,
                                    'Appication connected successfully!',
                                    false);
                              }
                              if (state.connErrorMsg != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(state.connErrorMsg!)),
                                );
                              }
                            },
                            builder: (context, state) {
                              if (state.isLoading) {
                                return Loading();
                              }
                              return MainButton(
                                  onpress: _submitServerForm, label: 'Confirm');
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('or'),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: _openQRScanner,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: mainclr,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(15),
                            child: const Icon(
                              Icons.qr_code_scanner,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        const Text(
                          'Scan & Connect Application',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    )

                    // ElevatedButton.icon(
                    //   onPressed: _openQRScanner,
                    //   icon: Icon(Icons.qr_code_scanner,
                    //       color: Colors.white, size: 28),
                    //   label: Text(
                    //     'Scan & Connect',
                    //     style: TextStyle(
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.white),
                    //   ),
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: mainclr,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(12),
                    //     ),
                    //     padding:
                    //         EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildTextField({
  required TextEditingController controller,
  required String labelText,
  bool obscureText = false,
  TextInputType keyboardType = TextInputType.text,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(labelText: labelText),
    obscureText: obscureText,
    keyboardType: keyboardType,
  );
}

void showCustomSnackbar(BuildContext context, String message, bool isError) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(
            isError ? Icons.error_outline : Icons.check_circle_outline,
            color: Colors.white,
          ),
          SizedBox(width: 10), // Spacing between icon and text
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: isError
          ? Colors.redAccent
          : Colors.green, // Error = red, Success = green
      behavior: SnackBarBehavior.floating, // Floating style
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      elevation: 6, // Adds shadow effect
      duration: Duration(seconds: 3), // Auto-dismiss after 3 seconds
    ),
  );
}
