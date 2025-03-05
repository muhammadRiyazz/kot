import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/demo/demo_bloc.dart';
import 'package:restaurant_kot/domain/cus/customer_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:restaurant_kot/application/customerpart/customerpart_bloc.dart';
import 'package:restaurant_kot/application/finished%20order/finishad_order_bloc.dart';
import 'package:restaurant_kot/application/initalData/inital_data_bloc.dart';
import 'package:restaurant_kot/application/login%20b/login_bloc.dart';
import 'package:restaurant_kot/application/orders/orders_bloc.dart';
import 'package:restaurant_kot/application/printer%20setup/printer_setup_bloc.dart';
import 'package:restaurant_kot/application/stock/stock_bloc.dart';
import 'package:restaurant_kot/application/tables/tables_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/infrastructure/initalfetchdata/bill_design_mng.dart';
import 'package:restaurant_kot/infrastructure/initalfetchdata/stock_mng.dart';
import 'package:restaurant_kot/presendation/screen%20home/screen_home.dart';
import 'package:restaurant_kot/presendation/screen%20login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {

    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('login') ?? false;
                demoStatus = prefs.getBool('demostatus')??false;

    if (isLoggedIn) {
      _fetchInitialData();
      await Future.delayed(const Duration(seconds: 8));
      _navigateToHome();
    } else {
      _navigateToLogin();
    }

    if (demoStatus!) {

          BlocProvider.of<DemoBloc>(context).add(const FetchDemo());

    }
  }

  void _fetchInitialData() {
    final context = this.context;

    BlocProvider.of<StockBloc>(context).add(const StockEvent.fetchAllItems());
    BlocProvider.of<LoginBloc>(context).add(const FetchLogin());
    BlocProvider.of<InitalDataBloc>(context)
        .add(const InitalDataEvent.fetchAppEnty());
    BlocProvider.of<InitalDataBloc>(context).add(const FetchPaymentType());
    BlocProvider.of<InitalDataBloc>(context)
        .add(const InitalDataEvent.addinitaldatas());
    BlocProvider.of<PrinterSetupBloc>(context)
        .add(const PrinterSetupEvent.fetchKitchens());
    BlocProvider.of<PrinterSetupBloc>(context)
        .add(const PrinterSetupEvent.fetchPrinter());
    BlocProvider.of<CustomerpartBloc>(context)
        .add(const CustomerpartEvent.cfetchlist());
    BlocProvider.of<StockBloc>(context).add(const StockEvent.categoryFetch());
    BlocProvider.of<TablesBloc>(context).add(const TablesEvent.taledata());
    BlocProvider.of<FinishadOrderBloc>(context)
        .add(const FinishadOrderEvent.fetchBills());
    BlocProvider.of<OrdersBloc>(context).add(const AllOrders());

    StockMng().fetchstockmngGoods();
    StockMng().fetchstockmngService();
    BillDesignMng().fetchbilldesignLogo();
    BillDesignMng().fetchbilldesignName();
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomeScreen(from: 0)),
    );
  }

  void _navigateToLogin() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: screenHeight * 0.2),
            SizedBox(
              width: screenWidth * 0.6,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: Image.asset(
                  'assets/img/logo/splashlogo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.15),
              child: const LinearProgressIndicator(
                backgroundColor: Colors.black12,
                color: mainclr,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Text(
              'Restaurant KOT Manager',
              style: TextStyle(
                color: mainclr,
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.005),
            Text(
              'Powered by Eye2EyeTech',
              style: TextStyle(
                color: mainclr,
                fontSize: screenWidth * 0.03,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
