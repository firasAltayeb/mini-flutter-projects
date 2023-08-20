import 'package:flutter/material.dart';

import '../utility/size_config.dart';

class TextContainer extends StatelessWidget {
  const TextContainer({required this.textToShow, super.key});

  final String textToShow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.scaledWidth(2.75),
      ),
      width: double.infinity,
      child: Text(
        textToShow,
        style: TextStyle(
          fontSize: SizeConfig.scaledHeight(3.5),
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
