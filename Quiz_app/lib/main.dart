import 'package:flutter/material.dart';

import 'screens/result_screen.dart';
import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: MyHomePage(),
      title: "myfirstapp",
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/result-screen': (context) {
          // final args =
          //     ModalRoute.of(context)!.settings.arguments as List<dynamic>?;
          return ResultScreen(
              // resetHandler: args![0],
              // resultScore: args[1],
              // questions: args[2],
              );
        },
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      },
    );
  }
}
