// import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:restaurant_kot/application/BillSubmitPrint/bill_submit_print_bloc.dart';
import 'package:restaurant_kot/application/printer%20setup/printer_setup_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/core/printer/network_printer.dart';
import 'package:restaurant_kot/domain/printer/priter_config.dart';
import 'package:restaurant_kot/presendation/screen%20home/screen_home.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';

// class BillPrintpage extends StatelessWidget {
//   const BillPrintpage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         Navigator.of(context).pushAndRemoveUntil(
//           MaterialPageRoute(
//               builder: (context) => const HomeScreen(
//                     from: 1,
//                   )),
//           (route) => false, // This removes all previous routes from the stack
//         );
//         return false; // Prevent back navigation
//       },
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 12),
//           child: BlocConsumer<BillSubmitPrintBloc, BillSubmitPrintState>(
//             listener: (context, state) {
//               if (state.printerstatus == 2) {
//                 showErrorBottomSheet(context,(){});
//               }
//             },
//             builder: (context, state) {
//               return Column(
//                 children: [
//                   const SizedBox(
//                     height: 35,
//                   ),
//                   Align(
//                       alignment: Alignment.topLeft,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: IconButton(
//                             onPressed: () {
//                               Navigator.of(context).pushAndRemoveUntil(
//                                 MaterialPageRoute(
//                                     builder: (context) => const HomeScreen(
//                                           from: 1,
//                                         )),
//                                 (route) =>
//                                     false, // This removes all previous routes from the stack
//                               );
//                             },
//                             icon: const Icon(
//                               Icons.close,
//                               size: 25,
//                             )),
//                       )),
//                   Spacer(),
//                   const SizedBox(
//                     height: 12,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 50),
//                     child: Column(
//                       children: [
// const Center(
//     child: CircleAvatar(
//   radius: 50,
//   backgroundColor: mainclr,
//   child: Icon(
//     Icons.done_rounded,
//     size: 73,
//     color: Colors.white,
//   ),
// )),
// const SizedBox(
//   height: 16,
// ),
// const Text(
//   'Bill Submitted',
//   style: TextStyle(
//       fontSize: 23, fontWeight: FontWeight.w600),
// ),
// const SizedBox(
//   height: 4,
// ),
// const Text(
//   'Table No: TB 001',
//   style: TextStyle(
//       fontSize: 14, fontWeight: FontWeight.w600),
// ),
// const Text('Order No: ORD001',
//     style: TextStyle(
//         fontSize: 16, fontWeight: FontWeight.w500)),
// const SizedBox(
//   height: 10,
// ),
//                         state.printerstatus == 1
//                             ? const SizedBox()
//                             : state.printerstatus == 2
//                                 ? TextButton(
//                                     onPressed: () {},
//                                     child: const Text('Re-Print'))
//                                 : const Column(
//                                     children: [
//                                       Padding(
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: 70),
//                                         child: LinearProgressIndicator(
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(12)),
//                                           color: mainclr,
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                       Text(
//                                         'Printing ......',
//                                         textAlign: TextAlign.center,
//                                         style: TextStyle(
//                                           color: mainclr,
//                                           fontSize: 12,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                       ],
//                     ),
//                   ),
//                   const Spacer(),
//                   const Spacer(),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

class BillPrintpage extends StatefulWidget {
  BillPrintpage({
    super.key,
  });

  // final AssetsAudioPlayer player = AssetsAudioPlayer();

  @override
  State<BillPrintpage> createState() => _BillPrintpageState();
}

class _BillPrintpageState extends State<BillPrintpage> {
  @override
  void initState() {
    super.initState();

    // widget.player.open(
    //   Audio('assets/mp3/success-1-6297.mp3'),
    //   autoStart: true,
    // );

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
          child: BlocConsumer<BillSubmitPrintBloc, BillSubmitPrintState>(
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
                        _buildSuccessSection(state),
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

  Widget _buildSuccessSection(BillSubmitPrintState state) {
    return Column(
      children: [
        SizedBox(height: 20),
        const Center(
            child: CircleAvatar(
          radius: 50,
          backgroundColor: mainclr,
          child: Icon(
            Icons.done_rounded,
            size: 73,
            color: Colors.white,
          ),
        )),
        const SizedBox(
          height: 16,
        ),
        const Text(
          'Bill Submitted',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Order No: ${state.orderid ?? ''}',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Text(state.invNo,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _buildPrinterStatusSection(BillSubmitPrintState state) {
    PrinterConfig? printer =
        context.read<PrinterSetupBloc>().state.billPrinterInfo;
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
            onPressed: () {
              BlocProvider.of<BillSubmitPrintBloc>(context)
                  .add(BillSubmitPrintEvent.billRePrint(
                printer: printer!,
              ));
            },
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
