import 'package:flutter/material.dart';
import 'package:quizapp/data/question.dart';
import 'package:quizapp/answer_button.dart';
//import 'package:quizapp/models/quiz_questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionCall extends StatefulWidget {
  const QuestionCall({
    super.key,
    required this.onSelected,
  });
  final void Function(String answer) onSelected;
  @override
  State<QuestionCall> createState() {
    return _QuestionCallState();
  }
}

class _QuestionCallState extends State<QuestionCall> {
  var currentQuestionindex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelected(selectedAnswer);
    setState(() {
      currentQuestionindex = currentQuestionindex + 1;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = question[currentQuestionindex];
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
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 215, 171, 244),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledanswers().map(
              (ans) {
                return AnswerButton(
                    answerText: ans,
                    ontap: () {
                      answerQuestion(ans);
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
