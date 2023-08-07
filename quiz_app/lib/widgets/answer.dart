import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({
    required this.selectHandler,
    required this.answerText,
    required this.accuracy,
    super.key,
  });

  final void Function(int) selectHandler;
  final String answerText;
  final int accuracy;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[300],
        ),
        onPressed: () => selectHandler(accuracy),
        child: Text(
          answerText,
          style: TextStyle(
            color: Colors.lightBlue[300],
          ),
        ),
      ),
    );
  }
}
