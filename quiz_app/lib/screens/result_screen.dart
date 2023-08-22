import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../utility/shared_providers.dart';
import '../models/screen_arguments.dart';
import '../utility/size_config.dart';
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
    final resultScreenMsg = ref.read(resultScreenMsgProvider);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text("Result Screen"),
      ),
      body: GradientContainer(
        childWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextContainer(
              textToShow: resultScreenMsg,
              // textToShow: resultPhrase(args.totalScore, args.quizQuestions),
            ),
            SizedBox(
              width: double.infinity,
              height: SizeConfig.scaledHeight(5),
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
