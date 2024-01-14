import 'package:flutter/material.dart';
import 'package:e_learning/page/auth.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 4),
      () => {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => const AuthPage()),
          ),
        )
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Adjust the background color as needed
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash.png', // Replace with the path to your local image
              width: 150, // Adjust the width as needed
              height: 150, // Adjust the height as needed
            ),
            const SizedBox(
                height: 16), // Adjust the space between image and text
            const Text(
              'E-Learning App',
              style: TextStyle(
                fontSize: 24, // Adjust the font size as needed
                fontWeight: FontWeight.bold,
                color: Colors.black, // Adjust the text color as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}
