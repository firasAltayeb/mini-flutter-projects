import 'package:flutter/material.dart';

import 'screens/meal_detail_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/meal_item_screen.dart';
import 'screens/filters_screen.dart';
import 'screens/home_screen.dart';
import 'models/meal.dart';
import 'app_constants.dart';
import 'ui_constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = UiConstants.mealDetailsLst;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = UiConstants.mealDetailsLst.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          UiConstants.mealDetailsLst.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: AppConstants.customTheme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (ctx) {
          return HomeScreen(_favoriteMeals);
        },
        MealItemScreen.routeName: (ctx) {
          return MealItemScreen(_availableMeals);
        },
        MealDetailScreen.routeName: (ctx) {
          return MealDetailScreen(
            _toggleFavorite,
            _isMealFavorite,
          );
        },
        FiltersScreen.routeName: (ctx) {
          return FiltersScreen(
            _filters,
            _setFilters,
          );
        },
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
