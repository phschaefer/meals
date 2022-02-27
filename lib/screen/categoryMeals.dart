import 'package:flutter/material.dart';

class CategoryMeals extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;


  CategoryMeals(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: const Center(
        child: Text('The Recipes for the Category!'),
      ),
    );
  }
}
