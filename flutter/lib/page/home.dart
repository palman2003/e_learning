import 'package:e_learning/data/quiz_data.dart';
import 'package:e_learning/utils/shared_preferences_manager.dart';
import 'package:e_learning/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:e_learning/widgets/course_tile.dart';
import 'package:e_learning/data/module_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SharedPreferences? prefs = SharedPreferencesManager.preferences;

  @override
  Widget build(BuildContext context) {
    final String? username = prefs?.getString("username");

    return Scaffold(
      drawer: CustomDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 130,
            floating: false,
            pinned: true,
            scrolledUnderElevation: 0,
            title: Text(
              "Hi $username!",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            actions: [
              Container(
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
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
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
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      'Your Progress',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    height: 5,
                    margin: const EdgeInsets.fromLTRB(20, 15, 20, 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: LinearProgressIndicator(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.primary,
                        ),
                        value: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  print(index == module.length - 1);
                  return Hero(
                    tag: "courseTile$index",
                    child: CourseTile(
                      title: moduleTitle[index],
                      moduleIndex: index + 1,
                      heroTag: "courseTile$index",
                      moduleData: module[index],
                      quizData: quizDataList1,
                      isFinal: index == module.length - 1,
                    ),
                  );
                },
                childCount: module.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
