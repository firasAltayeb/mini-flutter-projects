import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  Answer({
    required this.selectHandler,
    required this.answerScore,
    required this.answerText,
  });

  final void Function(int) selectHandler;
  final String answerText;
  final int answerScore;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      // alignment: Alignment.center,
      child: ElevatedButton(
        child: Text(
          answerText,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () => selectHandler(answerScore),
      ),
    );
  }
}
