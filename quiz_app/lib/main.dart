import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/utility/size_config.dart';

import 'screens/result_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    if (!SizeConfig.initialized) SizeConfig(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomeScreen(),
      title: "Quiz App",
      initialRoute: '/',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            color: Color(0xFF883B96),
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontSize: SizeConfig.scaledHeight(2.5),
              color: Colors.white,
            )),
      ),
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
