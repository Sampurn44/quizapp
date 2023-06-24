import 'package:flutter/material.dart';

import 'package:quizapp/home.dart';

class Maincall extends StatefulWidget {
  
}

class _MaincallState extends State<Maincall> {
  @override
  Widget build(context) {
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
          child: const StartScreen(),
        ),
      ),
    ),
  }
}
