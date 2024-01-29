import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_learning/data/module_data.dart';
import 'package:e_learning/model/quiz_data.dart';
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
    required this.isFinal,
    required this.quizData,
    required this.moduleIndex,
    super.key,
  });

  final List moduleData;
  final String appBarTitle;
  final bool isFinal;
  final String title;
  final int moduleIndex;
  final List<QuizData> quizData;

  @override
  State<StatefulWidget> createState() {
    return _ModulePageState();
  }
}

class _ModulePageState extends State<ModulePage> {
  SharedPreferences? prefs = SharedPreferencesManager.preferences;
  TextStyle fontTheme = GoogleFonts.roboto();

  Future<void> loadQuiz(BuildContext context) async {
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
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => QuizSplash(
                      quizData: widget.quizData,
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
                    var response = await http.post(
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

                    var responseData = jsonDecode(response.body);

                    if (response.statusCode > 399) {
                      throw responseData["message"];
                    }

                    if (responseData["increment"]) {
                      await prefs!
                          .setInt("progress", (prefs!.getInt("progress")!) + 1);
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
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: currentData.image);
            } else if (currentData is HeadImage) {
              return currentData.image;
            } else if (currentData is Header) {
              return Padding(
                padding: EdgeInsets.fromLTRB(
                    30, currentData.topPadding, 30, currentData.bottomPadding),
                child: Container(
                  // height: 100,
                  // width: MediaQuery.of(context).size.width - 20,
                  color: currentData.bgColor,
                  padding: EdgeInsets.symmetric(
                      horizontal: 30, vertical: currentData.topPadding),
                  // padding: EdgeInsets.fromLTRB(
                  //     30, currentData.topPadding, 30, currentData.bottomPadding),
                  child: Text(
                    currentData.text,
                    style: GoogleFonts.merriweather().copyWith(
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
                    style: GoogleFonts.merriweather().copyWith(
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
                                  ? currentData.headerTextStyle
                                  : currentData.cellTextStyle,
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
                padding: EdgeInsets.fromLTRB(
                    30, currentData.topPadding, 30, currentData.bottomPadding),
                child: Text(
                  //◉
                  "⁍ ${currentData.text}",
                  textAlign: TextAlign.start,
                  style: fontTheme.copyWith(
                    fontSize: 14,
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
                  style: GoogleFonts.merriweather().copyWith(
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
                    Image.asset(
                      "assets/images/module1/quiz.png",
                      height: 300,
                    ),
                    Text(
                      "Now that you have gone through the course content, you will have to take a quiz which will cover all the topics of this module. You will have a total of 17 questions out of which you should get at least 11 of them right to proceed to the next section.",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {
                        loadQuiz(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(
                            color: Color.fromARGB(255, 139, 0, 232),
                            width: 2,
                          ),
                        ),
                      ),
                      child: const Text(
                        'Take Quiz',
                        style: TextStyle(
                          color: Color.fromARGB(255, 139, 0, 232),
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
            }
            return const SizedBox(height: 65);
          },
        ),
      ),
    );
  }
}
