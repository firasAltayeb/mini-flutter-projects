import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  const TextContainer({required this.textToShow, super.key});

  final String textToShow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        textToShow,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 28,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
