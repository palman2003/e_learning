import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizPageState();
  }
}

class _QuizPageState extends State<QuizPage> {
  var _selectedQuizValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 156, 27, 255),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 20),
                InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(100),
                  ),
                  onTap: () {},
                  child: Ink(
                    width: 45,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 238, 238, 238),
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                ),
                const Spacer(),
                Text(
                  "2 of 5",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 238, 238, 238),
                      ),
                ),
                const Spacer(),
                const SizedBox(width: 65)
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width - 150,
              height: 5,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: const LinearProgressIndicator(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  backgroundColor: Color.fromARGB(108, 187, 148, 255),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromARGB(255, 238, 238, 238),
                  ),
                  value: 0.5,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height - 250,
              margin: const EdgeInsets.fromLTRB(10, 0, 15, 0),
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 238, 238, 238),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 196, 118, 255),
                    blurRadius: 1,
                    offset: Offset(5, 5),
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Select right answer",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 106, 106, 106),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "2. Which programming language is commonly used for AI?",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 221, 210),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 236, 185, 169),
                            offset: Offset(0, 5),
                            blurRadius: 1)
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Python",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 79, 79, 79),
                              ),
                        ),
                        const Spacer(),
                        Radio(
                          value: 1,
                          groupValue: _selectedQuizValue,
                          onChanged: ((value) {}),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 235, 221, 244),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 205, 182, 219),
                            offset: Offset(0, 5),
                            blurRadius: 1)
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Javascript",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 79, 79, 79),
                              ),
                        ),
                        const Spacer(),
                        Radio(
                          value: 2,
                          groupValue: _selectedQuizValue,
                          onChanged: ((value) {}),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 217, 240, 192),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 176, 202, 148),
                            offset: Offset(0, 5),
                            blurRadius: 1)
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "C++",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 79, 79, 79),
                              ),
                        ),
                        const Spacer(),
                        Radio(
                          value: 3,
                          groupValue: _selectedQuizValue,
                          onChanged: ((value) {}),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 237, 246, 255),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 170, 195, 220),
                            offset: Offset(0, 5),
                            blurRadius: 1)
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Java",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 79, 79, 79),
                              ),
                        ),
                        const Spacer(),
                        Radio(
                          value: 4,
                          groupValue: _selectedQuizValue,
                          onChanged: ((value) {}),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const SizedBox(width: 30),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        padding: const EdgeInsets.fromLTRB(35, 15, 35, 15),
                        child: Text(
                          "Back",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: Color.fromARGB(255, 255, 118, 32),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 230, 88, 0),
                                offset: Offset(0, 5),
                              )
                            ],
                          ),
                          padding: const EdgeInsets.fromLTRB(35, 15, 35, 15),
                          child: Text(
                            "Next",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
