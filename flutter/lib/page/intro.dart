import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'E-Learning Module for Sales & Distribution',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              'Introduction to the course:',
              style: TextStyle(
                  fontSize: 18, color: Color.fromARGB(255, 109, 109, 109)),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
                'Welcome to the e-learning module personalized for you, where you will learn everything you need to know about Sales & Distribution – which will not only help you during the course of your internship but also during your career. We have divided the course in 2 divisions, and after each division there will be a Quiz which will evaluate your level of understanding on the topics. We are excited to have you!!!',
                style: TextStyle(fontSize: 16, color: Colors.black)),
            SizedBox(
              height: 24,
            ),
            Text(
              'Table of Contents: \n1.Basics of Sales & Distribution \n2.Quiz – 1 \n3.Project Tasks & Data Collection \n4.Quiz – 2 \n5.Case Study',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
