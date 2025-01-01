import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const LinearProgressIndicator(
        borderRadius:
            BorderRadius.all(Radius.circular(20)),
        color: mainclr,
      );
  }
}

