import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_constants.dart';
import '../utility/dimension_extensions.dart';
import '../utility/shared_providers.dart';

class ChoiceOption extends ConsumerWidget {
  const ChoiceOption({
    required this.answerText,
    required this.accuracy,
    super.key,
  });

  final String answerText;
  final int accuracy;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAnswer = ref.watch(selectedAnswerProvider);
    final isSelected = selectedAnswer == answerText;
    return GestureDetector(
      onTap: () {
        ref.read(selectedAnsAccuracyProvider.notifier).state = accuracy;
        ref.read(selectedAnswerProvider.notifier).state = answerText;
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: context.percentHeight(0.5),
          horizontal: context.percentWidth(8),
        ),
        padding: EdgeInsets.all(context.percentHeight(2)),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: AppConstants.circleRadius,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              answerText,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: context.percentHeight(2.25),
              ),
            ),
            if (isSelected)
              Padding(
                padding: EdgeInsets.only(
                  left: context.percentWidth(5),
                ),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: context.percentHeight(2.5),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
