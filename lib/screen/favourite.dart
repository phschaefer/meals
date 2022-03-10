import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/screen/widget/mealItem.dart';

class Favourites extends StatelessWidget {

  final List<Meal> favouriteMeals;

  Favourites(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {

    if(favouriteMeals.isEmpty) {
      return const Center(
        child: Text('No favourite meals!'),
      );
    } else {
      return ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: favouriteMeals[index].id,
              title: favouriteMeals[index].title,
              imageUrl: favouriteMeals[index].imageUrl,
              duration: favouriteMeals[index].duration,
              complexity: favouriteMeals[index].complexity,
              affordability: favouriteMeals[index].affordability,
            );
          },
          itemCount: favouriteMeals.length);
    }


  }
}
