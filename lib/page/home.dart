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
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      drawer: const Drawer(),
      body: const Column(
        children: [
          Row(
            children: [
              CourseTile(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                gradientColors: [
                  Color.fromARGB(255, 127, 198, 255),
                  Color.fromARGB(255, 185, 144, 255),
                ],
                title: "Introduction",
                width: double.infinity,
              ),
            ],
          ),
          Row(
            children: [
              CourseTile(
                margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                gradientColors: [
                  Color.fromARGB(255, 255, 197, 110),
                  Color.fromARGB(255, 255, 121, 111),
                ],
                title: "Section 1",
                width: 175,
              ),
              CourseTile(
                margin: EdgeInsets.fromLTRB(10, 10, 20, 10),
                gradientColors: [
                  Color.fromARGB(255, 133, 255, 137),
                  Color.fromARGB(255, 243, 255, 133),
                ],
                title: "Section 2",
                width: 175,
              ),
            ],
          ),
          Row(
            children: [
              CourseTile(
                margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                gradientColors: [
                  Color.fromARGB(255, 255, 123, 123),
                  Color.fromARGB(255, 255, 170, 206),
                ],
                title: "Section 3",
                width: 175,
              ),
              CourseTile(
                margin: EdgeInsets.fromLTRB(10, 10, 20, 10),
                gradientColors: [
                  Color.fromARGB(255, 148, 207, 255),
                  Color.fromARGB(255, 150, 255, 206),
                ],
                title: "Section 4",
                width: 175,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
