import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.label, required this.onpress});
  final String label;
  final dynamic onpress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpress, // Your onPressed function
      child: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonclr, // Set the button background color

        minimumSize: Size(double.infinity, 55), // Full-width button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Border radius of 10
        ),
      ),
    );
  }
}