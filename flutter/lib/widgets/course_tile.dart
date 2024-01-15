import 'package:e_learning/model/quiz_data.dart';
import 'package:e_learning/page/quiz.dart';
import 'package:flutter/material.dart';

class CourseTile extends StatelessWidget {
  const CourseTile({
    required this.gradientColors,
    required this.title,
    this.quizDataList,
    this.margin,
    super.key,
  });

  final List<Color> gradientColors;
  final List<QuizData>? quizDataList;
  final String title;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: margin,
        child: InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => QuizPage(quizDataList: quizDataList!)),
              ),
            );
          },
          child: Ink(
            width: double.infinity,
            height: 175,
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          '200',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Image.asset(
                          'assets/images/appbar_icon.png',
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
