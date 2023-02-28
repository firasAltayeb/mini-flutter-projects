import 'package:flutter/material.dart';

import '../models/screen_arguments.dart';
import '../widgets/question.dart';
import '../widgets/answer.dart';
import '../app_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _questionIndex = 0;
  int _totalScore = 0;

  void _resetQuiz() {
    Navigator.of(context).pop();
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void answerClicked(int score) {
    _totalScore += score;
    setState(() {
      if (_questionIndex < AppConstants.questions.length - 1) {
        _questionIndex++;
      } else {
        Navigator.of(context).pushNamed(
          "/result-screen",
          arguments: ScreenArguments(
            resetHandler: _resetQuiz,
            resultScore: _totalScore,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> answers =
        AppConstants.questions[_questionIndex]["answers"];
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home Screen"),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Question(
            questionText: AppConstants.questions[_questionIndex]["text"],
          ),
          const SizedBox(
            height: 20,
          ),
          // Answer(answerText: AppConstants.questions[0]["answers"][0]["ans"])
          // ... is called the spread operator and it splits
          // a list of widgets into individual widgets
          ...answers
              .map((e) => Answer(
                    answerText: e["ans"],
                    answerScore: e["score"],
                    selectHandler: answerClicked,
                  ))
              .toList(),
        ],
      ),
    );
  }
}
