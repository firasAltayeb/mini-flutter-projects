import '../models/screen_arguments.dart';
import 'package:flutter/material.dart';

import '../widgets/gesture_container.dart';
import '../widgets/gradiant_container.dart';
import '../widgets/text_container.dart';

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
      body: GradientContainer(
        childWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextContainer(
              textToShow: resultPhrase(args.totalScore, args.quizQuestions),
            ),
            SizedBox(
              width: double.infinity,
              height: 100,
            ),
            GestureContainer(
              passedFunction: args.resetHandler,
              textToShow: "Restart Quiz",
            ),
          ],
        ),
      ),
    );
  }
}
