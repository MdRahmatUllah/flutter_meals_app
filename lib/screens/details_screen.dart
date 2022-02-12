import 'package:flutter/material.dart';
import 'package:mealsapp/data/dummy_data.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = "/details-screen";
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late bool _isFavorite = false;

  void _addFavorite(String mealId) {
    setState(
      () {
        if (_isFavorite) {
          favoriteMealId.remove(mealId);
        } else {
          favoriteMealId.add(mealId);
        }
        print(_isFavorite);
        _isFavorite = !_isFavorite;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context)!.settings.arguments as String;
    var meal = DUMMY_MEALS.firstWhere((meals) {
      return meals.id == mealId;
    });
    _isFavorite = favoriteMealId.contains(mealId);
    final pageHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        50;
    return Container(
      height: pageHeight,
      child: Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          actions: [
            IconButton(
              icon: Icon(Icons.favorite,
                  color: _isFavorite ? Colors.black : Colors.white),
              onPressed: () => _addFavorite(meal.id),
              padding: EdgeInsets.only(right: 30),
            ),
          ],
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
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.delete),
          onPressed: () {
            Navigator.of(context).pop(meal.id);
          },
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
