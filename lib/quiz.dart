import 'package:flutter/material.dart';
import 'package:quizapp/quiz_screen.dart';
import 'package:quizapp/home.dart';

class Maincall extends StatefulWidget {
  const Maincall({super.key});
  @override
  State<Maincall> createState() {
    return _MaincallState();
  }
}

class _MaincallState extends State<Maincall> {
  var activeState = 'startscreen';
  void switchScreen() {
    setState(() {
      activeState = 'questionscreen';
    });
  }

  @override
  Widget build(context) {
    var screen = activeState == 'startscreen'
        ? StartScreen(switchScreen)
        : const QuestionCall();
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
