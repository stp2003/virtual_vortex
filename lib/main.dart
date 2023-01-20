import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:virtual_vortex/screens/login_screen.dart';
import 'package:virtual_vortex/utils/colors.dart';

void main() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online meeting app',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),

      //** making routes ->
      routes: {
        '/login': (context) => const LoginScreen(),
      },

      // home
      home: const LoginScreen(),
    );
  }
}
