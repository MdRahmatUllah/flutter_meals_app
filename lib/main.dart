// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mealsapp/screens/category_screen.dart';
import 'package:mealsapp/screens/details_screen.dart';
import 'package:mealsapp/screens/filter_screen.dart';
import 'package:mealsapp/screens/tabs_screen.dart';
import 'models/category.dart';
import 'data/dummy_data.dart';
import 'screens/category_item_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/filter_screen.dart';

void main(List<String> args) {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        backgroundColor: Colors.grey[300],
        primaryColor: Colors.pink,
        canvasColor: Colors.grey[300],
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              headline5: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
        // '/': (ctx) => CategoryScreen(),
        '/': (ctx) => const TabsScreen(),

        CategoryItems.routeName: (ctx) => const CategoryItems(),
        DetailsScreen.routeName: (ctx) => const DetailsScreen(),
        FilterScreen.routeName: (ctx) => const FilterScreen(),
      },
      // if there is no route to go
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoryScreen());
      },
      // if there is no route to go like 404 not fount
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoryScreen());
      },
    );
  }
}
