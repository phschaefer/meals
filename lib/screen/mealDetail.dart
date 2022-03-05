import 'package:flutter/material.dart';

class MealDeatil extends StatelessWidget {
  const MealDeatil({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final routeArgs =
    ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    String? mealId = routeArgs['id'];

    return Scaffold(
      appBar: AppBar(title: Text(mealId!),),
      body: const Center(
        child: Text('The meal'),
      ),
    );
  }
}
