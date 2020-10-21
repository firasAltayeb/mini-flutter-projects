import 'package:flutter/material.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
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
              onPressed: null,
            ),
            RaisedButton(
              child: Text('answer 2'),
              onPressed: null,
            ),
            RaisedButton(
              child: Text('answer 3'),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}
