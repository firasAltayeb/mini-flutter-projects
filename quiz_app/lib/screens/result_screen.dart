import '../models/screen_arguments.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  String resultPhrase(int totalScore, questionList) {
    if (totalScore == questionList.length) {
      return "You have answered all questions correctly!";
    } else {
      return "You have answered $totalScore/"
          "${questionList.length} correctly";
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text("Result Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            resultPhrase(args.totalScore, args.quizQuestions),
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
            onPressed: args.resetHandler,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[300],
            ),
            child: Text(
              "Restart Quiz",
              style: TextStyle(
                color: Colors.lightBlue[300],
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
