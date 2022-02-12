import 'package:flutter/material.dart';
import 'package:mealsapp/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildDrawerList(BuildContext ctx, String title, int index) {
    return ListTile(
      leading: Icon(index == 0 ? Icons.restaurant : Icons.filter_list),
      title: Text(title, style: Theme.of(ctx).textTheme.headline5),
      onTap: () {
        index == 0
            ? Navigator.of(ctx).pushReplacementNamed('/')
            : Navigator.of(ctx).pushReplacementNamed(FilterScreen.routeName);
        // Navigator.of(ctx).pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.pink,
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(30, 60, 0, 0),
            alignment: Alignment.centerLeft,
            child: Text(
              'Meals App',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                buildDrawerList(context, 'Categories', 0),
                buildDrawerList(context, 'Filter', 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
