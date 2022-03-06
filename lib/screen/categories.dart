import 'package:flutter/material.dart';
import 'package:meals/screen/widget/categoryItem.dart';
import 'package:meals/data/dummy_data.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        padding: const EdgeInsets.all(15),
        children: DUMMY_CATEGORIES
            .map(
              (categorie) =>
                  CategoryItem(categorie.id, categorie.title, categorie.color),
            ).toList(),
    );
  }
}
