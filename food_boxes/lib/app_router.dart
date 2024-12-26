import 'package:flutter/material.dart';

import 'screens/auth_screen.dart';
import 'screens/expanded_order_screen.dart';
import 'screens/home_screen.dart';
import 'screens/reg_screen.dart';
import 'screens/reset_pw_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AuthenticationScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => AuthenticationScreen(),
        );
      case RegisterationScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => RegisterationScreen(),
        );
      case ResetPasswordScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ResetPasswordScreen(),
        );
      case HomeScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => HomeScreen(),
        );
      case ExpandedOrderScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ExpandedOrderScreen(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => AuthenticationScreen(),
        );
    }
  }
}
