import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../utility/shared_providers.dart';
import '../models/screen_arguments.dart';
import '../utility/home_functions.dart';
import '../models/question_model.dart';
import '../utility/size_config.dart';
import '../widgets/choice_option.dart';
import '../widgets/gesture_container.dart';
import '../widgets/gradiant_container.dart';
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
  late final List<QuestionModel> questionList;
  int _questionIdx = 0;
  int _totalScore = 0;

// initState() is called when the widget is first created.
// initState() is never called again afterwards.
  @override
  void initState() {
    questionList = getQuizQuestions();
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
    Navigator.of(context).pop();
    setState(() {
      _questionIdx = 0;
      _totalScore = 0;
    });
  }

  void _answerClicked() {
    final accuracy = ref.read(selectedAnsAccuracyProvider);
    _totalScore += accuracy;
    setState(() {
      if (_questionIdx < questionList.length - 1) {
        _questionIdx++;
      } else {
        Navigator.of(context).pushNamed(
          "/result-screen",
          // arguments: [_resetQuiz, _totalScore, questionList],
          arguments: ScreenArguments(
            quizQuestions: questionList,
            resetHandler: _resetQuiz,
            totalScore: _totalScore,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final List<Map<String, dynamic>> answers =
    //     AppConstants.questions[_questionIdx]["answers"];
    final currentQuestion = questionList[_questionIdx];
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text("Question #${_questionIdx + 1}"),
      ),
      body: GradientContainer(
        childWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 3,
            ),
            // Question(
            //   questionText: AppConstants.questions[_questionIdx]["text"],
            // ),
            TextContainer(textToShow: currentQuestion.qusTxt),
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
            Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
