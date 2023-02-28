import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  Answer({
    required this.selectHandler,
    required this.answerText,
  });

  final void Function() selectHandler;
  final String answerText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(
          answerText,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: selectHandler,
      ),
    );
  }
}
