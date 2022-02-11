import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final Function callBack;
  const MainDrawer({Key? key, required this.callBack}) : super(key: key);

  Widget buildDrawerList(BuildContext ctx, String title, int index) {
    return ListTile(
      leading: Icon(index == 0 ? Icons.restaurant : Icons.filter_list),
      title: Text(title),
      onTap: () {
        callBack(index);
        Navigator.of(ctx).pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.amber,
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(30, 50, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Meals App',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  buildDrawerList(context, 'Categories', 0),
                  buildDrawerList(context, 'Filter', 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
