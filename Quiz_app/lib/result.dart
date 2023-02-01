import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  final List<Map<String, Object>> questions;

  Result(this.resultScore, this.resetHandler, this.questions);

  String get resultPhrase {
    var resultText;
    if (resultScore == questions.length) {
      resultText = 'You have answered all questions correctly';
    } else if (resultScore >= 2) {
      resultText = 'You have answered ' + resultScore.toString() + ' questions';
    } else {
      resultText = 'You have answered ' + resultScore.toString() + ' question';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 100),
          SizedBox(
            width: double.infinity,
            height: 100,
            child: ElevatedButton(
              child: Text(
                'Restart Quiz',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: resetHandler,
            ),
          )
        ],
      ),
    );
  }
}
