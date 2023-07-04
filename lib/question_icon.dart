import 'package:flutter/material.dart';

class QuestionIcon extends StatelessWidget {
  const QuestionIcon(
      {super.key, required this.index, required this.correctques});
  final int index;
  final bool correctques;
  @override
  Widget build(BuildContext context) {
    final question = index + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: correctques
            ? const Color.fromARGB(255, 11, 155, 138)
            : const Color.fromARGB(192, 237, 125, 125),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        question.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
