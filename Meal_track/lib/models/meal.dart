import 'package:flutter/foundation.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  const Meal({
    @required this.affordability,
    @required this.isLactoseFree,
    @required this.isVegetarian,
    @required this.isGlutenFree,
    @required this.ingredients,
    @required this.complexity,
    @required this.categories,
    @required this.duration,
    @required this.imageUrl,
    @required this.isVegan,
    @required this.steps,
    @required this.title,
    @required this.id,
  });

  final Affordability affordability;
  final List<String> ingredients;
  final List<String> categories;
  final Complexity complexity;
  final List<String> steps;
  final bool isLactoseFree;
  final bool isGlutenFree;
  final bool isVegetarian;
  final String imageUrl;
  final String title;
  final bool isVegan;
  final int duration;
  final String id;
}
