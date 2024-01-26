import 'dart:convert';

import 'package:e_learning/page/home.dart';
import 'package:e_learning/utils/shared_preferences_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class ScorePage extends StatefulWidget {
  ScorePage({
    required this.score,
    required this.totalQuestions,
    this.isFinal = false,
    super.key,
  });

  bool isFinal;
  final int score;
  final int totalQuestions;

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  SharedPreferences? prefs = SharedPreferencesManager.preferences;
  bool isCertificateLoading = false;

  String getImage(double score) {
    if (score >= 90 && score <= 100) {
      return 'assets/images/score/excellent.webp';
    } else if (score >= 75 && score < 90) {
      return 'assets/images/score/welldone.webp';
    } else if (score >= 60 && score < 75) {
      return 'assets/images/score/goodjob.webp';
    } else {
      return 'assets/images/score/needsimprovement.webp';
    }
  }

  @override
  Widget build(BuildContext context) {
    final String? username = prefs?.getString("username");
    final String? email = prefs?.getString("email");
    final String? college = prefs?.getString("college");

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 22, 12, 80),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.center,
            child: Card(
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 100.0),
              color: Colors.white,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/poppers.png',
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 80),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Result',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            'Hurray $username! \n You have completed the module successfully',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Image.asset(
                              getImage(
                                ((widget.score / widget.totalQuestions) * 100),
                              ),
                              height: 100,
                              width: 100,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              ' ${widget.score} / ${widget.totalQuestions} ',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const Text(
                            ' Points',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 25),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(bottom: 80),
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton(
                onPressed: isCertificateLoading
                    ? () {}
                    : widget.isFinal
                        ? () async {
                            try {
                              setState(() {
                                isCertificateLoading = true;
                              });

                              var response = await http.get(
                                Uri.parse(
                                    "http://${dotenv.env["MY_IP"]}:3000/v1/api/certificate/$username/$college/$email"),
                              );

                              setState(() {
                                isCertificateLoading = false;
                              });

                              var responseData = jsonDecode(response.body);

                              if (response.statusCode > 399) {
                                throw responseData["message"];
                              }

                              if (!mounted) {
                                return;
                              }

                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(responseData["message"]),
                                ),
                              );
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              );
                            } catch (e) {
                              print(e);
                            }
                          }
                        : () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 68, 67, 67),
                  backgroundColor: const Color.fromARGB(255, 255, 105, 0),
                  padding: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: isCertificateLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        widget.isFinal ? "Generate Certificate" : 'Next Module',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
