import 'package:flutter/material.dart';
import 'package:meals/config/RouteConfig.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/screen/categories.dart';
import 'package:meals/screen/categoryMeals.dart';
import 'package:meals/screen/mealDetail.dart';
import 'package:meals/screen/settings.dart';
import 'package:meals/screen/tabs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      availableMeals = DUMMY_MEALS.where((meal) {
        if(filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if(filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if(filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        if(filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headlineLarge: const TextStyle(
                  fontSize: 24,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
      ),
      initialRoute: RouteConfig.getDefault,
      routes: {
        RouteConfig.getDefault: (context) => const Tabs(),
        RouteConfig.getSettings: (context) => Settings(filters, setFilters),
        RouteConfig.getCategoryMeals: (context) => CategoryMeals(availableMeals),
        RouteConfig.getMealDetail: (context) => const MealDetail(),
      }, onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const Categories());
    },
      debugShowCheckedModeBanner: false,
    );
  }
}