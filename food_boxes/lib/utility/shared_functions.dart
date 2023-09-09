import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../app_constants.dart';
import '../screens/auth_screen.dart';
import 'size_config.dart';

void orderDetailsDialogue(
  BuildContext context, {
  required String orderNumber,
  String? orderDetails,
}) {
  showDialog(
    context: context,
    builder: (_) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: AppConstants.circleRadius,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.scaledHeight(4),
              ),
              child: Text(
                "Order Number: #$orderNumber",
                style: TextStyle(
                  fontSize: SizeConfig.scaledHeight(4),
                ),
              ),
            ),
            QrImageView(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.scaledHeight(4),
                horizontal: SizeConfig.scaledWidth(6),
              ),
              data: orderDetails ?? "Not available",
              version: QrVersions.auto,
              size: SizeConfig.scaledHeight(30),
            ),
            //TODO: cancel order when clicked
            Container(
              padding: EdgeInsets.only(
                bottom: SizeConfig.scaledHeight(3),
              ),
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[700],
                ),
                onPressed: () {},
                child: Text("Cancel Order"),
              ),
            ),
          ],
        ),
      );
    },
  );
}

//TODO: have this be a general function
void yesNoDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => CupertinoAlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.scaledHeight(0.5),
            ),
            child: Text(
              "Are you sure?",
              style: TextStyle(
                fontSize: 20,
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

SnackBar messegeSnackBar(String messege, {int? timeUp = 1000}) {
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
