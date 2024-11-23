import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/customerpart/customerpart_bloc.dart';
import 'package:restaurant_kot/application/initalData/inital_data_bloc.dart';
import 'package:restaurant_kot/application/orders/orders_bloc.dart';
import 'package:restaurant_kot/application/stock/stock_bloc.dart';
import 'package:restaurant_kot/application/tables/tables_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/infrastructure/initalfetchdata/stock_mng.dart';
import 'package:restaurant_kot/presendation/screen%20home/screen_home.dart';
import 'package:restaurant_kot/presendation/screen%20login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus(); // Call the function to check login status
  }

  Future<void> _checkLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn =
        prefs.getBool('login') ?? false; // Default to false if not set

    // Navigate to the appropriate screen after 3 seconds
    Timer(const Duration(seconds: 5), () async{
      if (isLoggedIn) {
                await StockMng().fetchstockmngGoods();
                await StockMng().fetchstockmngService();

        // If the user is logged in, navigate to the home screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
              BlocProvider.of<CustomerpartBloc>(context).add(CustomerpartEvent.cfetchlist());

      } else {
        // If the user is not logged in, navigate to the login screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ScreenLogin()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<InitalDataBloc>(context).add(const InitalDataEvent.fetchinitaldatas());

      BlocProvider.of<StockBloc>(context).add(const StockEvent.categoryFetch());
                BlocProvider.of<TablesBloc>(context).add(const TablesEvent.taledata());

      BlocProvider.of<OrdersBloc>(context).add(const AllOrders());
      // BlocProvider.of<StockBloc>(context).add(const StockEvent.fetchStocksAndCategory());
      // BlocProvider.of<StockBloc>(context).add(const StockEvent.fetchCategory());
    });
    return Scaffold(
      backgroundColor: const Color.fromARGB(
          255, 255, 255, 255), // Splash screen background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * .2),
            Center(
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(right: 80, left: 60),
                  child: Image.asset(
                    'assets/img/logo/splashlogo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: SizedBox(
                child: LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(30),
                  backgroundColor: Colors.black12,
                  color: mainclr,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .03),
            const Text(
              'Restaurant KOT Manager',
              style: TextStyle(
                  color: mainclr, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              'Powered by Eye2EyeTech',
              style: TextStyle(color: mainclr, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
