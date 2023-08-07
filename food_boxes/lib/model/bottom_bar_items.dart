import 'package:flutter/material.dart';

class BottomBarItems {
  const BottomBarItems({
    required this.labelText,
    required this.iconData,
    this.bodyBuild,
  });

  final IconData iconData;
  final Widget? bodyBuild;
  final String labelText;
}
