import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meals_model.dart';

class MealScreen extends StatelessWidget {

  static const routeName = '/mealScreen';
  final List<Meal> availableMeals;

//  final String categoryImage;
//  final String categoryDuration;
//  final String categoryComplexity;
//  final String categoryAffordability;
//
  MealScreen({
    this.availableMeals
//     @required this.categoryImage,
//     @required this.categoryDuration,
//     @required this.categoryComplexity,
//     @required this.categoryAffordability
  });

  @override
  Widget build(BuildContext context) {

    final routeArgs =
    ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryColor = routeArgs['color'];

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            ...availableMeals.map(
              (mealData) {
                return mealData.categories.contains(categoryId)
                    ? MealItem(
                        title: mealData.title,
                        imageUrl: mealData.imageUrl,
                        color: categoryColor,
                        complexity: mealData.complexity,
                        duration: mealData.duration,
                        affordability: mealData.affordability,
                  id: mealData.id,
                      )
                    : Container();
              },
            )
          ],
        ));
  }
}
