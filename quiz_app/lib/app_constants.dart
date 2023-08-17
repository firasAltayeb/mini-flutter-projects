import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();

  static const circleRadius = BorderRadius.all(Radius.circular(20));

  static const List<Map<String, dynamic>> questions = [
    {
      "text": "What's the capital of Japan?",
      "answers": [
        {"ans": "Tokyo", "score": 1},
        {"ans": "Kyoto", "score": 0},
        {"ans": "Nara", "score": 0},
        {"ans": "Hiroshima", "score": 0},
      ],
    },
    {
      "text": "How many prefectures are there in Japan?",
      "answers": [
        {"ans": "47", "score": 1},
        {"ans": "50", "score": 0},
        {"ans": "35", "score": 0},
        {"ans": "45", "score": 0},
      ],
    },
    {
      "text": "How far is Tokyo from California by plane?",
      "answers": [
        {"ans": "12", "score": 1},
        {"ans": "8", "score": 0},
        {"ans": "10", "score": 0},
        {"ans": "15", "score": 0},
      ],
    },
  ];
}
