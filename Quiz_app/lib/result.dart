import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;

  Result({this.resultScore});

  String get resultPhrase {
    var resultText;
    if (resultScore >= 12) {
      resultText = 'great boy';
    } else if (resultScore >= 8) {
      resultText = 'good boy';
    } else {
      resultText = 'bad boy';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        resultPhrase,
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
