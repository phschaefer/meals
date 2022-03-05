import 'package:flutter/material.dart';
import 'package:meals/config/RouteConfig.dart';
import 'package:meals/screen/categories.dart';
import 'package:meals/screen/categoryMeals.dart';
import 'package:meals/screen/mealDetail.dart';
import 'package:meals/screen/tabs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
        RouteConfig.getCategoryMeals: (context) => const CategoryMeals(),
        RouteConfig.getMealDetail: (context) => const MealDetail(),
      }, onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const Categories());
    },
      debugShowCheckedModeBanner: false,
    );
  }
}