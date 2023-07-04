import 'package:flutter/material.dart';
import 'package:quizapp/quiz_screen.dart';
import 'package:quizapp/home.dart';
import 'package:quizapp/data/question.dart';
import 'package:quizapp/results_screen.dart';

class Maincall extends StatefulWidget {
  const Maincall({super.key});
  @override
  State<Maincall> createState() {
    return _MaincallState();
  }
}

class _MaincallState extends State<Maincall> {
  List<String> selectedans = [];
  var activeState = 'startscreen';
  void switchScreen() {
    setState(() {
      activeState = 'questionscreen';
    });
  }

  void onRestart() {
    setState(() {
      selectedans = [];
      activeState = 'startscreen';
    });
  }

  void chooseAnswer(String answer) {
    selectedans.add(answer);

    if (selectedans.length == question.length) {
      setState(() {
        // selectedans = [];
        activeState = 'resultscreen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screen = StartScreen(switchScreen);
    if (activeState == 'questionscreen') {
      screen = QuestionCall(
        onSelected: chooseAnswer,
      );
    }
    if (activeState == 'resultscreen') {
      screen = ResultScreen(
        chosenanswer: selectedans,
        onRestart: onRestart,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 109, 10, 221),
                Color.fromARGB(255, 0, 0, 0),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screen,
        ),
      ),
    );
  }
}
