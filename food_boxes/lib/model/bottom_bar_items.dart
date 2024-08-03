import 'package:flutter/material.dart';

class BottomBarItems {
  const BottomBarItems({
    required this.iconData,
    required this.labelText,
    this.bodyBuild,
  });

  final IconData iconData;
  final String labelText;
  final Widget? bodyBuild;
}
