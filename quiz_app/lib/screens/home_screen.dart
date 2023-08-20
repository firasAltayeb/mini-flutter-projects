import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../screens/result_screen.dart';
import '../models/question_model.dart';
import '../utility/shared_providers.dart';
import '../models/screen_arguments.dart';
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
  // late final List<QuestionModel> questionList;
  int _questionIdx = 0;
  int _totalScore = 0;

// initState() is called when the widget is first created.
// initState() is never called again afterwards.
  @override
  void initState() {
    // questionList = getQuizQuestions();
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
    Navigator.of(context).pop();
    setState(() {
      _questionIdx = 0;
      _totalScore = 0;
    });
  }

  void _answerClicked() {
    final mistakeAttempts = ref.read(mistakeAttemptsProvider);
    final accuracy = ref.read(selectedAnsAccuracyProvider);
    final questionList = ref.read(questionListProvider);
    if (accuracy == 0) {
      ref.read(mistakeAttemptsProvider.notifier).state = mistakeAttempts - 1;
      if (mistakeAttempts <= 1) {
        ref.read(resultScreenMsgProvider.notifier).state =
            'You have ran out of lifes. Try again next time';
        Navigator.of(context).pushNamed(
          ResultScreen.routeName,
          arguments: ScreenArguments(
            quizQuestions: questionList,
            resetHandler: _resetQuiz,
            totalScore: _totalScore,
          ),
        );
      }
    } else {
      setState(() {
        if (_questionIdx < questionList.length - 1) {
          ref.read(selectedAnswerProvider.notifier).state = '';
          _questionIdx++;
        } else {
          ref.read(resultScreenMsgProvider.notifier).state =
              'Congratulations!! You are trivia master!!';
          Navigator.of(context).pushNamed(
            ResultScreen.routeName,
            // arguments: [_resetQuiz, _totalScore, questionList],
            arguments: ScreenArguments(
              quizQuestions: questionList,
              resetHandler: _resetQuiz,
              totalScore: _totalScore,
            ),
          );
        }
        {}
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final List<Map<String, dynamic>> answers =
    //     AppConstants.questions[_questionIdx]["answers"];
    final questionList = ref.watch(questionListProvider);
    final QuestionModel? currentQuestion =
        questionList.length <= 0 ? null : questionList[_questionIdx];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Question #${_questionIdx + 1}"),
      ),
      body: GradientContainer(
        containerWidth: double.infinity,
        childWidget: Column(
          children: [
            SessionTopSection(
              finalItemIdx: questionList.length,
              queueIndex: _questionIdx,
            ),
            // Question(
            //   questionText: AppConstants.questions[_questionIdx]["text"],
            // ),
            if (questionList.length <= 0)
              CircularProgressIndicator(
                color: Colors.black,
                strokeWidth: 4,
              ),
            if (questionList.length != 0) ...[
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
