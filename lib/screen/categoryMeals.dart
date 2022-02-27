import 'package:flutter/material.dart';

class CategoryMeals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final String? categoryId = routeArgs['id'];
    final String? categoryTitle = routeArgs['title'];


    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: const Center(
        child: Text('The Recipes for the Category!'),
      ),
    );
  }
}
