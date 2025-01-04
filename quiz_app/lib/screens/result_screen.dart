import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/screen_arguments.dart';
import '../utility/dimension_extensions.dart';
import '../utility/shared_providers.dart';
import '../widgets/gesture_container.dart';
import '../widgets/gradiant_container.dart';
import '../widgets/text_container.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen({super.key});

  static const routeName = "/result-screen";

  String resultPhrase(int totalScore, questionList) {
    if (totalScore == questionList.length) {
      return "You have answered all questions correctly!";
    } else {
      return "You have answered $totalScore/"
          "${questionList.length} correctly";
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    final resultScreenMsg = ref.watch(resultScreenMsgProvider);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Result Screen",
          style: TextStyle(
            fontSize: context.percentHeight(2.8),
          ),
        ),
      ),
      body: GradientContainer(
        childWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextContainer(
              textToShow: resultScreenMsg,
            ),
            SizedBox(
              height: context.percentHeight(8),
            ),
            GestureContainer(
              passedFunction: args.resetHandler,
              textToShow: "Restart Quiz",
            ),
          ],
        ),
      ),
    );
  }
}
