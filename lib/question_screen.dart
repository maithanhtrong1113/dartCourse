import 'package:flutter/material.dart';
import 'package:frist_app/aswer_button.dart';
import 'package:frist_app/data/question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionScreen> {
  var currenQuestionIndex = 0;
  void answerQuestionNext() {
    setState(() {
      currenQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currenQuestionIndex];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            child: Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.sansitaSwashed(
                  color: const Color.fromARGB(255, 223, 95, 138),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ...currentQuestion.getShuffedAnswers().map((answer) =>
              AnswerButton(aswerText: answer, onTap: answerQuestionNext))
        ],
      ),
    );
  }
}
