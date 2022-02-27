import 'package:flutter/material.dart';
import 'package:meals/categoryItemMapper.dart';
import 'package:meals/data/dummy_data.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: DUMMY_CATEGORIES
            .map(
              (categorie) =>
                  CategoryItemMapper(categorie.id, categorie.title, categorie.color),
            ).toList(),
      ),
    );
  }
}
