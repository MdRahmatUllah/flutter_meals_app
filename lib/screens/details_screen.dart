import 'package:flutter/material.dart';
import 'package:mealsapp/data/dummy_data.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = "/details-screen";
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context)!.settings.arguments as String;
    var meal = DUMMY_MEALS.firstWhere((meals) {
      return meals.id == mealId;
    });
    final pageHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        50;
    return Container(
      height: pageHeight,
      child: Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
        ),
        body: Column(
          children: [
            Container(
              height: pageHeight * .25,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            TitleMethod(context, 'Ingredients'),
            buildContainer(
                item: meal.ingredients, heightProperty: pageHeight * .25),
            TitleMethod(context, 'Steps'),
            buildContainer(item: meal.steps, heightProperty: pageHeight * .25),
          ],
        ),
      ),
    );
  }

  Container TitleMethod(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 15, 0, 5),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}

class buildContainer extends StatelessWidget {
  const buildContainer({
    Key? key,
    required this.item,
    required this.heightProperty,
  }) : super(key: key);
  final heightProperty;
  final List<String> item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightProperty,
      margin: EdgeInsets.fromLTRB(30, 5, 30, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black54),
        //color: Colors.black.withOpacity(.2),
      ),
      child: ListView.builder(
        itemBuilder: (ctx, index) => Card(
          margin: EdgeInsets.all(3),
          color: Colors.cyan,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(
              '${index + 1}. ${item[index]}',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        itemCount: item.length,
      ),
    );
  }
}
