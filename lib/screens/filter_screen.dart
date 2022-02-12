import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static String routeName = "/filter";
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter"),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('FilterScreen'),
      ),
    );
  }
}
