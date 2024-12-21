import 'package:flutter/material.dart';

import '../utility/dimension_extensions.dart';

class TextContainer extends StatelessWidget {
  const TextContainer({required this.textToShow, super.key});

  final String textToShow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.percentWidth(3.5),
      ),
      width: double.infinity,
      child: Text(
        textToShow,
        style: TextStyle(
          fontSize: context.percentHeight(2.5),
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
