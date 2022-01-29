import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = '/Category-Meals-Screen';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final title = routeArgs['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: const Center(
        child: Text('The Recipes for the Category'),
      ),
    );
  }
}
