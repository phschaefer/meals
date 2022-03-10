import 'package:flutter/material.dart';
import 'package:meals/screen/widget/mainDrawer.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var glutenFree = false;
  var lactoseFree = false;
  var vegetarian = false;
  var vegan = false;

  Widget buildMealFilter(String title, String description, var currentValue,
      Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: currentValue,
        onChanged: (value) => updateValue(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Settings'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildMealFilter('Gluten-Free',
                    'Only include gluten-free meals.', glutenFree, (newValue) {
                  setState(() {
                    glutenFree = newValue;
                  });
                }),
                buildMealFilter('Lactose-Free',
                    'Only include lactose-free meals.', lactoseFree, (newValue) {
                      setState(() {
                        lactoseFree = newValue;
                      });
                    }),
                buildMealFilter('Vegetarian',
                    'Only include vegetarian meals.', vegetarian, (newValue) {
                      setState(() {
                        vegetarian = newValue;
                      });
                    }),
                buildMealFilter('Vegan',
                    'Only include vegan meals.', vegan, (newValue) {
                      setState(() {
                        vegan = newValue;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
