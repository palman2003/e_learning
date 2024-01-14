import 'package:e_learning/widgets/course_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(170),
        child: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 187, 0, 255),
          title: Text(
            "Hi Subash!",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(top: 0, right: 10),
              padding: const EdgeInsets.fromLTRB(20, 8, 10, 8),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    '1240',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(width: 5),
                  Image.asset(
                    'assets/images/appbar_icon.png',
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    'Your Progress',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 20,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: const LinearProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color.fromARGB(255, 185, 144, 255),
                      ),
                      value: 0.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: const Drawer(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            CourseTile(
              gradientColors: [
                Color.fromARGB(255, 127, 198, 255),
                Color.fromARGB(255, 185, 144, 255),
              ],
              title: "Introduction",
            ),
            CourseTile(
              gradientColors: [
                Color.fromARGB(255, 255, 197, 110),
                Color.fromARGB(255, 255, 121, 111),
              ],
              title: "Section 1",
            ),
            CourseTile(
              gradientColors: [
                Color.fromARGB(255, 133, 255, 137),
                Color.fromARGB(255, 243, 255, 133),
              ],
              title: "Section 2",
            ),
            CourseTile(
              gradientColors: [
                Color.fromARGB(255, 255, 123, 123),
                Color.fromARGB(255, 255, 170, 206),
              ],
              title: "Section 3",
            ),
            CourseTile(
              gradientColors: [
                Color.fromARGB(255, 148, 207, 255),
                Color.fromARGB(255, 150, 255, 206),
              ],
              title: "Section 4",
            ),
          ],
        ),
      ),
    );
  }
}
