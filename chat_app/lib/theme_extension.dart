import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  bool get isDarkTheme => colorScheme.brightness == Brightness.dark;

  bool get isLightTheme => colorScheme.brightness == Brightness.light;

  Color get onBackground => colorScheme.onSurface;

  Color get primaryColor => colorScheme.primary;

  Color get primaryContainerColor => colorScheme.primaryContainer;

  Color get secondaryColor => colorScheme.secondary;

  Color get onSecondaryColor => colorScheme.onSecondary;
}
