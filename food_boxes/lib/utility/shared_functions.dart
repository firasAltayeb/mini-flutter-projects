import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../app_constants.dart';
import 'size_config.dart';
import 'dart:math';

final _rng = Random();

int randomValue(int min, int max) {
  return min + _rng.nextInt(max - min);
}

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
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Cancel Order",
                  style: TextStyle(
                    fontSize: SizeConfig.scaledHeight(2.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Future<bool?> yesNoDialog(BuildContext context, String msgToDisplay) async {
  return showDialog<bool>(
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
                fontSize: SizeConfig.scaledHeight(2.75),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.scaledHeight(1.5),
            ),
            child: Text(
              msgToDisplay,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(
            "Yes",
            style: TextStyle(
              fontSize: SizeConfig.scaledHeight(2.25),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            "No",
            style: TextStyle(
              fontSize: SizeConfig.scaledHeight(2.25),
              fontWeight: FontWeight.w600,
            ),
          ),
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

void deleteAccount(BuildContext context) async {
  bool? value = await yesNoDialog(
        context,
        "Deleting your account is permanent and irreversible",
      ) ??
      false;
  if (value) {
    try {
      await FirebaseAuth.instance.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      String snackBarMsg;
      if (e.code == 'requires-recent-login') {
        snackBarMsg = 'Recent login is required. '
            'Please logout and log back in.';
      } else {
        snackBarMsg = e.message!;
      }
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          messegeSnackBar(snackBarMsg, timeUp: 2000),
        );
      }
    } catch (e) {
      print("Caught exception: $e");
    }
  }
}
