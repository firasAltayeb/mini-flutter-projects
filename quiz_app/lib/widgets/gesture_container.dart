import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../app_constants.dart';
import '../utility/home_functions.dart';
import '../utility/shared_providers.dart';
import '../utility/size_config.dart';

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
    final selectedAnswer = ref.watch(selectedAnswerProvider);
    return GestureDetector(
      onTap: () {
        if (selectedAnswer.isEmpty)
          ScaffoldMessenger.of(context).showSnackBar(
            messageSnackBar(
              "Please select a choice",
            ),
          );
        else
          passedFunction();
      },
      child: Container(
        height: SizeConfig.scaledHeight(6),
        width: SizeConfig.scaledWidth(50),
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
