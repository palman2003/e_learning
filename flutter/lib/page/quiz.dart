import 'package:e_learning/model/quiz_data.dart';
import 'package:e_learning/widgets/quiz_options.dart';
import 'package:flutter/material.dart';
import 'package:e_learning/model/quiz_state.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({
    required this.quizDataList,
    super.key,
  });

  final List<QuizData> quizDataList;

  @override
  State<StatefulWidget> createState() {
    return _QuizPageState();
  }
}

class _QuizPageState extends State<QuizPage> {
  // ignore: avoid_init_to_null
  var _selectedQuizValue = null;
  var _quizIndex = 0;

  List<QuizState> quizState = [];

  void selectedValueHandler(int value) {
    setState(() {
      _selectedQuizValue = value;
    });
  }

  void quizIndexHandler(value) {
    if (value == 1) {
      if (_selectedQuizValue == null) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please select an answer"),
          ),
        );
        return;
      }

      for (var element in quizState) {
        if (_quizIndex == element.questionIndex) {
          if (widget.quizDataList[_quizIndex].options
                  .indexOf(element.selectedAnswer) !=
              _selectedQuizValue) {
            setState(() {
              element.selectedAnswer =
                  widget.quizDataList[_quizIndex].options[_selectedQuizValue];
            });
          }
        }
      }

      if (_quizIndex == widget.quizDataList.length - 1) {
        quizState.add(
          QuizState(
            correctAnswer: widget.quizDataList[_quizIndex].answer,
            questionIndex: _quizIndex,
            selectedAnswer:
                widget.quizDataList[_quizIndex].options[_selectedQuizValue],
          ),
        );
        int score = 0;

        for (var element in quizState) {
          if (element.correctAnswer == element.selectedAnswer) {
            ++score;
          }
        }

        print("$score/${widget.quizDataList.length}");

        return;
      }

      for (var element in quizState) {
        if (_quizIndex + 1 == element.questionIndex) {
          setState(() {
            _selectedQuizValue = widget.quizDataList[_quizIndex + 1].options
                .indexOf(element.selectedAnswer);
            _quizIndex++;
          });
          return;
        }
      }

      quizState.add(
        QuizState(
          correctAnswer: widget.quizDataList[_quizIndex].answer,
          questionIndex: _quizIndex,
          selectedAnswer:
              widget.quizDataList[_quizIndex].options[_selectedQuizValue],
        ),
      );
      setState(() {
        _selectedQuizValue = null;
        _quizIndex++;
      });
    } else if (value == -1) {
      for (var element in quizState) {
        if (_quizIndex == element.questionIndex) {
          if (widget.quizDataList[_quizIndex].options
                  .indexOf(element.selectedAnswer) !=
              _selectedQuizValue) {
            setState(() {
              element.selectedAnswer =
                  widget.quizDataList[_quizIndex].options[_selectedQuizValue];
            });
          }
        }
      }

      if (_quizIndex == 0) {
        Navigator.pop(context);
      }

      for (var element in quizState) {
        if (_quizIndex - 1 == element.questionIndex) {
          setState(() {
            _selectedQuizValue = widget.quizDataList[_quizIndex - 1].options
                .indexOf(element.selectedAnswer);
            --_quizIndex;
          });
        }
      }
    }
  }

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
                    widget.quizDataList[_quizIndex].question,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 20),
                  QuizOptions(
                    selectedValue: _selectedQuizValue,
                    options: widget.quizDataList[_quizIndex].options,
                    selectedValueHandler: selectedValueHandler,
                  ),
                  // ignore: prefer_const_constructors
                  Spacer(),
                  Row(
                    children: [
                      const SizedBox(width: 30),
                      InkWell(
                        onTap: () {
                          quizIndexHandler(-1);
                        },
                        child: Container(
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
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          quizIndexHandler(1);
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
                          padding: const EdgeInsets.fromLTRB(35, 15, 35, 15),
                          child: Text(
                            _quizIndex == widget.quizDataList.length - 1
                                ? "Complete"
                                : "Next",
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
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
