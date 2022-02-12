import 'package:flutter/material.dart';
import 'package:mealsapp/data/dummy_data.dart';
import 'package:mealsapp/models/category.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/widgets/category_card.dart';

class CategoryItems extends StatefulWidget {
  static const routeName = '/category-items';
  const CategoryItems({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  late String categoryTitle;
  late List<Meal> meals;
  // late Map<String, List<String>> removedMealsId;
  // late List<String> removedMealsId = [];

  void removeItem(String mealId) {
    print(mealId);
    setState(() {
      // meals.removeWhere((meal) => meal.id == mealId);
      // DUMMY_MEALS.removeWhere((meal) => meal.id == mealId);
      removedMealsId.add(mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    Category category = ModalRoute.of(context)!.settings.arguments as Category;
    final meals = DUMMY_MEALS.where((element) {
      return element.categories.contains(category.id) &&
          !removedMealsId.contains(element.id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return CategoryCard(
            title: meals[index].title,
            affordability: meals[index].affordability,
            complexity: meals[index].complexity,
            duration: meals[index].duration,
            imageUrl: meals[index].imageUrl,
            id: meals[index].id,
            removeItem: removeItem,
          );
        },
        itemCount: meals.length,
      ),
    );
  }
}
