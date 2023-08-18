import 'package:flutter/material.dart';

import '../utility/size_config.dart';

class GestureContainer extends StatelessWidget {
  const GestureContainer({
    required this.passedFunction,
    required this.textToShow,
    super.key,
  });

  final Function passedFunction;
  final String textToShow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => passedFunction(),
      child: Container(
        height: SizeConfig.scaledHeight(6),
        width: SizeConfig.scaledWidth(50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          gradient: LinearGradient(
            colors: [
              Color(0xFF883B96),
              Color(0xFF29699C),
            ],
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.scaledWidth(5),
        ),
        alignment: Alignment.center,
        child: Text(
          textToShow,
          style: TextStyle(
            fontSize: SizeConfig.scaledHeight(3),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
