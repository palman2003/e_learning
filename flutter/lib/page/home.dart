import 'package:e_learning/data/quiz_data.dart';
import 'package:e_learning/page/intro.dart';
import 'package:e_learning/page/login.dart';
import 'package:e_learning/page/module.dart';
import 'package:e_learning/page/profile.dart';
import 'package:e_learning/utils/shared_preferences_manager.dart';
import 'package:e_learning/widgets/image_progress.dart';
import 'package:e_learning/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:e_learning/data/module_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.isFirstlogin});
  final bool isFirstlogin;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SharedPreferences? prefs = SharedPreferencesManager.preferences;
  final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  final GlobalKey _three = GlobalKey();
  final GlobalKey _four = GlobalKey();
  final GlobalKey _five = GlobalKey();
  final GlobalKey _six = GlobalKey();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  late int progress = prefs!.getInt("progress")!;

  final List<Color> mainColors = [
    const Color.fromARGB(255, 147, 232, 146),
    const Color.fromARGB(255, 255, 182, 199),
    const Color.fromARGB(255, 255, 242, 146),
    const Color.fromARGB(255, 193, 193, 255),
    const Color.fromARGB(255, 201, 248, 254),
    const Color.fromARGB(255, 255, 237, 237),
    const Color.fromARGB(255, 254, 241, 222),
    const Color.fromARGB(255, 186, 239, 229),
  ];

  final List<Color> boxColors = [
    const Color.fromARGB(255, 139, 216, 137),
    const Color.fromARGB(255, 255, 167, 188),
    const Color.fromARGB(255, 254, 238, 97),
    const Color.fromARGB(255, 178, 175, 254),
    const Color.fromARGB(255, 164, 241, 251),
    const Color.fromARGB(255, 255, 211, 212),
    const Color.fromARGB(255, 255, 225, 184),
    const Color.fromARGB(255, 109, 214, 198),
  ];

  @override
  void initState() {
    super.initState();
    if (widget.isFirstlogin) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ShowCaseWidget.of(context)
            .startShowCase([_one, _two, _three, _four, _five, _six]);
      });
    }
  }

  void introTap() async {
    dynamic data = await Navigator.of(context).push<int>(
      MaterialPageRoute(
        builder: (context) => IntroPage(),
      ),
    );
    if (data is int) {
      setState(() {
        progress = data;
      });
    }
  }

  void contentTap() async {
    Navigator.push<int>(
      context,
      MaterialPageRoute(
        builder: ((context) => ModulePage(
            moduleData: module[0],
            heroTag: "heroTag",
            appBarTitle: "Module 1",
            title: "Hello",
            isFinal: false,
            quizData: quizDataList1,
            moduleIndex: 1)),
      ),
    );
  }

  void quiz1Tap() {}
  void quiz2Tap() {}
  void caseStudyTap() {}

  @override
  Widget build(BuildContext context) {
    final String? username = prefs?.getString("username");
    int progress = prefs!.getInt("progress")!;

    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      appBar: AppBar(
        leading: Showcase(
          title: 'Drawer',
          description: 'View your profile and logout via this',
          key: _one,
          child: IconButton(
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
              icon: Icon(Icons.menu)),
        ),
        backgroundColor: Color.fromARGB(255, 153, 0, 255),
        foregroundColor: Colors.white,
        title: Text(
          "Hi $username!",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
        actions: [
          Showcase(
            title: 'Credits',
            description: 'Complete quizzes and modules to gain credits',
            key: _three,
            child: Container(
              margin: const EdgeInsets.only(top: 0, right: 15),
              padding: const EdgeInsets.fromLTRB(15, 8, 5, 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    '1240',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                  ),
                  const SizedBox(width: 5),
                  Image.asset(
                    'assets/images/appbar_icon.png',
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  'Your Progress',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 100,
                height: 5,
                margin: const EdgeInsets.fromLTRB(20, 15, 20, 20),
                child: Showcase(
                  title: "Progress",
                  description: "Keep track of your progress here",
                  key: _two,
                  child: ClipRRect(
                    child: LinearProgressIndicator(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      value: progress / 5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: introTap,
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: mainColors[0],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 1),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 0, 50, 5),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                          ),
                          color: boxColors[0],
                        ),
                        child: Text(
                          "01",
                          style: GoogleFonts.playfairDisplay().copyWith(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 37, 37, 37),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 45,
                        padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                          color: Colors.white,
                        ),
                        child: Text(
                          "Introduction",
                          maxLines: 2,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: contentTap,
                      child: Showcase(
                        title: 'Content',
                        description: 'Learn about Shelf Analytics here',
                        key: _four,
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: mainColors[1],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 1),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(),
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 50, 5),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                  ),
                                  color: boxColors[1],
                                ),
                                child: Text(
                                  "02",
                                  style: GoogleFonts.playfairDisplay().copyWith(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 37, 37, 37),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 45,
                                padding:
                                    const EdgeInsets.fromLTRB(15, 5, 15, 5),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Text(
                                  "Content",
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: GestureDetector(
                      onTap: quiz1Tap,
                      child: Showcase(
                        title: 'Quiz',
                        description: 'Take Quiz here',
                        key: _five,
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 1),
                                blurRadius: 5,
                              ),
                            ],
                            color: mainColors[2],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(),
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 50, 5),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                  ),
                                  color: boxColors[2],
                                ),
                                child: Text(
                                  "03",
                                  style: GoogleFonts.playfairDisplay().copyWith(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 37, 37, 37),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 45,
                                padding:
                                    const EdgeInsets.fromLTRB(15, 5, 15, 5),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Text(
                                  "Quiz",
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Showcase(
                child: ImageProgress(progress: 0.25),
                title: 'Upload Progerss',
                description: 'Keep Track of your image upload progress here',
                key: _six,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: quiz2Tap,
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: mainColors[3],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 1),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 0, 50, 5),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                ),
                                color: boxColors[3],
                              ),
                              child: Text(
                                "04",
                                style: GoogleFonts.playfairDisplay().copyWith(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 37, 37, 37),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 45,
                              padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                ),
                                color: Colors.white,
                              ),
                              child: Text(
                                "Quiz 2",
                                maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: GestureDetector(
                      onTap: caseStudyTap,
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 1),
                              blurRadius: 5,
                            ),
                          ],
                          color: mainColors[4],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 0, 50, 5),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                ),
                                color: boxColors[4],
                              ),
                              child: Text(
                                "05",
                                style: GoogleFonts.playfairDisplay().copyWith(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 37, 37, 37),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 45,
                              padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                ),
                                color: Colors.white,
                              ),
                              child: Text(
                                "Case Study",
                                maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
