import 'package:e_learning/page/blank.dart';
// ignore: unused_import
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
  // ignore: prefer_typing_uninitialized_variables
  late var db;

  void checkToken() async {
    prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    if (!mounted) {
      return;
    }

    if (token == null) {
      Navigator.pushReplacement(
        context,
        // For testing its routed to Signup
        MaterialPageRoute(
          builder: ((context) => const SignupPage()),
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: ((context) => const HomePage()),
      ),
    );
  }

  void failSafe() async {
    db = await mongo.Db.create(dotenv.env["FAIL_SAFE_MONGO_URI"]!);
    await db.open();

    try {
      var result = await db.collection('failSafe').findOne();

      if (!result["allow"]) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => const Blank()),
          ),
        );
        return;
      } else {
        checkToken();
      }
    } catch (e) {
      debugPrint("Error: $e");
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
