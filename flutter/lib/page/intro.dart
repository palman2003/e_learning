import 'dart:convert';

import 'package:e_learning/data/module_data.dart';
import 'package:e_learning/page/module.dart';
import 'package:e_learning/utils/shared_preferences_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends StatefulWidget {
  IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  SharedPreferences? prefs = SharedPreferencesManager.preferences;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Introduction',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
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
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
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
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Spacer(),
                      ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () async {
                                setState(() {
                                  isLoading = true;
                                });

                                try {
                                  var response = await http.post(
                                    Uri.parse(
                                        "${dotenv.env["BACKEND_API_BASE_URL"]}/quiz/complete"),
                                    headers: {
                                      "Content-Type": "application/json"
                                    },
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
                                    await prefs!.setInt("progress",
                                        (prefs!.getInt("progress")!) + 1);
                                  }

                                  Navigator.of(context)
                                      .pop(prefs!.getInt("progress")!);
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ModulePage(
                                          moduleData: module[0],
                                          appBarTitle: "Learning Module",
                                          title: 'Hello',
                                          moduleIndex: 1)));
                                } catch (error) {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        error.toString(),
                                      ),
                                    ),
                                  );
                                } finally {
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 118, 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          shadowColor: const Color.fromARGB(255, 230, 88, 0),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Color.fromARGB(255, 230, 88, 0)),
                                )
                              : Text(
                                  "Lets get started    >",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
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
