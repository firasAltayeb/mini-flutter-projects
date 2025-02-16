import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveButton extends StatelessWidget {
  const AdaptiveButton({
    required this.text,
    required this.handler,
    super.key,
  });

  final VoidCallback handler;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 225,
      child: Platform.isIOS
          ? CupertinoButton(
              onPressed: handler,
              color: Colors.purple,
              padding: EdgeInsets.zero,
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          : ElevatedButton(
              onPressed: handler,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: Colors.purple,
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
    );
  }
}
