// ignore_for_file: deprecated_member_use, prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:mealsapp/screens/category_screen.dart';
import 'package:mealsapp/widgets/main_drawer.dart';
import 'favorite_screen.dart';
import 'filter_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<String> title = {'Categories', 'Favorites', 'Filter'}.toList();
  final List<Widget> _screens = [
    CategoryScreen(),
    FavoriteScreen(),
    FilterScreen(),
  ];

  int _selectedIndex = 0;
  void _selectPage(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  BottomNavigationBarItem buildBottomNavigationBar(
      BuildContext ctx, int index) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.pink,
      icon: Icon(
        index == 0 ? Icons.category : Icons.favorite,
        color: Colors.white,
      ),
      title: Text(title[index], style: TextStyle(color: Colors.white)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(
          title[_selectedIndex],
          style: Theme.of(context).textTheme.headline6,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.shifting,
        onTap: _selectPage,
        items: [
          buildBottomNavigationBar(context, 0),
          buildBottomNavigationBar(context, 1),
        ],
      ),
    );
  }
}
