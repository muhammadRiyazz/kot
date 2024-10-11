import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'dart:async';

import 'package:restaurant_kot/presendation/screen%20login/login.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    
    // Navigate to HomeScreen after 3 seconds
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ScreenLogin()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),  // Splash screen background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           
               SizedBox(height: MediaQuery.of(context).size.height * .2,),

          Center(
            child: SizedBox(
              // width: MediaQuery.of(context).size.height * .3,
              child: Padding(
                padding: const EdgeInsets.only(right: 80,left: 60),
                child: Image.asset(
                  'assets/img/logo/splashlogo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),        
        SizedBox(height: MediaQuery.of(context).size.height * .2,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: SizedBox(
              // width: MediaQuery.of(context).size.width * .7,
              child: LinearProgressIndicator(
                borderRadius: BorderRadius.circular(30),
                backgroundColor: Colors.black12,
                color: mainclr,
              ),
            ),
          ),SizedBox(height: MediaQuery.of(context).size.height * .03,),

            const Text(
            'Restaurant KOT Manager',
            style: TextStyle(color: mainclr, fontSize: 18,fontWeight: FontWeight.bold),
          ),
         SizedBox(height: 5,),
          const Text(
            'Powered by Eye2EyeTech',
            style: TextStyle(color: mainclr, fontSize: 16),
          )
          ],
        ),
      ),
    );
  }
}