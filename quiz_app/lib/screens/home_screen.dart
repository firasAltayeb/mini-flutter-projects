import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/app_constants.dart';
import 'package:quiz_app/utility/enum_land.dart';

import '../models/question_model.dart';
import '../models/screen_arguments.dart';
import '../screens/result_screen.dart';
import '../utility/home_functions.dart';
import '../utility/shared_providers.dart';
import '../utility/size_config.dart';
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
  // late final means that the data will be intialized eventually,
  // and once it is initalized, it can never change.
  late final List<QuestionModel> _questionList;
  int _questionIdx = 0;
  int _totalScore = 0;

// initState() is called when the widget is first created.
// initState() is never called again afterwards.
  @override
  void initState() {
    _questionList = AppConstants.questions;
    initializeProviders(ref);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!SizeConfig.initialized) {
      SizeConfig(context);
    }
    super.didChangeDependencies();
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
        quizQuestions: _questionList,
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
      if (_questionIdx < _questionList.length - 1) {
        ref.read(selectedAnswerProvider.notifier).state = '';
        setState(() => _questionIdx++);
      } else {
        _navToResultScrn('Congratulations!! You are trivia master!!');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // final List<Map<String, dynamic>> answers =
    //     AppConstants.questions[_questionIdx]["answers"];
    final QuestionModel? currentQuestion =
        _questionList.length <= 0 ? null : _questionList[_questionIdx];
    return Scaffold(
      appBar: AppBar(
        title: Text("Question #${_questionIdx + 1}"),
      ),
      body: GradientContainer(
        containerWidth: double.infinity,
        childWidget: Column(
          children: [
            SessionTopSection(
              finalItemIdx: _questionList.length,
              queueIndex: _questionIdx,
            ),
            // Question(
            //   questionText: AppConstants.questions[_questionIdx]["text"],
            // ),
            if (_questionList.length <= 0)
              CircularProgressIndicator(
                color: Colors.black,
                strokeWidth: 4,
              ),
            if (_questionList.length != 0) ...[
              TextContainer(textToShow: currentQuestion!.qusTxt),
              Spacer(),
              // ... is called the spread operator and splits
              // a list of widgets into individual widgets
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
            ],
            Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
