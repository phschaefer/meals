import 'package:flutter/material.dart';
import 'package:meals/screen/widget/mainDrawer.dart';

class Settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Settings'),
      ),
      drawer: const MainDrawer(),
      body: Center(
        child: Text('Setting!'),
      ),
    );
  }
}
