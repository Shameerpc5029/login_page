import 'package:flutter/material.dart';
import 'package:login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ITEMS'),
        actions: [
          IconButton(
              onPressed: () {
                sigout(context);
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: Center(
        child: ListView.separated(
          itemBuilder: (ctx, index) {
            if (index % 2 == 0) {
              return const ListTile(
                leading: CircleAvatar(
                  child: Image(
                    image: AssetImage('assets/images/chicken_biriyani.jpeg'),
                  ),
                ),
                title: Text(
                  'BIRIYANI',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            } else {
              return const ListTile(
                leading: Image(
                  width: 30,
                  image: AssetImage(
                    'assets/images/brost.jpeg',
                  ),
                ),
                title: Text(
                  'BROST',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: 30,
        ),
      ),
    );
  }

  sigout(BuildContext context) async {
    final sharedPrefer = await SharedPreferences.getInstance();
    sharedPrefer.clear();

    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (context) {
        return LoginScreen();
      },
    ), (route) => false);
  }
}
