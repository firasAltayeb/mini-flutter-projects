import 'package:flutter/material.dart';

extension BuildContextDimension on BuildContext {
  MediaQueryData get info => MediaQuery.of(this);

  Size get windowSize => info.size;

  EdgeInsets get safeAreaPadding => info.padding;

  double get unsafeAreaHorizontal =>
      safeAreaPadding.left + safeAreaPadding.right;

  double get unsafeAreaVertical => safeAreaPadding.top + safeAreaPadding.bottom;

  double get safeWidth => windowSize.width - unsafeAreaHorizontal;

  double get safeHeight => windowSize.height - unsafeAreaVertical;

  double percentWidth(double percent) => safeWidth * (percent / 100);

  double percentHeight(double percent) => safeHeight * (percent / 100);
}
