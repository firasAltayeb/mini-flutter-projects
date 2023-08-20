import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'screens/result_screen.dart';
import 'screens/home_screen.dart';
import 'utility/home_functions.dart';
import 'utility/shared_providers.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.read(questionListProvider).isEmpty) {
      Future.delayed(Duration(milliseconds: 10), () {
        ref.read(questionListProvider.notifier).state = getQuizQuestions();
      });
    }
    return MaterialApp(
      // home: MyHomePage(),
      title: "myfirstapp",
      initialRoute: '/',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xFF883B96),
        ),
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
