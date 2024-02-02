import 'package:e_learning/model/quiz_data.dart';
import 'package:flutter/material.dart';

class AnswerPage extends StatelessWidget {
  AnswerPage({super.key, required this.quizData});
  final List<QuizData> quizData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          "Answers",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: quizData.length,
                itemBuilder: (context, index) {
                  QuizData data = quizData[index];
                  return ListTile(
                    title: Text(
                      '${index + 1} ) ${data.question}',
                    ),
                    subtitle: Text(
                      'Answer: ${data.answer}',
                      style: TextStyle(color: Colors.green),
                    ),
                  );
                },
              ),
              SizedBox(height: 40),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Continue"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
