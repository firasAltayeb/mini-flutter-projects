import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/question_model.dart';

final questionListProvider = StateProvider<List<QuestionModel>>((ref) => []);

final selectedAnsAccuracyProvider = StateProvider<int>((ref) => 0);

final resultScreenMsgProvider = StateProvider<String>((ref) => '');

final selectedAnswerProvider = StateProvider<String>((ref) => '');

final mistakeAttemptsProvider = StateProvider<int>((ref) => 4);
