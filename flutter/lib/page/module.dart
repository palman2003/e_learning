import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_learning/data/module_data.dart';
import 'package:e_learning/data/quiz_data.dart';
import 'package:e_learning/model/quiz_data.dart';
import 'package:e_learning/page/quiz.dart';
import 'package:e_learning/page/quiz_splash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModulePage extends StatefulWidget {
  const ModulePage({
    required this.moduleData,
    required this.heroTag,
    required this.appBarTitle,
    required this.title,
    required this.isFinal,
    required this.quizData,
    required this.moduleIndex,
    super.key,
  });

  final List moduleData;
  final String heroTag;
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
  final headingStyle = GoogleFonts.merriweather().copyWith(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: const Color.fromARGB(255, 48, 48, 48),
    // wordSpacing: 5,
  );

  final subHeadingStyle = GoogleFonts.merriweather().copyWith(
    fontSize: 17,
    fontWeight: FontWeight.bold,
    color: const Color.fromARGB(255, 48, 48, 48),
    // wordSpacing: 5,
  );

  final bodyStyle = GoogleFonts.merriweather().copyWith(
    fontSize: 14,
    // color: Color.fromARGB(255, 64, 64, 64),
    // fontWeight: FontWeight.bold,
    color: const Color.fromARGB(255, 48, 48, 48),
    // wordSpacing: 3,
  );

  Future<void> loadQuiz(BuildContext context) async {
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
                  if (widget.isFinal) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => QuizSplash(
                          quizData: widget.quizData,
                          moduleIndex: widget.moduleIndex,
                        ),
                      ),
                    );
                  } else {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => QuizPage(
                          quizData: widget.quizData,
                          isFinal: widget.isFinal,
                          moduleIndex: widget.moduleIndex,
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Confirm'),
              )
            ],
          );
        });
  }

  int sectionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.heroTag,
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Color.fromARGB(255, 153, 0, 255),
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
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // color: Colors.white,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
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
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: currentData.image);
              } else if (currentData is HeadImage) {
                return currentData.image;
              } else if (currentData is Heading) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(30, currentData.topPadding, 30,
                      currentData.bottomPadding),
                  child: Center(
                    child: Text(
                      currentData.text,
                      style: headingStyle,
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
                  padding: EdgeInsets.fromLTRB(30, currentData.topPadding, 30,
                      currentData.bottomPadding),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          currentData.text,
                          style: subHeadingStyle,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                );
              } else if (currentData is BulletPoint) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(30, currentData.topPadding, 30,
                      currentData.bottomPadding),
                  child: Text(
                    "◉    ${currentData.text}",
                    textAlign: TextAlign.start,
                    style: bodyStyle,
                  ),
                );
              } else if (currentData is SubBulletPoint) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(currentData.leftPadding + 30,
                      currentData.topPadding, 30, currentData.bottomPadding),
                  child: Text(
                    "◉    ${currentData.text}",
                    textAlign: TextAlign.start,
                    style: bodyStyle,
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
                  child: Column(
                    children: [],
                  ),
                );
              } else if (currentData is Body) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(30, currentData.topPadding, 30,
                      currentData.bottomPadding),
                  child: Text(
                    currentData.text,
                    style: bodyStyle,
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
                      SizedBox(height: 50),
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
                  padding: EdgeInsets.symmetric(
                      vertical: currentData.verticalPadding),
                  child: CarouselSlider(
                    items: currentData.imageList
                        .map((e) => Container(
                              height: currentData.height,
                              width: 100,
                              child: Image.asset(
                                e,
                                height: currentData.height,
                                width: 100,
                                fit: BoxFit
                                    .fitWidth, // You can set the fit property as needed
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
      ),
    );
  }
}
