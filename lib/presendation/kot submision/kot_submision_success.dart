import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:restaurant_kot/application/KotSubmitPrint/kot_submit_print_bloc.dart';
import 'package:restaurant_kot/application/tables/tables_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/core/printer/network_printer.dart';
import 'package:restaurant_kot/presendation/screen%20home/screen_home.dart';

class BillSubmitedDone extends StatefulWidget {
  final dynamic onpress;

  BillSubmitedDone({Key? key, required this.onpress}) : super(key: key);

  final AssetsAudioPlayer player = AssetsAudioPlayer();

  @override
  State<BillSubmitedDone> createState() => _BillSubmitedDoneState();
}

class _BillSubmitedDoneState extends State<BillSubmitedDone> {
  @override
  void initState() {
    super.initState();

    widget.player.open(
      Audio('assets/mp3/success-1-6297.mp3'),
      autoStart: true,
    );

    HapticFeedback.lightImpact();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(from: 1),
          ),
          (route) => false,
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(from: 1),
                ),
                (route) => false,
              );
            },
          ),
        ),
        body: SafeArea(
          child: BlocConsumer<KotSubmitPrintBloc, KotSubmitPrintState>(
            listener: (context, state) {
              // Handle state changes if needed
            },
            builder: (context, state) {
              return Center(
                child: AnimationLimiter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 375),
                      childAnimationBuilder: (widget) => SlideAnimation(
                        horizontalOffset: 50.0,
                        child: FadeInAnimation(child: widget),
                      ),
                      children: [
                        _buildSuccessSection(),
                        _buildPrinterStatusSection(state),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessSection() {
    return const Column(
      children: [
        SizedBox(height: 20),
        CircleAvatar(
          backgroundColor: mainclr,
          radius: 60,
          child: Icon(Icons.done, color: Colors.white, size: 44),
        ),
        SizedBox(height: 15),
        Text(
          'Submitted',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 3),
        Text(
          'KOT has been Submitted',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildPrinterStatusSection(KotSubmitPrintState state) {
    if (state.printerstatus == 1) {
      return const SizedBox();
    } else if (state.printerstatus == 2) {
      return Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.15, // 15% of screen height
              width: MediaQuery.of(context).size.width *
                  0.8, // 80% of screen width
              child: Image.asset(
                'assets/img/printer/printerb.jpg',
                fit: BoxFit.contain, // Ensures the image maintains aspect ratio
              ),
            ),
          ),
          const Text(
            'Printing was not completed\nPlease check the printer for any issues.',
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: widget.onpress,
            child: const Text(
              'Re-Print',
              style: TextStyle(fontWeight: FontWeight.bold, color: mainclr),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Divider(),
          )
        ],
      );
    } else {
      return const Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 70),
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: mainclr,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Printing ......',
            textAlign: TextAlign.center,
            style: TextStyle(color: mainclr, fontSize: 12),
          ),
        ],
      );
    }
  }
}
