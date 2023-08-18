import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utility/shared_providers.dart';
import '../utility/size_config.dart';
import '../app_constants.dart';

class ChoiceOption extends ConsumerWidget {
  const ChoiceOption({
    required this.answerText,
    required this.accuracy,
    super.key,
  });

  // ChoiceOption(int answerScore, String answerText, dynamic answerClicked) {
  //   answerText = answerText;
  //   answerScore = answerScore;
  //   answerClicked = answerClicked;
  // }

  // When a parameter is final, it must be required in the constructor
  final String answerText;
  final int accuracy;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _selectedAnswer = ref.watch(selectedAnswerProvider);
    final _isSelected = _selectedAnswer == answerText;
    return InkWell(
      onTap: () {
        ref.read(selectedAnsAccuracyProvider.notifier).state = accuracy;
        ref.read(selectedAnswerProvider.notifier).state = answerText;
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: SizeConfig.scaledHeight(0.5),
          horizontal: SizeConfig.scaledWidth(8),
        ),
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.scaledHeight(2),
          horizontal: SizeConfig.scaledWidth(2),
        ),
        decoration: BoxDecoration(
          color: _isSelected ? Colors.blue : Colors.white,
          border: Border.all(
            color: Colors.blue,
            width: 2,
          ),
          borderRadius: AppConstants.circleRadius,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              answerText,
              style: TextStyle(
                color: _isSelected ? Colors.white : Colors.black,
                fontSize: SizeConfig.scaledHeight(2.25),
              ),
            ),
            _isSelected
                ? Row(
                    children: [
                      SizedBox(
                        width: SizeConfig.scaledHeight(1.25),
                      ),
                      Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
