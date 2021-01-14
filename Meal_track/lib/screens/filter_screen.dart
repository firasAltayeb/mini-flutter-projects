import 'package:Meal_track/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;

  FilterScreen(this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegetarian = false;
  var _vegan = false;

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your filters'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: widget.saveFilters,
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                    'Gluten-free',
                    'Only include gluten-free meals',
                    _glutenFree,
                    (newValue) {
                      _glutenFree = newValue;
                    },
                  ),
                  _buildSwitchListTile(
                    'Lactose-free',
                    'Only include lactose-free meals',
                    _lactoseFree,
                    (newValue) {
                      _lactoseFree = newValue;
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegetariane',
                    'Only include vegetarian meals',
                    _vegetarian,
                    (newValue) {
                      _vegetarian = newValue;
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegan',
                    'Only include vegan meals',
                    _vegan,
                    (newValue) {
                      _vegan = newValue;
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
