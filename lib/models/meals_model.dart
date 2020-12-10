import 'package:flutter/material.dart';


enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

class Meal {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final List<String> categories;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
  final Affordability affordability;
  final Complexity complexity;

  const Meal(
      {
       @required this.id,
     @required this.title,
     @required this.imageUrl,
     @required this.duration,
     @required this.ingredients,
     @required this.steps,
     @required this.categories,
     @required this.isGlutenFree,
     @required this.isVegan,
     @required this.isVegetarian,
     @required this.isLactoseFree,
     @required this.affordability,
     @required this.complexity});
}
