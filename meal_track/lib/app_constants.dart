import 'package:flutter/material.dart';

import 'models/category.dart';

abstract class AppConstants {
  static final customTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0xFFE91E63),
      secondary: Color(0xFFFFC107),
    ),
    canvasColor: Color(0xFFFFFEE5),
    fontFamily: 'Raleway',
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: TextStyle(
            color: Color(0xFF143333),
          ),
          bodyMedium: TextStyle(
            color: Color(0xFF143333),
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
  );

  static const foodCategories = const [
    Category(
      id: 'c1',
      title: 'Italian',
      color: Colors.purple,
    ),
    Category(
      id: 'c2',
      title: 'Quick & Easy',
      color: Colors.red,
    ),
    Category(
      id: 'c3',
      title: 'Hamburgers',
      color: Colors.orange,
    ),
    Category(
      id: 'c4',
      title: 'German',
      color: Colors.amber,
    ),
    Category(
      id: 'c5',
      title: 'Light & Lovely',
      color: Colors.blue,
    ),
    Category(
      id: 'c6',
      title: 'Exotic',
      color: Colors.green,
    ),
    Category(
      id: 'c7',
      title: 'Breakfast',
      color: Colors.lightBlue,
    ),
    Category(
      id: 'c8',
      title: 'Asian',
      color: Colors.lightGreen,
    ),
    Category(
      id: 'c9',
      title: 'French',
      color: Colors.pink,
    ),
    Category(
      id: 'c10',
      title: 'Summer',
      color: Colors.teal,
    ),
  ];
}
