import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utility/dimension_extensions.dart';
import '../utility/shared_providers.dart';
import '../widgets/gradiant_button.dart';
import '../widgets/gradiant_container.dart';
import '../widgets/text_container.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen({super.key});

  static const routeName = "/result-screen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            GestureDetector(
              onTap: () {
                ref.read(mistakeAttemptsProvider.notifier).state = 4;
                ref.read(questionIndexProvider.notifier).state = 0;
                Navigator.of(context).pop();
              },
              child: GestureButton(textToShow: "Restart Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
