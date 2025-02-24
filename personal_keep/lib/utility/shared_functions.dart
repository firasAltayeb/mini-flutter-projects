import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showSnackBar(String message, {timeup = Toast.LENGTH_SHORT}) {
  Fluttertoast.showToast(
    msg: message,
    gravity: ToastGravity.BOTTOM,
    textColor: Colors.white,
    timeInSecForIosWeb: 2,
    toastLength: timeup,
  );
}
