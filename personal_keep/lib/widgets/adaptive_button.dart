import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptiveFlatButton extends StatelessWidget {
  AdaptiveFlatButton(this.text, this.handler);

  final void Function() handler;
  final String text;

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
