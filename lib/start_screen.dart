import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
   const StartScreen(this.changeScreen, {super.key});

  final void Function() changeScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          SizedBox(height: 30),
          Text(
            'Learn Flutter the fun way!',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: changeScreen,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.amber),
            icon: const Icon(Icons.arrow_circle_right_sharp),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
