import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/quiz-logo.png'),
              SizedBox(height: 30),
              Text(
                'Learn Flutter the fun way!',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(height: 20),
              FilledButton(onPressed: () {}, child: const Text('Start Quiz'), ),
            ],
          ),
        ),
      ),
    ),
  );
}
