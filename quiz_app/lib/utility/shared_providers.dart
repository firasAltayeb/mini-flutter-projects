import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedAnsAccuracyProvider = StateProvider<int>((ref) => 0);

final selectedAnswerProvider = StateProvider<String>((ref) => '');
