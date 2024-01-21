import 'package:e_learning/page/home.dart';
import 'package:flutter/material.dart';

class ScorePage extends StatelessWidget {
  final int score;
  final int totalQuestions;

  ScorePage({required this.score, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    String getImage(int score) {
      if (score >= 8 && score <= 10) {
        return 'assets/images/score/excellent.webp';
      } else if (score >= 6 && score <= 7) {
        return 'assets/images/score/goodjob.webp';
      } else if (score >= 5 && score <= 4) {
        return 'assets/images/score/welldone.webp';
      } else if (score >= 3 && score <= 2) {
        return 'assets/images/score/average.webp';
      } else {
        return 'assets/images/score/needsimprovement.webp';
      }
    }

    return PopScope(
      canPop: false,
      // onWillPop: () async {
      //   return false;
      // },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 22, 12, 80),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment.center,
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 100.0),
                color: Colors.white,
                child: Container(
                  height: MediaQuery.of(context).size.height *
                      0.8, // Adjust the height as needed
                  child: Stack(
                    children: [
                      // Background Image
                      Image.asset(
                        'assets/images/poppers.png', // Replace with your image path
                        height: MediaQuery.of(context).size.height *
                            0.3, // 20% of card height
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      // Content Overlay
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 80),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Top Text
                            Text(
                              'Result',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              'Hurray Naveen! \n You have completed the module successfully',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Image.asset(
                                  getImage(score),
                                  height: 100,
                                  width: 100,
                                )),
                            // Congratulatory Text
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                ' $score / $totalQuestions ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              ' Points',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            ),
                            // Your Score Text
                            SizedBox(height: 25),
                            // Thumbs Up Image
                            Spacer(),
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
                padding: EdgeInsets.only(bottom: 80),
                width: MediaQuery.of(context).size.width *
                    0.7, // Adjust the width as needed
                child: ElevatedButton(
                  onPressed: () {
                    // Handle the button press
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomePage()));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 68, 67, 67),
                    backgroundColor: Color.fromARGB(255, 255, 105, 0),
                    padding: EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Next Module',
                    style: TextStyle(
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
      ),
    );
  }
}
