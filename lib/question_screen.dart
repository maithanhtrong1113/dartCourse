import 'package:flutter/material.dart';
import 'package:frist_app/aswer_button.dart';
import 'package:frist_app/data/question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionScreen> {
  @override
  Widget build(context) {
    final currentQuestion = questions[0];
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Text(
              currentQuestion.text,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          AnswerButton(aswerText: currentQuestion.answers[0], onTap: () {}),
          const SizedBox(
            height: 15,
          ),
          AnswerButton(aswerText: currentQuestion.answers[1], onTap: () {}),
          const SizedBox(
            height: 15,
          ),
          AnswerButton(aswerText: currentQuestion.answers[2], onTap: () {}),
          const SizedBox(
            height: 15,
          ),
          AnswerButton(aswerText: currentQuestion.answers[3], onTap: () {}),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
