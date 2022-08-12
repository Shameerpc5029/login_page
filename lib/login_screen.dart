import 'package:flutter/material.dart';
import 'package:login_screen/home_screen.dart';
import 'package:login_screen/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _userName = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'WELCOME TO SR FOOD DELIVERY',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 15, 80, 12)),
              ),
              //logo image
              const Expanded(
                child: Image(
                  image: AssetImage(
                    'assets/images/vector_food_chief_logo.png',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        'LOG IN',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      Text(
                        'NOW',
                        style: TextStyle(
                            height: 3,
                            fontSize: 10,
                            color: Color.fromARGB(255, 211, 23, 23),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // user label
              TextFormField(
                controller: _userName,
                decoration: const InputDecoration(
                  labelText: 'User Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // password label
              TextFormField(
                controller: _password,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      checkLogin(context);
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('Sign In'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext context) async {
    if (_userName.text == 'shameer' && _password.text == '123') {
      //login homeScreen
      final sharedPrefer = await SharedPreferences.getInstance();
      await sharedPrefer.setBool(loginKey, true);

      Navigator.of(context).pushReplacement (
        MaterialPageRoute(
          builder: (ctx) {
            return const HomeScreen();
          },
        ),
      );
    } else {
      //snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          content: Text(
            'USER NOT FOUND !',
            style: TextStyle(fontSize: 10),
          ),
        ),
      );
    }
  }
}
