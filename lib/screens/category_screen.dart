import 'package:flutter/material.dart';
import 'package:mealsapp/data/dummy_data.dart';
import 'package:mealsapp/models/category.dart';
import 'package:mealsapp/widgets/category_item_card.dart';

class CategoryScreen extends StatelessWidget {
  // final List<Category> category;
  List<Category> category = DUMMY_CATEGORIES;
  // const CategoryScreen({
  //   Key? key,
  //   //required this.category,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      children: category
          .map(
            (e) => CategoryItemCard(
              category: e,
            ),
          )
          .toList(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
