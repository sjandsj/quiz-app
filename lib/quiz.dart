import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_Screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? currentScreen;

  List<String> selectedAnswers = [];

  @override
  initState() {
    currentScreen = StartScreen(changeScreen);
    //currentScreen = QuestionsScreen(addAnswers);

    super.initState();
  }

  void addAnswers(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        currentScreen = ResultsScreen(retryCalled, selectedAnswers);
        selectedAnswers = [];
      });
    }
  }

  void retryCalled() {
    setState(() {
      currentScreen = StartScreen(changeScreen);
    });
  }

  void changeScreen() {
    setState(() {
      currentScreen = QuestionsScreen(addAnswers);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color.fromARGB(255, 85, 6, 223),
                const Color.fromARGB(255, 97, 111, 66),
              ],
            ),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}
