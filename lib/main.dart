import 'dart:async';
import 'dart:developer';
// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_kot/application/providers/providers.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'presendation/screen splash/screen_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];

  // final Connectivity connectivity = Connectivity();
  // late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  @override
  void initState() {
    super.initState();
    // initConnectivity();
  //   _connectivitySubscription =
  //       connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
   }

  @override
  void dispose() {
    // _connectivitySubscription.cancel();
    super.dispose();
  }

  // // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> initConnectivity() async {
  //   late List<ConnectivityResult> result;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     result = await connectivity.checkConnectivity();
  //     log('connection check');
  //   } on PlatformException catch (e) {
  //     log('Couldn\'t check connectivity status', error: e);
  //     return;
  //   }

  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) {
  //     return Future.value(null);
  //   }

  //   return _updateConnectionStatus(result);
  // }

  void _showSnackbar(String message) {
    log('snackbar');
    _scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        elevation: 60,
        closeIconColor: mainclr,
        dismissDirection: DismissDirection.horizontal,
        showCloseIcon: true,
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        content: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              const Icon(Icons.network_check_rounded, color: mainclr, size: 35),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'No Internet',
                    style: TextStyle(
                      color: mainclr,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                      height: 2), // Add some space between title and message
                  Text(message, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
        ),
        duration:
            const Duration(days: 365), // Make the snackbar last indefinitely
      ),
    );
  }

  void _hideSnackbar() {
    _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
  }

  // Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
  //   log('_updateConnectionStatus');
  //   setState(() {
  //     _connectionStatus = result;
  //   });

  //   if (_connectionStatus.toString() == '[ConnectivityResult.none]') {
  //     log('No internet connection');
  //     _showSnackbar('Check your network connection');
  //   } else {
  //     log('hide connection');

  //     _hideSnackbar();
  //   }
  //   // ignore: avoid_print
  //   log('Connectivity changed: $_connectionStatus');
  // }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690), // Base design size (width, height)
        minTextAdapt: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: blocProviders(),
            child: MaterialApp(
              scaffoldMessengerKey:
                  _scaffoldMessengerKey, // Attach the scaffoldMessengerKey here
              debugShowCheckedModeBanner: false, // Removes the debug banner
              title: 'Kot',
              theme: ThemeData(
                primaryColor:
                    const Color.fromRGBO(17, 55, 127, 1), // Set RGBA color
                fontFamily: 'Montserrat', // Apply Montserrat font globally
              ),
              home: const SplashScreen(), // Start with the splash screen
            ),
          );
        });
  }
}
