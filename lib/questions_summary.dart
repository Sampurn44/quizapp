import 'package:flutter/material.dart';
import 'package:quizapp/summary_final.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summarydata, {super.key});
  final List<Map<String, Object>> summarydata;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summarydata.map(
            (data) {
              return SummaryItem(data);
            },
          ).toList(),
        ),
      ),
    );
  }
}
