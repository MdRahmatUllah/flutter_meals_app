import 'package:flutter/material.dart';
import 'package:mealsapp/screens/category_screen.dart';

import 'favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<String> title = {'Categories', 'Favorites'}.toList();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title[1]),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(
                Icons.category,
              ),
              text: 'Categories',
            ),
            Tab(
              icon: Icon(
                Icons.star,
              ),
              text: 'Favorite',
            ),
          ]),
        ),
        body: TabBarView(children: [
          CategoryScreen(),
          FavoriteScreen(),
        ]),
      ),
    );
  }
}
