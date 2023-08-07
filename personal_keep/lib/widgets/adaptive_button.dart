import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptiveFlatButton extends StatelessWidget {
  final String text;
  final Function handler;

  AdaptiveFlatButton(this.text, this.handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            color: Colors.purple,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: handler,
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
            ),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: handler,
          );
  }
}
