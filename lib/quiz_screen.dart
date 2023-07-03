import 'package:flutter/material.dart';
import 'package:quizapp/data/question.dart';
import 'package:quizapp/answer_button.dart';
//import 'package:quizapp/models/quiz_questions.dart';

class QuestionCall extends StatefulWidget {
  const QuestionCall({super.key});
  @override
  State<QuestionCall> createState() {
    return _QuestionCallState();
  }
}

class _QuestionCallState extends State<QuestionCall> {
  @override
  Widget build(context) {
    final currentQuestion = question[0];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledanswers().map(
              (ans) {
                return AnswerButton(answerText: ans, ontap: () {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
