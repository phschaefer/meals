import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/screen/widget/mealItem.dart';

class CategoryMeals extends StatefulWidget {

  final List<Meal> availableMeals;

  CategoryMeals(this.availableMeals);

  @override
  State<CategoryMeals> createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String? categoryTitle;
  List<Meal>? displayedMeals;
  bool loadedInitData = false;

  void removeMeal(String id) {
    setState(() {
      displayedMeals?.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: displayedMeals![index].id,
              title: displayedMeals![index].title,
              imageUrl: displayedMeals![index].imageUrl,
              duration: displayedMeals![index].duration,
              complexity: displayedMeals![index].complexity,
              affordability: displayedMeals![index].affordability,
              removeItem: removeMeal,
            );
          },
          itemCount: displayedMeals?.length),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!loadedInitData) {
      final routeArgs =
      ModalRoute.of(context)?.settings.arguments as Map<String, String>;

      final String? categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      loadedInitData = true;
    }
    super.didChangeDependencies();
  }
}
