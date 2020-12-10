import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealRecipeItem extends StatelessWidget {
  final String recipeId;
  final List<String> recipeIngredients;
  final List<String> recipeSteps;

  const MealRecipeItem(
      {@required this.recipeId,
      @required this.recipeIngredients,
      @required this.recipeSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(8)),
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(5),
                child: Text('Ingredients:', style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              ...recipeIngredients.map((ingredients) {
                return ListTile(
                  leading: Icon(Icons.arrow_right, color: Colors.red,),
                  subtitle: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        ingredients,
                        style: TextStyle(fontSize: 18),
                      )),
                );
              })
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            //height: 250,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(5),
                  child: Text('Steps:', style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                ...recipeSteps.map((steps) {
                  return ListTile(
                    leading: Icon(Icons.arrow_right, color: Colors.red,),
                    subtitle: Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.topLeft,
                        child: Text(
                          steps,
                          style: TextStyle(fontSize: 18),
                        )),
                  );
                })
              ],
            ),
          ),
        ],
      );
    //);
  }
}
