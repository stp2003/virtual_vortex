import 'package:flutter/material.dart';
import 'package:virtual_vortex/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ? for the text at the beginning ->
          const Text(
            'Start or Join a Meeting',
            style: TextStyle(
              letterSpacing: 0.9,
              fontSize: 24.0,
              color: Colors.cyanAccent,
              fontWeight: FontWeight.bold,
            ),
          ),

          //? the image ->
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 45.0),
            child: Image.asset('assets/images/onboarding.jpg'),
          ),

          //? Custom button ->
          CustomButton(
            text: 'Google Sign In',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
