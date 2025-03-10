import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_constants.dart';
import '../app_icons.dart';
import '../utility/dimension_extensions.dart';
import '../utility/shared_providers.dart';

class SessionTopSection extends ConsumerWidget {
  const SessionTopSection({
    required this.queueIndex,
  });

  final int queueIndex;

  String counterDisplay(itemNumber) {
    return itemNumber > 9 && queueIndex + 1 < 10
        ? "0${queueIndex + 1}/$itemNumber"
        : "${queueIndex + 1}/$itemNumber";
  }

  Widget build(BuildContext context, WidgetRef ref) {
    final mistakeAttempts = ref.watch(mistakeAttemptsProvider);
    return Padding(
      padding: EdgeInsets.only(
        left: context.percentWidth(4),
        top: context.percentHeight(1.75),
        right: context.percentWidth(5),
      ),
      child: Row(
        children: [
          Text(
            "Lives: ",
            style: TextStyle(
              fontSize: context.percentHeight(2.8),
              fontWeight: FontWeight.w300,
            ),
          ),
          for (var i = 1; i <= mistakeAttempts; i++)
            Icon(
              AppIcons.heart_filled,
              size: context.percentHeight(3.3),
            ),
          Spacer(),
          Text(
            counterDisplay(AppConstants.questions.length),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: context.percentHeight(3),
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
