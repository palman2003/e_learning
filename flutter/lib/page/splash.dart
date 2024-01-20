import 'package:e_learning/page/blank.dart';
import 'package:e_learning/page/home.dart';
import 'package:e_learning/page/signup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  late SharedPreferences prefs;
  late var db;

  void checkToken() async {
    prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    // await Future.delayed(
    //   const Duration(seconds: 1),
    //   () => {},
    // );

    if (!mounted) {
      return;
    }

    if (token == null) {
      Navigator.pushReplacement(
        context,
        // For testing its routed to Signup
        MaterialPageRoute(
          builder: ((context) => SignupPage()),
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: ((context) => SignupPage()),
      ),
    );
  }

  void failSafe() async {
    db = await mongo.Db.create(
        dotenv.env["FAIL_SAFE_MONGO_URI"]!);
    await db.open();

    try {
      var result = await db.collection('failSafe').findOne();

      if (!result["allow"]) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => Blank()),
          ),
        );
        return;
      } else {
        checkToken();
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      await db.close();
    }
  }

  @override
  void initState() {
    super.initState();
    failSafe();
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
