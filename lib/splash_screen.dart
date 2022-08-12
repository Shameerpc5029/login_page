import 'package:flutter/material.dart';
import 'package:login_screen/home_screen.dart';
import 'package:login_screen/login_screen.dart';
import 'package:login_screen/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              width: 300,
              image: AssetImage('assets/images/splashLogo.png'),
            ),
            SizedBox(
              height: 21,
            ),
            Text(
              'FOOD TO YOUR DOORS...',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 5,
                wordSpacing: 5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> gotoLogin() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) {
          return LoginScreen();
        },
      ),
    );
  }

  Future<void> checkUserLogin() async {
    final sharedPrefer = await SharedPreferences.getInstance();
    final userLogedIn = sharedPrefer.getBool(loginKey);
    if (userLogedIn == null || userLogedIn == false) {
      gotoLogin();
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx1) {
            return const HomeScreen();
          },
        ),
      );
    }
  }
}
