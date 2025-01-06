import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_constants.dart';
import '../screens/result_screen.dart';
import '../utility/dimension_extensions.dart';
import '../utility/enum_land.dart';
import '../utility/home_functions.dart';
import '../utility/shared_providers.dart';
import '../widgets/choice_option.dart';
import '../widgets/gradiant_button.dart';
import '../widgets/gradiant_container.dart';
import '../widgets/session_top_section.dart';
import '../widgets/text_container.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  static const routeName = "/";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    initializeProviders(ref);
    super.initState();
  }

  void _answerClicked(int questionIndex) async {
    final mistakeAttempts = ref.read(mistakeAttemptsProvider);
    final accuracy = ref.read(selectedAnsAccuracyProvider);
    await stopPlayingSound(ref);
    if (accuracy == AppConstants.correctAnswerAccuracy) {
      await playSoundEffect(ref, SoundEffect.correct);
      if (questionIndex < AppConstants.questions.length - 1) {
        ref.read(questionIndexProvider.notifier).update((state) => state + 1);
      } else {
        final msg = 'Congratulations!! You are trivia master!!';
        ref.read(resultScreenMsgProvider.notifier).state = msg;
        Navigator.of(context).pushNamed(ResultScreen.routeName);
      }
    } else if (accuracy == AppConstants.incorrectAnswerAccuracy) {
      await playSoundEffect(ref, SoundEffect.incorrect);
      ref.read(mistakeAttemptsProvider.notifier).state -= 1;
      if (mistakeAttempts <= 1) {
        final msg = 'You have ran out of lifes. Try again next time';
        ref.read(resultScreenMsgProvider.notifier).state = msg;
        Navigator.of(context).pushNamed(ResultScreen.routeName);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        messageSnackBar(context, "Please select a choice"),
      );
    }
    ref.read(selectedAnsAccuracyProvider.notifier).state = -1;
    ref.read(selectedAnsTextProvider.notifier).state = '';
  }

  @override
  Widget build(BuildContext context) {
    final questionIndex = ref.watch(questionIndexProvider);
    final currentQuestion = AppConstants.questions[questionIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Question #${questionIndex + 1}",
          style: TextStyle(
            fontSize: context.percentHeight(2.8),
          ),
        ),
      ),
      body: GradientContainer(
        containerWidth: double.infinity,
        childWidget: Column(
          children: [
            SessionTopSection(
              queueIndex: questionIndex,
            ),
            Spacer(),
            TextContainer(textToShow: currentQuestion.qusTxt),
            Spacer(),
            ...currentQuestion.ansList
                .map((e) => ChoiceOption(
                      answerText: e.ansTxt,
                      accuracy: e.accuracy,
                    ))
                .toList(),
            Spacer(),
            GestureDetector(
              onTap: () => _answerClicked(questionIndex),
              child: GestureButton(textToShow: "Submit"),
            ),
            Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
