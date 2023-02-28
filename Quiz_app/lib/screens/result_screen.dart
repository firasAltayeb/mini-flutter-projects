import 'package:flutter/material.dart';

import '../app_constants.dart';
import '../models/screen_arguments.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen();

  String resultPhrase(int resultScore) {
    var resultText;
    if (resultScore == AppConstants.questions.length) {
      resultText = 'You have answered all questions correctly';
    } else {
      resultText = 'You have answered $resultScore questions correctly';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text("Result Screen"),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            resultPhrase(args.resultScore),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Lato",
              fontSize: 36,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: double.infinity,
            height: 100,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[300],
            ),
            child: Text(
              'Restart Quiz',
              style: TextStyle(
                color: Colors.lightBlue[300],
                fontSize: 20,
              ),
            ),
            onPressed: args.resetHandler,
          )
        ],
      ),
    );
  }
}
