import 'package:e_learning/model/quiz_data.dart';
import 'package:e_learning/page/quiz.dart';
import 'package:flutter/material.dart';

class CourseTile extends StatelessWidget {
  const CourseTile({
    this.quizDataList,
    required this.title,
    super.key,
  });

  final String title;
  final List<QuizData>? quizDataList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 227, 150, 255),
            blurRadius: 1,
            offset: Offset(5, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Image.asset(
            "assets/images/doodad.jpg",
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              const SizedBox(height: 60),
              Image.asset(
                "assets/images/splash.png",
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 30),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 241, 241, 241),
                    ),
              ),
              Text(
                "Lorem Ipsum sdnsdlk jnknknknkn nd typesettingindustry.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(210, 255, 255, 255),
                    ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 0, right: 10),
                      padding: const EdgeInsets.fromLTRB(25, 10, 20, 10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            '200',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color:
                                        const Color.fromARGB(255, 255, 110, 7),
                                    fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 5),
                          Image.asset(
                            'assets/images/appbar_icon.png',
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Material(
                      type: MaterialType.transparency,
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    QuizPage(quizDataList: quizDataList!),
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                            child: Text(
                              "Enroll",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: const Color.fromARGB(
                                          255, 255, 110, 7),
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
