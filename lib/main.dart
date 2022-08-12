import 'package:flutter/material.dart';
import 'package:login_screen/splash_screen.dart';

const loginKey = 'userLogin';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
