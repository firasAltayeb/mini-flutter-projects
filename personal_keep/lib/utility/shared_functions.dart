import 'package:flutter/material.dart';

SnackBar getSnackBar(String message, {int timeUp = 500}) {
  return SnackBar(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    content: Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    ),
    duration: Duration(milliseconds: timeUp),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
      left: 50,
      right: 50,
      bottom: 20,
    ),
  );
}
