import 'package:flutter/material.dart';
import 'package:quizapp/data/question.dart';
import 'package:quizapp/questions_summary.dart';

import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenanswer, required this.onRestart});
  final List<String> chosenanswer;
  final void Function() onRestart;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenanswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': question[i].text,
        'correct_answer': question[i].answers[0],
        'user_answer': chosenanswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summarydata = getSummaryData();
    final numTotalQuestion = question.length;
    final numcCorrect = summarydata.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You Answered $numcCorrect out of $numTotalQuestion questions correctly",
                style: GoogleFonts.lato(
                  color: Colors.purple,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              QuestionSummary(summarydata),
              const SizedBox(
                height: 30,
              ),
              TextButton.icon(
                onPressed: onRestart,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.refresh_sharp),
                label: const Text("Retry Quiz"),
              ),
            ],
          )),
    );
  }
}
