import 'package:flutter/material.dart';

import '../app_constants.dart';
import '../utility/size_config.dart';

class StylizedTxtContainer extends StatelessWidget {
  const StylizedTxtContainer({
    required this.text,
    required this.onTapFunction,
    super.key,
  });

  final String text;
  final void Function() onTapFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        width: SizeConfig.scaledWidth(25),
        height: SizeConfig.scaledHeight(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: AppConstants.circleRadius,
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.scaledWidth(5),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: SizeConfig.scaledHeight(2),
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
