import 'package:Meal_track/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = '/filters';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('FilterTest'),
      ),
    );
  }
}
