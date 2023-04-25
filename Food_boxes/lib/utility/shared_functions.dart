import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/auth_screen.dart';
import '../app_constants.dart';
import 'size_config.dart';

void yesNoDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => CupertinoAlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.scaledHeight(0.75),
            ),
            child: Text(
              "Are you sure?",
              style: TextStyle(
                fontSize: SizeConfig.scaledHeight(2.5),
                fontWeight: FontWeight.w900,
                color: Colors.red,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.scaledHeight(0.5),
            ),
            child: Text(
              "Deleting your account is "
              "permanent and irreversible",
              style: TextStyle(
                fontSize: SizeConfig.scaledHeight(2.0),
              ),
            ),
          ),
        ],
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () =>
              Navigator.of(context).pushNamed(AuthenticationScreen.routeName),
          child: Text("Yes"),
        ),
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("No"),
        ),
      ],
    ),
  );
}

SnackBar messegeSnackBar(String messege, {int? timeUp = 2000}) {
  return SnackBar(
    shape: RoundedRectangleBorder(borderRadius: AppConstants.circleRadius),
    duration: Duration(milliseconds: timeUp!),
    content: Text(
      messege,
      style: TextStyle(
        fontSize: SizeConfig.scaledHeight(2.25),
      ),
      textAlign: TextAlign.center,
    ),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
      left: SizeConfig.scaledWidth(20),
      right: SizeConfig.scaledWidth(20),
      bottom: SizeConfig.scaledHeight(5),
    ),
  );
}
