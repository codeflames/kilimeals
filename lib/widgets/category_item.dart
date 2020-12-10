import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kilimanjaro_foods/screens/meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({this.id, this.title, this.color});

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MealScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
        'color': color,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => selectCategory(context),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
            gradient: LinearGradient(
            List: [color.withOpacity(0.4), color.withOpacity(0.8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,

        )
        ),
        width: double.infinity,
        child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
      ),
    );
  }
}
