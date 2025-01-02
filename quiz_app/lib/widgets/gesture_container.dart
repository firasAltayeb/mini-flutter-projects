import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_constants.dart';
import '../utility/dimension_extensions.dart';

class GestureContainer extends ConsumerWidget {
  const GestureContainer({
    required this.passedFunction,
    required this.textToShow,
    super.key,
  });

  final Function passedFunction;
  final String textToShow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => passedFunction(),
      child: Container(
        height: context.percentHeight(6),
        width: context.percentWidth(50),
        decoration: BoxDecoration(
          borderRadius: AppConstants.circleRadius,
          gradient: LinearGradient(
            colors: [
              Color(0xFF883B96),
              Color(0xFF29699C),
            ],
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: context.percentWidth(5),
        ),
        alignment: Alignment.center,
        child: Text(
          textToShow,
          style: TextStyle(
            fontSize: context.percentHeight(3),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
