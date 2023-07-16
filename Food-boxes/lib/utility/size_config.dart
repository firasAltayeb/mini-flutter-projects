import 'package:flutter/material.dart';

class SizeConfig {
  static late final MediaQueryData _mediaQueryData;
  static late final double _unsafeAreaHorizontal;
  static late final double _unsafeAreaVertical;
  static late final double screenWidth;
  static late final double screenHeight;
  static late final double safeWidth;
  static late final double safeHeight;
  static bool initlized = false;

  void int(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    _unsafeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _unsafeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

    safeWidth = screenWidth - _unsafeAreaHorizontal;
    safeHeight = screenHeight - _unsafeAreaVertical;
    initlized = true;
  }

  static double scaledWidth(double percentage) {
    return safeWidth * (percentage / 100);
  }

  static double scaledHeight(double percentage) {
    return safeHeight * (percentage / 100);
  }
}
