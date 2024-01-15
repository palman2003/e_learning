import 'package:e_learning/widgets/course_tile.dart';
import 'package:flutter/material.dart';
import 'package:e_learning/model/quiz_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final List<QuizData> quizDataList = [
    const QuizData(
      answer: "Natural Language Processing",
      options: [
        "Natural Language Processing",
        "Neural Language Programming",
        "Numeric Language Processing",
        "None of the above"
      ],
      question: "1. What does NLP stand for?",
    ),
    const QuizData(
      answer: "Python",
      options: ["Python", "Java", "C++", "JavaScript"],
      question: "2. Which programming language is commonly used for AI?",
    ),
    const QuizData(
      answer: "Test the intelligence of a machine",
      options: [
        "Test the intelligence of a machine",
        "Test the performance of a computer",
        "Test the reliability of software",
        "None of the above"
      ],
      question: "3. What is the Turing Test used for?",
    ),
    const QuizData(
      answer: "To simulate the human brain",
      options: [
        "To simulate the human brain",
        "To store large amounts of data",
        "To perform complex calculations",
        "None of the above"
      ],
      question: "4. What is the purpose of a neural network in AI?",
    ),
    const QuizData(
      answer: "NLTK",
      options: ["NLTK", "TensorFlow", "PyTorch", "Scikit-learn"],
      question:
          "5. Which library is commonly used for implementing NLP in Python?",
    ),
    const QuizData(
      answer: "Long Short-Term Memory",
      options: [
        "Long Short-Term Memory",
        "Linear System Time Model",
        "Language Structure and Text Model",
        "None of the above"
      ],
      question: "6. What does LSTM stand for in the context of AI?",
    ),
    const QuizData(
      answer: "The phase where the model learns from data",
      options: [
        "The phase where the model learns from data",
        "The phase where the model makes predictions",
        "The phase where the model is evaluated",
        "None of the above"
      ],
      question: "7. What is the 'training' phase in machine learning?",
    ),
    const QuizData(
      answer: "John McCarthy",
      options: ["Alan Turing", "Isaac Newton", "John McCarthy", "Elon Musk"],
      question: "8. Who is known as the 'father of artificial intelligence'?",
    ),
    const QuizData(
      answer: "To analyze the emotional tone in text",
      options: [
        "To classify text documents",
        "To analyze the emotional tone in text",
        "To identify parts of speech in a sentence",
        "None of the above"
      ],
      question: "9. What is the main goal of sentiment analysis in NLP?",
    ),
    const QuizData(
      answer: "Part of Speech",
      options: [
        "Part of Speech",
        "Position of Speech",
        "Processing of Sentiments",
        "None of the above"
      ],
      question: "10. What does POS tagging refer to in NLP?",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: AppBar(
          foregroundColor: const Color.fromARGB(255, 238, 238, 238),
          backgroundColor: const Color.fromARGB(255, 156, 27, 255),
          title: Text(
            "Hi Subash!",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: const Color.fromARGB(255, 238, 238, 238),
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
              margin: const EdgeInsets.only(top: 0, right: 15),
              padding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    '1240',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
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
            preferredSize: const Size.fromHeight(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    'Your Progress',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: const Color.fromARGB(255, 238, 238, 238),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 5,
                  margin: const EdgeInsets.fromLTRB(20, 15, 20, 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: const LinearProgressIndicator(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      backgroundColor: Color.fromARGB(108, 236, 190, 255),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color.fromARGB(255, 238, 238, 238),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                CourseTile(
                  quizDataList: quizDataList,
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  gradientColors: const [
                    Color.fromARGB(255, 127, 198, 255),
                    Color.fromARGB(255, 185, 144, 255),
                  ],
                  title: "Introduction",
                ),
              ],
            ),
            const Row(
              children: [
                CourseTile(
                  margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  gradientColors: [
                    Color.fromARGB(255, 255, 197, 110),
                    Color.fromARGB(255, 255, 121, 111),
                  ],
                  title: "Module 1",
                ),
                CourseTile(
                  margin: EdgeInsets.fromLTRB(10, 10, 20, 10),
                  gradientColors: [
                    Color.fromARGB(255, 133, 255, 137),
                    Color.fromARGB(255, 243, 255, 133),
                  ],
                  title: "Module 2",
                ),
              ],
            ),
            const Row(
              children: [
                CourseTile(
                  margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  gradientColors: [
                    Color.fromARGB(255, 255, 123, 123),
                    Color.fromARGB(255, 255, 170, 206),
                  ],
                  title: "Module 3",
                ),
                CourseTile(
                  margin: EdgeInsets.fromLTRB(10, 10, 20, 10),
                  gradientColors: [
                    Color.fromARGB(255, 148, 207, 255),
                    Color.fromARGB(255, 150, 255, 206),
                  ],
                  title: "Module 4",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
