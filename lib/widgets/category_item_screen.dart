import 'package:flutter/material.dart';
import 'package:mealsapp/data/dummy_data.dart';
import 'package:mealsapp/models/category.dart';

class CategoryItems extends StatelessWidget {
  static const routeName = '/category-items';
  const CategoryItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Category category = ModalRoute.of(context)!.settings.arguments as Category;
    final meals = DUMMY_MEALS.where((element) {
      return element.categories.contains(category.id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(meals[index].title);
        },
        itemCount: meals.length,
      ),
    );
  }
}
