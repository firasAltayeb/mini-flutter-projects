class AnswerModel {
  const AnswerModel({
    required this.ansTxt,
    required this.accuracy,
  });

  final String ansTxt;
  final int accuracy;
}

class QuestionModel {
  const QuestionModel({
    required this.qusTxt,
    required this.ansList,
  });

  final List<AnswerModel> ansList;
  final String qusTxt;
}
