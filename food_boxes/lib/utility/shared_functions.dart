import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../app_constants.dart';
import '../model/food_box.dart';
import '../widgets/stylized_txt_container.dart';
import 'box_list_notifier.dart';
import 'dimension_extensions.dart';
import 'shared_providers.dart';
import 'ticket_list_notifier.dart';

final _rng = Random();

int randomValue(int min, int max) {
  return min + _rng.nextInt(max - min);
}

void orderDetailsDialogue(
  WidgetRef ref, {
  required FoodBox ticket,
  String? orderDetails,
}) {
  final ticketList = ref.read(ticketListProvider);
  final ticketIdx = ticketList.indexOf(ticket);
  showDialog(
    context: ref.context,
    builder: (BuildContext ctx) {
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
                top: ref.context.percentHeight(2.5),
              ),
              child: Text(
                "Order Number: #${ticketIdx + 1}",
                style: TextStyle(
                  fontSize: ref.context.percentHeight(2.8),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            QrImageView(
              padding: EdgeInsets.only(
                top: ref.context.percentHeight(3.5),
                bottom: ref.context.percentHeight(3.5),
                left: ref.context.percentWidth(6),
              ),
              data: orderDetails ?? "Not available",
              version: QrVersions.auto,
              size: ref.context.percentHeight(22),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: ref.context.percentHeight(2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StylizedTxtContainer(
                    text: "Back",
                    onTapFunction: () => Navigator.of(ref.context).pop(),
                  ),
                  StylizedTxtContainer(
                    text: "Cancel",
                    onTapFunction: () async {
                      final dialogChoice = yesNoDialogue(ref.context,
                          "Canceling an order is permanent and irreversible");
                      final cancelOrder = await dialogChoice ?? false;
                      final ticketCount =
                          ticketList.where((e) => e == ticket).length;
                      if (cancelOrder) {
                        ref
                            .read(ticketListProvider.notifier)
                            .removeElement(ticketIdx);
                        if (ticketCount == 1) {
                          ref
                              .read(stackedTicketProvider.notifier)
                              .update((state) => [...state..remove(ticket)]);
                        }
                      }
                      if (ctx.mounted) {
                        if (ticketCount == 1) {
                          Navigator.popUntil(ctx, ModalRoute.withName('/'));
                        } else {
                          Navigator.pop(ctx);
                        }
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget orderSummary(WidgetRef ref, List<FoodBox> boxes) {
  final uniqueItems = Set.from(boxes);
  return Container(
    height: ref.context.percentHeight(30),
    width: double.infinity,
    decoration: BoxDecoration(
        border: Border(
      top: BorderSide(
        color: AppConstants.grey600,
        width: 2,
      ),
    )),
    child: ListView.builder(
      padding: EdgeInsets.only(
        top: ref.context.percentHeight(1.3),
      ),
      itemCount: uniqueItems.length,
      itemBuilder: (_, index) {
        final boxQuantity = ref
            .read(selectedBoxesProvider.notifier)
            .getNumberOfBoxes(uniqueItems.elementAt(index).id);
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    right: ref.context.percentWidth(1),
                  ),
                  height: ref.context.percentHeight(2.75),
                  width: ref.context.percentWidth(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppConstants.grey400,
                  ),
                  child: Text(
                    boxQuantity.toString(),
                    style: TextStyle(
                      fontSize: ref.context.percentHeight(1.75),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  width: ref.context.percentWidth(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        uniqueItems.elementAt(index).name,
                        style: TextStyle(
                          fontSize: ref.context.percentHeight(2),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        uniqueItems.elementAt(index).description,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppConstants.grey600,
                          fontSize: ref.context.percentHeight(1.75),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Text(
                    (uniqueItems.elementAt(index).price * boxQuantity)
                        .toStringAsFixed(2),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppConstants.grey800,
                      fontSize: ref.context.percentHeight(1.75),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: AppConstants.grey500,
              thickness: 1,
            )
          ],
        );
      },
    ),
  );
}

Future<bool?> yesNoDialogue(BuildContext context, String messageToDisplay,
    [Widget? childWidget]) {
  return showDialog<bool>(
    context: context,
    builder: (_) => CupertinoAlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: context.percentHeight(0.5),
            ),
            child: Text(
              "Are you sure?",
              style: TextStyle(
                fontSize: context.percentHeight(2.75),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: context.percentHeight(1.5),
            ),
            child: Text(
              messageToDisplay,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          if (childWidget != null) childWidget
        ],
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(
            "Yes",
            style: TextStyle(
              fontSize: context.percentHeight(2.25),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            "No",
            style: TextStyle(
              fontSize: context.percentHeight(2.25),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}

SnackBar messegeSnackBar(
  BuildContext context,
  String messege, {
  int? timeUp = 1000,
}) {
  return SnackBar(
    shape: RoundedRectangleBorder(borderRadius: AppConstants.circleRadius),
    duration: Duration(milliseconds: timeUp!),
    content: Text(
      messege,
      style: TextStyle(
        fontSize: context.percentHeight(2.25),
      ),
      textAlign: TextAlign.center,
    ),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
      left: context.percentWidth(20),
      right: context.percentWidth(20),
      bottom: context.percentHeight(5),
    ),
  );
}

String formatDate(DateTime time) {
  final dateFormater = DateFormat('MM/dd/yyyy');
  return dateFormater.format(time);
}

List<FoodBox> getDateBoxes(DateTime date) {
  return AppConstants.exampleBoxes
      .where((element) => element.date.day == date.day)
      .toList();
}

Future<void> deleteAccount(BuildContext context) async {
  final value = await yesNoDialogue(
        context,
        "Deleting your account is permanent and irreversible",
      ) ??
      false;
  if (value) {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      print("Failed with error code: ${e.code}");
      String snackBarMessege;
      if (e.code == "requires-recent-login") {
        snackBarMessege = "Recent login is required. "
            "Please logout and log back in.";
      } else {
        snackBarMessege = e.message!;
      }
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          messegeSnackBar(context, snackBarMessege, timeUp: 1750),
        );
      }
    } catch (e) {
      print("Caught exception: $e");
    }
  }
}
