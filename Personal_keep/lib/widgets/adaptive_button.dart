import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
        : RaisedButton(
            color: Colors.purple,
            textColor: Colors.white,
            child: Text(text),
            onPressed: handler,
          );
  }
}
