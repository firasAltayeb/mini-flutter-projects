import '../models/question_model.dart';

class ScreenArguments {
  const ScreenArguments({
    required this.quizQuestions,
    required this.resetHandler,
    required this.totalScore,
  });

  final List<QuestionModel> quizQuestions;
  final void Function() resetHandler;
  final int totalScore;
}
