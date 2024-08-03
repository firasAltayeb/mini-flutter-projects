import 'package:flutter/material.dart';

import '../app_constants.dart';
import '../utility/size_config.dart';

class NoTicketContainer extends StatelessWidget {
  const NoTicketContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: SizeConfig.scaledHeight(22),
        width: SizeConfig.scaledWidth(75),
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.scaledHeight(2),
          horizontal: SizeConfig.scaledWidth(10),
        ),
        margin: EdgeInsets.only(
          top: SizeConfig.scaledHeight(5),
        ),
        decoration: BoxDecoration(
          borderRadius: AppConstants.circleRadius,
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          "No active tickets. Please visit the schedule page to place an order.",
          style: TextStyle(
            fontSize: SizeConfig.scaledHeight(2.5),
            fontWeight: FontWeight.w400,
            color: Theme.of(context).colorScheme.primary,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
