import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/home_screen.dart';
import 'screens/result_screen.dart';
import 'utility/dimension_extensions.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz App",
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xFF883B96),
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: context.percentHeight(2.5),
            color: Colors.white,
          ),
        ),
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) {
          return HomeScreen();
        },
        ResultScreen.routeName: (_) {
          return ResultScreen();
        },
      },
      onUnknownRoute: (_) {
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      },
    );
  }
}
