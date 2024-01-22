import 'package:e_learning/data/module_data.dart';
import 'package:e_learning/data/quiz_data.dart';
import 'package:e_learning/page/quiz.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModulePage extends StatefulWidget {
  const ModulePage({
    required this.moduleData,
    required this.heroTag,
    required this.appBarTitle,
    required this.title,
    super.key,
  });

  final List moduleData;
  final String heroTag;
  final String appBarTitle;
  final String title;

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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          QuizPage(quizDataList: quizDataList1),
                    ),
                  );
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
          title: Text(
            widget.appBarTitle,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 64, 64, 64),
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
          color: Theme.of(context).colorScheme.background,
          height: 60,
          width: double.infinity,
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
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
              const Spacer(),
              Text("${sectionIndex + 1}/${widget.moduleData.length}"),
              const Spacer(),
              IconButton(
                onPressed: () {
                  if (!(sectionIndex == widget.moduleData.length - 1)) {
                    setState(() {
                      sectionIndex++;
                    });
                  }
                },
                icon: const Icon(Icons.arrow_forward_ios_rounded),
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
              if (currentData is ImageContent) {
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
                  padding: EdgeInsets.fromLTRB(70, currentData.topPadding, 30,
                      currentData.bottomPadding),
                  child: Text(
                    "◉    ${currentData.text}",
                    textAlign: TextAlign.start,
                    style: bodyStyle,
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
                  padding:
                      EdgeInsets.only(bottom: 20, top: currentData.topPadding),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
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
                  ),
                );
              }
              return const SizedBox(height: 60);
            },
          ),
        ),
      ),
    );
  }
}
