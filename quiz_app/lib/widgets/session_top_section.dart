import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/utility/shared_providers.dart';

import '../app_icons.dart';
import '../utility/home_functions.dart';
import '../utility/size_config.dart';

class SessionTopSection extends ConsumerWidget {
  const SessionTopSection({
    required this.finalItemIdx,
    required this.queueIndex,
  });

  final int finalItemIdx;
  final int queueIndex;

  Widget build(BuildContext context, WidgetRef ref) {
    final mistakeAttempts = ref.watch(mistakeAttemptsProvider);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: SizeConfig.scaledHeight(10),
              top: SizeConfig.scaledHeight(2.5),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: SizeConfig.scaledWidth(5),
                ),
                Text(
                  "Lives: ",
                  style: TextStyle(
                    fontSize: SizeConfig.scaledHeight(2.8),
                    fontWeight: FontWeight.w300,
                  ),
                ),
                for (var i = 1; i <= mistakeAttempts; i++)
                  Icon(
                    AppIcons.heart_filled,
                    size: SizeConfig.scaledHeight(3.3),
                  )
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(
              top: SizeConfig.scaledHeight(1.5),
              right: SizeConfig.scaledWidth(5),
            ),
            child: Text(
              counterDisplay(queueIndex, finalItemIdx),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: SizeConfig.scaledHeight(3),
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
