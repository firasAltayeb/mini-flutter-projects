import '../models/question_model.dart';

List<QuestionModel> getQuizQuestions() {
  List<QuestionModel> quizQuestions = [];
  // Question 1
  List<AnswerModel> firstQusAns = [];
  firstQusAns.addAll([
    AnswerModel(ansTxt: "Tokyo", accuracy: 1),
    AnswerModel(ansTxt: "Kyoto", accuracy: 0),
    AnswerModel(ansTxt: "Nagoya", accuracy: 0),
    AnswerModel(ansTxt: "Osaka", accuracy: 0),
  ]);
  quizQuestions.add(
    QuestionModel(
      qusTxt: "What's the capital of Japan?",
      ansList: firstQusAns,
    ),
  );
  // Question 2
  List<AnswerModel> secondQusAns = [];
  secondQusAns.addAll([
    AnswerModel(ansTxt: "47", accuracy: 1),
    AnswerModel(ansTxt: "50", accuracy: 0),
    AnswerModel(ansTxt: "45", accuracy: 0),
    AnswerModel(ansTxt: "53", accuracy: 0),
  ]);
  quizQuestions.add(
    QuestionModel(
      qusTxt: "How many prefectures are there in Japan?",
      ansList: secondQusAns,
    ),
  );
  // Question 3
  List<AnswerModel> thirdQusAns = [];
  thirdQusAns.addAll([
    AnswerModel(ansTxt: "12", accuracy: 1),
    AnswerModel(ansTxt: "8", accuracy: 0),
    AnswerModel(ansTxt: "10", accuracy: 0),
    AnswerModel(ansTxt: "15", accuracy: 0),
  ]);
  quizQuestions.add(
    QuestionModel(
      qusTxt: "How far is Tokyo from California by plane?",
      ansList: thirdQusAns,
    ),
  );
  return quizQuestions;
}
