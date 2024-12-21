import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_constants.dart';
import '../utility/dimension_extensions.dart';
import '../utility/home_functions.dart';
import '../utility/shared_providers.dart';

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
            messageSnackBar(context, "Please select a choice"),
          );
        else
          passedFunction();
      },
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
