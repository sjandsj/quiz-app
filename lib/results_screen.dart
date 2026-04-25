import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.retryCalled, this.answersList, {super.key});

  final void Function() retryCalled;
  final List<String> answersList;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < answersList.length; i++) {
      summary.add({
        'questionIndex': i,
        'question': questions[i].text,
        'correctAnswer': questions[i].answers[0],
        'userSlectedAnswer': answersList[i],
      });
    }

    print(summary);
    return summary;
  }

  @override
  Widget build(context) {
    var summaeryData = getSummary();
    var totalNoOfQuestions = questions.length;
    var correctNumberOfQuestions = summaeryData.where((data) {
      return data['correctAnswer'] == data['userSlectedAnswer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You answered $correctNumberOfQuestions out of $totalNoOfQuestions questions correctly',
            ),
            SizedBox(height: 30),
            QuestionsSummary(summaeryData),
            SizedBox(height: 30),
            TextButton(onPressed: retryCalled, child: Text('Retry')),
          ],
        ),
      ),
    );
  }
}
