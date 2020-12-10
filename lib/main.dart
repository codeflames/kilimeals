import 'package:flutter/material.dart';
import 'package:kilimanjaro_foods/screens/meal_recipe_screen.dart';

import './dummy_data.dart';
import './models/meals_model.dart';
import './screens/category_screen.dart';
import './screens/filter_screen.dart';
import './screens/meals_screen.dart';
import './screens/tabs_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favouriteMeals = [];

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void toggleFavourites(String mealId) {
    final existingIndex =
        favouriteMeals.indexWhere((mealElement) => mealElement.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favouriteMeals.add(
            DUMMY_MEALS.firstWhere((mealElement) => mealElement.id == mealId));
      });
    }
  }

  bool isMealFavourite(String id){
    return favouriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kili Meals',
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.red,
        accentColor: Colors.white,
        //canvasColor: Colors.white70,
      ),
      routes: {
        '/': (ctx) => TabsScreen(favouriteMeals),
        Filters.routeName: (ctx) => Filters(_filters, setFilters),
        MealScreen.routeName: (ctx) => MealScreen(
              availableMeals: availableMeals,
            ),
        Category_Screen.routeName: (ctx) => Category_Screen(),
        MealRecipe.routeName : (ctx) => MealRecipe(toggleFavourite: toggleFavourites,isFavourite: isMealFavourite,),
      },
    );
  }
}
