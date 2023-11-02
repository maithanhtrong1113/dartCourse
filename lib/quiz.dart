import 'package:flutter/material.dart';
import 'package:frist_app/question_screen.dart';
import 'package:frist_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 108, 195, 242),
            ),
            child: activeScreen == 'start-screen'
                ? StartScreen(switchScreen)
                : const QuestionScreen(),
          ),
        ),
      ),
    );
  }
}
