import 'package:flutter/material.dart';
import 'package:mealsapp/models/category.dart';
import 'package:mealsapp/widgets/category_card.dart';

import 'category_item_card.dart';

class CategoryScreen extends StatelessWidget {
  final List<Category> category;
  const CategoryScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: GridView(
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
      ),
    );
  }
}
