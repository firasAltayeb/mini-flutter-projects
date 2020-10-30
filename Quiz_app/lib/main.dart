import 'package:Quiz_app/result.dart';
import 'package:flutter/material.dart';

import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s Japan capital?',
      'answers': [
        {'text': 'Tokyo', 'score': 1},
        {'text': 'Kyoto', 'score': 0},
        {'text': 'Nara', 'score': 0},
        {'text': 'Hiroshima', 'score': 0},
      ],
    },
    {
      'questionText': 'How many prefecture are there in Japan?',
      'answers': [
        {'text': '47', 'score': 1},
        {'text': '50', 'score': 0},
        {'text': '10', 'score': 0},
        {'text': '20', 'score': 0},
      ],
    },
    {
      'questionText': 'How far is tokyo from california by plane?',
      'answers': [
        {'text': '12', 'score': 1},
        {'text': '8', 'score': 0},
        {'text': '9', 'score': 0},
        {'text': '15', 'score': 0},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz, _questions),
      ),
    );
  }
}
