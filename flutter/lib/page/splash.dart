import 'package:e_learning/page/home.dart';
import 'package:e_learning/page/signup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  late SharedPreferences prefs;

  void checkToken() async {
    prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    await Future.delayed(
      const Duration(seconds: 1),
      () => {},
    );

    if (!mounted) {
      return;
    }

    if (token == null) {
      Navigator.pushReplacement(
        context,
        // For testing its routed to HomePage
        MaterialPageRoute(
          builder: ((context) => const SignupPage()),
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: ((context) => const SignupPage()),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    checkToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 16),
            const Text(
              'E-Learning App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
