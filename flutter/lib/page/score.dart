import 'package:flutter/material.dart';

class ScorePage extends StatelessWidget {
  final int score;
  final int totalQuestions;

  ScorePage({required this.score, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 156, 28, 255),
      body: Stack(
        fit: StackFit.expand,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Color.fromARGB(255, 156, 28, 255).withOpacity(0.5),
              BlendMode.srcATop,
            ),
            child: Image.asset(
              'assets/images/resultbg2.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 150),
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Top Text
                  Text(
                    'Hurray Naveen! \n You have completed the course successfully',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      'assets/images/thumb.png',
                      height: 100,
                      width: 100,
                    ),
                  ),
                  // Congratulatory Text
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 2.0,
                    ),
                    child: Text(
                      'You have scored $score questions out of $totalQuestions correctly.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // Your Score Text
                  SizedBox(height: 25),
                  // Thumbs Up Image
                  Image.asset(
                    'assets/images/cert.png',
                    fit: BoxFit.fill,
                    width: 150,
                    height: 100,
                  ),
                  //SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      // Handle the button press
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Color.fromARGB(255, 255, 255, 255),
                      // padding: EdgeInsets.all(16.0),
                    ),
                    child: Text(
                      'Download Certificate',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        // Handle the button press
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFFEEEEFF),
                        foregroundColor: Color.fromARGB(255, 68, 67, 67),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                      child: Text(
                        'Continue to Homepage',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
