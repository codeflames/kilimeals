import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/meals_model.dart';
import '../screens/meal_recipe_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final Affordability affordability;
  final Complexity complexity;
  final int duration;
  final Color color;


  const MealItem(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.affordability,
      @required this.complexity,
      @required this.duration,
      @required this.color,
    });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealRecipe.routeName,
        arguments: {'id': id, 'title': title, 'url': imageUrl});
  }

    @override
    Widget build(BuildContext context) {
      return InkWell(
        
        onTap: () => selectMeal(context),
        child: Card(
          margin: EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 5,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(

                        List: [
                          color.withOpacity(0.3),
                          color.withOpacity(0.4),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),),
                      child: Image.network(
                        imageUrl,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(color: Colors.black45),
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        child: Text(
                          title,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.timer),
                        Text('$duration mins')
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.work),
                        Text(complexityText)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.attach_money),
                        Text(affordabilityText)
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
}

