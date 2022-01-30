import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../data/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = '/Category-Meals-Screen';

  const CategoryMealsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final title = routeArgs['title'];
    final id = routeArgs['id'];
    final meals = DUMMY_MEALS.where((element) {
      return element.categories.contains(id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title: meals[index].title,
            imageUrl: meals[index].imageUrl,
            duration: meals[index].duration,
            complexity: meals[index].complexity,
            affordability: meals[index].affordability,
          );
        },
        itemCount: meals.length,
      ),
    );
  }
}
