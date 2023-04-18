import 'package:flutter/material.dart';

import 'screens/reset_pw_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/home_screen.dart';
import 'screens/reg_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => AuthScreen(),
      );
    case RegScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => RegScreen(),
      );
    case ResetPwScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => ResetPwScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => HomeScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => AuthScreen(),
      );
  }
}
