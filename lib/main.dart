// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import './widgets/category_screen.dart';
import 'models/category.dart';
import 'data/dummy_data.dart';
import 'widgets/category_item_screen.dart';

void main(List<String> args) {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);
  final category = DUMMY_CATEGORIES;
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.pink,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
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
            )),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => CategoryScreen(category: category),
        CategoryItems.routeName: (ctx) => CategoryItems(),
      },
    );
  }
}
