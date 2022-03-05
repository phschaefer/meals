import 'package:flutter/material.dart';
import 'package:meals/screen/categories.dart';
import 'package:meals/screen/favourite.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meals'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favourite',
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [
          Categories(),
          Favourites(),
        ],),
      ),
    );
  }
}
