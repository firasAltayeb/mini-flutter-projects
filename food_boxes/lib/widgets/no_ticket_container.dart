import 'package:flutter/material.dart';

import '../app_constants.dart';
import '../utility/dimension_extensions.dart';

class NoTicketContainer extends StatelessWidget {
  const NoTicketContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: context.percentHeight(22),
        width: context.percentWidth(75),
        padding: EdgeInsets.symmetric(
          vertical: context.percentHeight(2),
          horizontal: context.percentWidth(10),
        ),
        margin: EdgeInsets.only(
          top: context.percentHeight(5),
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
            fontSize: context.percentHeight(2.5),
            fontWeight: FontWeight.w400,
            color: Theme.of(context).colorScheme.primary,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
