import 'package:flutter/material.dart';

import 'screens/auth_screen.dart';
import 'screens/reset_pw_screen.dart';
import 'screens/home_screen.dart';
import 'screens/reg_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => AuthScreen(),
      );
    case RegScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => RegScreen(),
      );
    case ResetPwScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => ResetPwScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => HomeScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => AuthScreen(),
      );
  }
}
