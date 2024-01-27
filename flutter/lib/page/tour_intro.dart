import 'package:e_learning/page/home.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class TourIntro extends StatelessWidget {
  const TourIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ElevatedButton(
          child: Text("Next"),
          onPressed: () => {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ShowCaseWidget(
                  builder: Builder(
                    builder: (context) => HomePage(
                      isFirstlogin: true,
                    ),
                  ),
                ),
              ),
            )
          },
        ),
      ],
    ));
  }
}
