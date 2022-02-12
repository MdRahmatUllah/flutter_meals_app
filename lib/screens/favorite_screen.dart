import 'package:flutter/material.dart';
import 'package:mealsapp/data/dummy_data.dart';
import 'package:mealsapp/models/category.dart';
import 'package:mealsapp/widgets/category_card.dart';

class FavoriteScreen extends StatefulWidget {
  static String routeName = '/favorite';
  const FavoriteScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreen();
}

class _FavoriteScreen extends State<FavoriteScreen> {
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
    final meals = DUMMY_MEALS.where((meal) {
      return favoriteMealId.contains(meal.id) &&
          !removedMealsId.contains(meal.id);
    }).toList();

    return Scaffold(
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
