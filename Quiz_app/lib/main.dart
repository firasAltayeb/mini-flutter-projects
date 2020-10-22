import 'package:flutter/material.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  void answerQuestion() {
    print('Answer chosen');
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'what\'s your favorite animal?',
      'what\'s your favorite color?',
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Firas First App'),
        ),
        body: Column(
          children: [
            Text('Question'),
            RaisedButton(
              child: Text('answer 1'),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text('answer 2'),
              onPressed: () => print('Answer 2 is chosen'),
            ),
            RaisedButton(
              child: Text('answer 3'),
              onPressed: () {
                print('Answer 3 is chosen');
              },
            ),
          ],
        ),
      ),
    );
  }
}
