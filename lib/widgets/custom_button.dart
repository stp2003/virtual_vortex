import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomButton extends StatelessWidget {
  // ? text for custom button that we will get at different location when we use it ->
  final String text;

  //?? onPressed function ->
  final VoidCallback onPressed;

  //** calling in constructor ->
  const CustomButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(
        onPressed: onPressed,
        //** for styling the button ->
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          minimumSize: const Size(
            //* for wrapping whole screen
            double.infinity,
            50,
          ),

          //* for making button rounded
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),

            //* to replace the default border color with my border color
            side: const BorderSide(color: buttonColor),
          ),
        ),

        //** the text on the button which will we ued while implementing the button ->
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
      ),
    );
  }
}
