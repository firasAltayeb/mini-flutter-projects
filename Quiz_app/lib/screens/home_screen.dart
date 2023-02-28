import 'package:flutter/material.dart';

import '../widgets/question.dart';
import '../widgets/answer.dart';
import '../app_constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _questionIndex = 0;
  // int _totalScore = 0;

  // void _answerQuestion(int score) {
  //   _totalScore += score;

  //   setState(() {
  //     _questionIndex = _questionIndex + 1;
  //   });
  //   print(_questionIndex);
  // }

  // void _resetQuiz() {
  //   setState(() {
  //     _questionIndex = 0;
  //     _totalScore = 0;
  //   });
  // }

  void answerClicked() {
    setState(() {
      if (_questionIndex < AppConstants.questions.length - 1) {
        _questionIndex++;
      } else {
        Navigator.of(context).pushNamed("/result-screen");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> answers =
        AppConstants.questions[_questionIndex]["answers"];
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox(
          width: double.infinity,
          child: Text(
            "Starter App",
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Question(
            questionText: AppConstants.questions[_questionIndex]["text"],
          ),
          const SizedBox(
            height: 20,
          ),
          // Answer(answerText: AppConstants.questions[0]["answers"][0]["ans"])
          // ... is called the spread operator and splits
          // a list of widgets into individual widgets
          ...answers
              .map((e) => Answer(
                    answerText: e["ans"],
                    selectHandler: answerClicked,
                  ))
              .toList(),
        ],
      ),
    );
  }
}
