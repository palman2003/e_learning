import 'dart:convert';

import 'package:e_learning/utils/shared_preferences_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends StatelessWidget {
  IntroPage({super.key});

  SharedPreferences? prefs = SharedPreferencesManager.preferences;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Introduction',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                // color: const Color.fromARGB(255, 64, 64, 64),
                color: Colors.white,
              ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 153, 0, 255),
        foregroundColor: const Color.fromARGB(255, 234, 224, 224),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/intro.png",
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'E-Learning Module for Sales & Distribution',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 56, 141)),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Introduction to the course:',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                      'Welcome to the e-learning module personalized for you, where you will learn everything you need to know about Sales & Distribution – which will not only help you during the course of your internship but also during your career. We have divided the course in 2 divisions, and after each division there will be a Quiz which will evaluate your level of understanding on the topics. We are excited to have you!!!',
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Table of Contents:',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 4.0, left: 10),
                    child: Text(
                      '1. Basics of Sales & Distribution \n2. Quiz – 1 \n3. Project Tasks & Data Collection \n4. Quiz – 2 \n5. Case Study',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Spacer(),
                      InkWell(
                        splashColor: Colors.transparent,
                        onTap: () async {
                          try {
                            var response = await http.post(
                              Uri.parse(
                                  "http://${dotenv.env["MY_IP"]}:3000/v1/api/quiz/complete"),
                              headers: {"Content-Type": "application/json"},
                              body: jsonEncode(
                                {
                                  "email": prefs!.getString("email"),
                                  "module": 0,
                                },
                              ),
                            );

                            var responseData = jsonDecode(response.body);

                            print(responseData);

                            if (response.statusCode > 399) {
                              throw responseData["message"];
                            }

                            if (responseData["increment"]) {
                              await prefs!.setInt(
                                  "progress", (prefs!.getInt("progress")!) + 1);
                            }

                            Navigator.of(context).pop(prefs!.getInt("progress")!);

                          } catch (error) {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  error.toString(),
                                ),
                              ),
                            );
                          }
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 118, 32),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 230, 88, 0),
                                offset: Offset(0, 5),
                              )
                            ],
                          ),
                          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child: Text(
                            "Lets get started    >",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
