import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_constants.dart';
import '../app_icons.dart';
import '../utility/dimension_extensions.dart';
import '../utility/home_functions.dart';
import '../utility/shared_providers.dart';

class SessionTopSection extends ConsumerWidget {
  const SessionTopSection({
    required this.queueIndex,
  });

  final int queueIndex;

  Widget build(BuildContext context, WidgetRef ref) {
    final mistakeAttempts = ref.watch(mistakeAttemptsProvider);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: context.percentHeight(10),
              top: context.percentHeight(1.75),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: context.percentWidth(4),
                ),
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
                  )
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(
              top: context.percentHeight(1.5),
              right: context.percentWidth(5),
            ),
            child: Text(
              counterDisplay(queueIndex, AppConstants.questions.length),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: context.percentHeight(3),
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
