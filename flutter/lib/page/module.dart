import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_learning/data/module_data.dart';
import 'package:e_learning/model/quiz_data.dart';
import 'package:e_learning/page/quiz.dart';
import 'package:e_learning/page/quiz_splash.dart';
import 'package:e_learning/utils/shared_preferences_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ModulePage extends StatefulWidget {
  const ModulePage({
    required this.moduleData,
    required this.appBarTitle,
    required this.title,
    // required this.isFinal,
    // required this.quizData,
    this.progressHandler,
    required this.moduleIndex,
    super.key,
  });

  final List moduleData;
  final String appBarTitle;
  // final bool isFinal;
  final String title;
  final int moduleIndex;
  final void Function()? progressHandler;
  // final List<QuizData> quizData;

  @override
  State<StatefulWidget> createState() {
    return _ModulePageState();
  }
}

class _ModulePageState extends State<ModulePage> {
  SharedPreferences? prefs = SharedPreferencesManager.preferences;
  TextStyle fontTheme = GoogleFonts.dmSerifDisplay();
  int minWordCount = 5;
  int wordCount = 0;
  Future<void> loadQuiz(
      BuildContext context, bool isFinal, List<QuizData> quizData) async {
    if (!mounted) {
      return;
    }

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Quiz Confirmation'),
          content: const SingleChildScrollView(
            child: Text('Do you really want to take the quiz?'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizPage(
                      quizData: quizData,
                      isFinal: isFinal,
                    ),
                  ),
                );
              },
              child: const Text('Confirm'),
            )
          ],
        );
      },
    );
  }

  int sectionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: const Color.fromARGB(255, 153, 0, 255),
        foregroundColor: Colors.white,
        title: Text(
          widget.appBarTitle,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                // color: const Color.fromARGB(255, 64, 64, 64),
                color: Colors.white,
              ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: LinearProgressIndicator(
              value: (sectionIndex + 1) / widget.moduleData.length),
        ),
      ),
      bottomSheet: Container(
        height: 60,
        width: double.infinity,
        color: Colors.white,
        // decoration: const BoxDecoration(
        // color: Color.fromARGB(255, 153, 0, 255),
        //   borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(20),
        //     topRight: Radius.circular(20),
        //   ),
        // ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            IconButton(
              onPressed: () {
                if (!(sectionIndex == 0)) {
                  setState(() {
                    sectionIndex--;
                  });
                }
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                // color: Colors.white,
              ),
            ),
            const Spacer(),
            Text(
              "${sectionIndex + 1}/${widget.moduleData.length}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                // color: Colors.white,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () async {
                if ((sectionIndex == widget.moduleData.length - 2)) {
                  try {
                    if (!(prefs!.getBool("isModuleFinished")!)) {
                      http.post(
                        Uri.parse(
                            "${dotenv.env["BACKEND_API_BASE_URL"]}/quiz/complete"),
                        headers: {"Content-Type": "application/json"},
                        body: jsonEncode(
                          {
                            "email": prefs!.getString("email"),
                            "module": 1,
                          },
                        ),
                      );
                      await prefs!.setBool("isModuleFinished", true);
                      if (widget.progressHandler != null) {
                        widget.progressHandler!();
                      }
                    }
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
                }

                if (!(sectionIndex == widget.moduleData.length - 1)) {
                  setState(() {
                    sectionIndex++;
                  });
                }
              },
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                // color: Colors.white,
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 300) {
            if (!(sectionIndex == 0)) {
              setState(() {
                sectionIndex--;
              });
            }
          } else if (details.primaryVelocity! < -300) {
            if (!(sectionIndex == widget.moduleData.length - 1)) {
              setState(() {
                sectionIndex++;
              });
            }
          }
        },
        child: ListView.builder(
          itemCount: widget.moduleData[sectionIndex].length,
          itemBuilder: (context, index) {
            var currentData = widget.moduleData[sectionIndex][index];
            if (currentData is BodyImage) {
              return Padding(
                  padding:
                      EdgeInsets.fromLTRB(30, currentData.topPadding, 30, 0),
                  child: currentData.image);
            } else if (currentData is HeadImage) {
              return Padding(
                  padding: EdgeInsets.fromLTRB(0, currentData.topPadding, 0, 0),
                  child: currentData.image);
            } else if (currentData is Header) {
              return Padding(
                padding: EdgeInsets.fromLTRB(
                    currentData.sidePadding,
                    currentData.topPadding,
                    currentData.sidePadding,
                    currentData.bottomPadding),
                child: Container(
                  // height: 100,
                  // width: MediaQuery.of(context).size.width - 20,
                  color: currentData.bgColor,
                  padding: EdgeInsets.symmetric(
                      horizontal: 30, vertical: currentData.contPadding),
                  // padding: EdgeInsets.fromLTRB(
                  //     30, currentData.topPadding, 30, currentData.bottomPadding),
                  child: Text(
                    currentData.text,
                    style: GoogleFonts.dmSerifDisplay().copyWith(
                      fontSize: currentData.fontSize,
                      fontWeight: FontWeight.bold,
                      color: currentData.textColor,
                      // backgroundColor: currentData.bgColor
                      wordSpacing: 5,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
              );
            } else if (currentData is Heading) {
              return Padding(
                padding: EdgeInsets.fromLTRB(
                    30, currentData.topPadding, 30, currentData.bottomPadding),
                child: Center(
                  child: Text(
                    currentData.text,
                    style: GoogleFonts.dmSerifDisplay().copyWith(
                        fontSize: currentData.fontSize,
                        fontWeight: FontWeight.bold,
                        color: currentData.textColor,
                        backgroundColor: currentData.bgColor
                        // wordSpacing: 5,
                        ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
              );
            } else if (currentData is TabularColumn) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Table(
                  border: TableBorder.all(),
                  children: currentData.data.asMap().entries.map((entry) {
                    final rowIndex = entry.key;
                    final row = entry.value;
                    return TableRow(
                      decoration: rowIndex == 0
                          ? BoxDecoration(
                              color: Color.fromARGB(255, 151, 192, 232),
                            )
                          : null,
                      children: row.map((cell) {
                        return TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              cell,
                              style: rowIndex == 0
                                  ? GoogleFonts.dmSerifDisplay().copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      backgroundColor:
                                          Color.fromARGB(255, 151, 192, 232),
                                    )
                                  : GoogleFonts.dmSerifDisplay()
                                      .copyWith(fontSize: 16),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }).toList(),
                ),
              );
            } else if (currentData is SubHeading) {
              return Padding(
                padding: EdgeInsets.fromLTRB(
                    30, currentData.topPadding, 30, currentData.bottomPadding),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        currentData.text,
                        style: fontTheme.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: currentData.textColor,
                          backgroundColor: currentData.bgColor,
                          // wordSpacing: 5,
                        ),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              );
            } else if (currentData is BulletPoint) {
              return Padding(
                padding: EdgeInsets.fromLTRB(30.0 + currentData.leftPadding,
                    currentData.topPadding, 30, currentData.bottomPadding),
                child: Text(
                  //◉⁍
                  "◉ ${currentData.text}",
                  textAlign: TextAlign.start,
                  style: fontTheme.copyWith(
                    fontSize: 16,
                    // color: Color.fromARGB(255, 64, 64, 64),
                    fontWeight: currentData.weight,
                    backgroundColor: currentData.bgColor,
                    color: currentData.textColor,
                    // wordSpacing: 3,
                  ),
                ),
              );
            } else if (currentData is SubBulletPoint) {
              return Padding(
                padding: EdgeInsets.fromLTRB(currentData.leftPadding + 30,
                    currentData.topPadding, 30, currentData.bottomPadding),
                child: Text(
                  "◉    ${currentData.text}",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.dmSerifDisplay().copyWith(
                      fontSize: 14,
                      // color: Color.fromARGB(255, 64, 64, 64),
                      // fontWeight: FontWeight.bold,
                      color: currentData.textColor,
                      backgroundColor: currentData.bgColor
                      // wordSpacing: 3,
                      ),
                ),
              );
            } else if (currentData is Boxes) {
              return Padding(
                padding: EdgeInsets.fromLTRB(
                  30,
                  currentData.topPadding,
                  30,
                  currentData.bottomPadding,
                ),
                child: const Column(
                  children: [],
                ),
              );
            } else if (currentData is Body) {
              return Padding(
                padding: EdgeInsets.fromLTRB(
                    30, currentData.topPadding, 30, currentData.bottomPadding),
                child: Text(
                  currentData.text,
                  style: GoogleFonts.dmSerifDisplay().copyWith(
                    fontSize: currentData.fontSize,
                    // color: Color.fromARGB(255, 64, 64, 64),
                    backgroundColor: currentData.bgColor,
                    fontWeight: currentData.weight,
                    color: currentData.textColor,
                    // wordSpacing: 3,
                  ),
                  textAlign: currentData.align,
                ),
              );
            } else if (currentData is QuizButton) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: 20,
                    top: currentData.topPadding,
                    right: 30,
                    left: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      'Quiz Time...',
                      style: fontTheme.copyWith(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Image.asset(
                      "assets/images/module1/quiz.png",
                    ),
                    // Text(
                    //   "Now that you have gone through the course content, you will have to take a quiz which will cover all the topics of this module. You will have a total of 17 questions out of which you should get at least 11 of them right to proceed to the next section.",
                    //   style: Theme.of(context).textTheme.bodyLarge,
                    // ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {
                        loadQuiz(
                            context, currentData.isFinal, currentData.quizData);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(
                            color: Color.fromARGB(255, 219, 229, 18),
                            width: 3,
                          ),
                        ),
                      ),
                      child: const Text(
                        'Take Quiz',
                        style: TextStyle(
                          color: Colors.black,
                          // color: Color.fromARGB(255, 139, 0, 232),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (currentData is ImageSlider) {
              return Padding(
                padding:
                    EdgeInsets.symmetric(vertical: currentData.verticalPadding),
                child: CarouselSlider(
                  items: currentData.imageList
                      .map((e) => Container(
                            height: currentData.height,
                            child: Image.asset(
                              e,
                              height: currentData.height,
                              fit: BoxFit.contain,
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    autoPlay: true,
                  ),
                ),
              );
            } else if (currentData is CaseStudy) {
              return Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentData.question,
                      style: fontTheme.copyWith(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: currentData.controller,
                      decoration: InputDecoration(
                        hintText: 'Enter your answer here...',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.text,
                      maxLines: null,
                      onChanged: (text) {
                        // Update the word count when the text changes
                        int wordCount = text.trim().split(' ').isEmpty
                            ? 0
                            : text.trim().split(' ').length;
                        setState(() {
                          currentData.wordCount = wordCount;
                        });
                      },
                    ),
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Minimum Word Count: ${currentData.wordCount} / ${minWordCount}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Confirmation'),
                              content: const SingleChildScrollView(
                                child: Text(
                                    'Do you really want to submit your answer?'),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    Navigator.of(context).pop();
                                    int wordCount;
                                    if (currentData.controller.text
                                        .trim()
                                        .split(' ')
                                        .isEmpty) {
                                      wordCount = 0;
                                    } else {
                                      wordCount = currentData.controller.text
                                          .trim()
                                          .split(' ')
                                          .length;
                                    }

                                    if (wordCount >= minWordCount) {
                                      String answer =
                                          currentData.controller.text;

                                      if (currentData.controller ==
                                          answerController1) {
                                        try {
                                          http.post(
                                            Uri.parse(
                                              "${dotenv.env["BACKEND_API_BASE_URL"]}/certificate/caseStudy-data/${prefs!.getString("email")!}/1",
                                            ),
                                            headers: {
                                              "Content-Type": "application/json"
                                            },
                                            body: jsonEncode(
                                              {"data": answer},
                                            ),
                                          );
                                          await prefs!
                                              .setBool("caseStudy1", true);
                                        } catch (e) {
                                          print(e);
                                        }
                                      }
                                      if (currentData.controller ==
                                          answerController2) {
                                        try {
                                          http.post(
                                            Uri.parse(
                                              "${dotenv.env["BACKEND_API_BASE_URL"]}/certificate/caseStudy-data/${prefs!.getString("email")}/2",
                                            ),
                                            headers: {
                                              "Content-Type": "application/json"
                                            },
                                            body: jsonEncode(
                                              {"data": answer},
                                            ),
                                          );
                                          await prefs!
                                              .setBool("caseStudy2", true);
                                        } catch (e) {
                                        } catch (e) {}
                                      }
                                      if (currentData.controller ==
                                          answerController3) {
                                        try {
                                          http.post(
                                            Uri.parse(
                                              "${dotenv.env["BACKEND_API_BASE_URL"]}/certificate/caseStudy-data/${prefs!.getString("email")}/3",
                                            ),
                                            headers: {
                                              "Content-Type": "application/json"
                                            },
                                            body: jsonEncode(
                                              {"data": answer},
                                            ),
                                          );
                                          await prefs!
                                              .setBool("caseStudy3", true);
                                        } catch (e) {
                                        } catch (e) {}
                                      }
                                      if (currentData.controller ==
                                          answerController4) {
                                        if ((prefs!.getBool("caseStudy4")!)) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  "Already completed"),
                                            ),
                                          );
                                          return;
                                        }

                                        if (!(prefs!.getBool("caseStudy1")!) ||
                                            !(prefs!.getBool("caseStudy2")!) ||
                                            !(prefs!.getBool("caseStudy3")!)) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  "Please complete all the previous questions first"),
                                            ),
                                          );
                                          return;
                                        }
                                        try {
                                          http.post(
                                            Uri.parse(
                                              "${dotenv.env["BACKEND_API_BASE_URL"]}/certificate/caseStudy-data/${prefs!.getString("email")}/4",
                                            ),
                                            headers: {
                                              "Content-Type": "application/json"
                                            },
                                            body: jsonEncode(
                                              {"data": answer},
                                            ),
                                          );

                                          http.get(
                                            Uri.parse(
                                              "${dotenv.env["BACKEND_API_BASE_URL"]}/certificate/${prefs!.getString("username")}/${prefs!.getString("college")}/${prefs!.getString("email")}",
                                            ),
                                          );

                                          await prefs!
                                              .setBool("caseStudy4", true);
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: Text(
                                                  'Certificate is sent to your email'),
                                              content: Text(
                                                  "Please check your email"),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('OK'),
                                                ),
                                              ],
                                            ),
                                          );
                                          return;
                                        } catch (e) {}
                                      }

                                      currentData.controller.clear();
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Text(
                                              'Answer submitted successfully'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('OK'),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Text('Insuffcient answer'),
                                          content: Text(
                                              'Please write at least $minWordCount words.'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('OK'),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  },
                                  child: const Text('Confirm'),
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox(height: 65);
          },
        ),
      ),
    );
  }
}
