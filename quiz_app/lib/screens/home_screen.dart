import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_constants.dart';
import '../models/screen_arguments.dart';
import '../screens/result_screen.dart';
import '../utility/dimension_extensions.dart';
import '../utility/enum_land.dart';
import '../utility/home_functions.dart';
import '../utility/shared_providers.dart';
import '../widgets/choice_option.dart';
import '../widgets/gesture_container.dart';
import '../widgets/gradiant_container.dart';
import '../widgets/session_top_section.dart';
import '../widgets/text_container.dart';
// import '../app_constants.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _questionIdx = 0;
  int _totalScore = 0;

  @override
  void initState() {
    initializeProviders(ref);
    super.initState();
  }

  void _resetQuiz() {
    ref.read(mistakeAttemptsProvider.notifier).state = 4;
    ref.read(selectedAnswerProvider.notifier).state = '';
    setState(() {
      _questionIdx = 0;
      _totalScore = 0;
    });
    Navigator.of(context).pop();
  }

  void _navToResultScrn(String msg) {
    ref.read(resultScreenMsgProvider.notifier).state = msg;
    Navigator.of(context).pushNamed(
      ResultScreen.routeName,
      arguments: ScreenArguments(
        resetHandler: _resetQuiz,
        totalScore: _totalScore,
      ),
    );
  }

  void _answerClicked() async {
    final mistakeAttempts = ref.read(mistakeAttemptsProvider);
    final accuracy = ref.read(selectedAnsAccuracyProvider);
    await stopPlayingSound(ref);
    if (accuracy == 0) {
      await playSoundEffect(ref, SoundEffect.incorrect);
      ref.read(mistakeAttemptsProvider.notifier).state -= 1;
      if (mistakeAttempts <= 1) {
        _navToResultScrn('You have ran out of lifes. Try again next time');
      }
    } else {
      await playSoundEffect(ref, SoundEffect.correct);
      if (_questionIdx < AppConstants.questions.length - 1) {
        ref.read(selectedAnswerProvider.notifier).state = '';
        setState(() => _questionIdx++);
      } else {
        _navToResultScrn('Congratulations!! You are trivia master!!');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = AppConstants.questions[_questionIdx];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Question #${_questionIdx + 1}",
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
              queueIndex: _questionIdx,
            ),
            TextContainer(textToShow: currentQuestion.qusTxt),
            Spacer(),
            ...currentQuestion.ansList
                .map((e) => ChoiceOption(
                      answerText: e.ansTxt,
                      accuracy: e.accuracy,
                    ))
                .toList(),
            Spacer(),
            GestureContainer(
              passedFunction: _answerClicked,
              textToShow: "Submit",
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
