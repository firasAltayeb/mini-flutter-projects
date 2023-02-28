import 'package:flutter/material.dart';

import '../models/screen_arguments.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen();

  String resultPhrase(int resultScore, questions) {
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
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase(args.resultScore, args.questions),
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
              onPressed: args.resetHandler,
            ),
          )
        ],
      ),
    );
  }
}
