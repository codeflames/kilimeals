import 'package:flutter/material.dart';
import 'package:kilimanjaro_foods/dummy_data.dart';
import '../widgets/meal_recipe_item.dart';

class MealRecipe extends StatelessWidget {
  static const routeName = '/MealRecipeScreen';

  final Function toggleFavourite;
  final Function isFavourite;

//  final String mealTitle;
//  final String mealImageUrl;
//  final String mealId;
//
  MealRecipe({
//    @required this.mealId,
//    @required this.mealTitle,
//    @required this.mealImageUrl,
@required this.toggleFavourite,
    @required this.isFavourite,
  });

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealTitle = routeArgs['title'];
    final mealImageUrl = routeArgs['url'];
    final mealId = routeArgs['id'];

    return Scaffold(
        appBar: AppBar(
          title: Text(mealTitle),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(

                  child:Image.network(
                    mealImageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(color: Colors.black45),
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Text(
                      mealTitle,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),

                ...DUMMY_MEALS.map((recipeData){
                  return recipeData.id == mealId ? MealRecipeItem(
                    recipeIngredients: recipeData.ingredients,
                    recipeSteps: recipeData.steps,
                  ): Container();
                })

              ],
            ),
          ),

        ),
    floatingActionButton: FloatingActionButton(
        child: Icon(isFavourite(mealId) ? Icons.star : Icons.star_border,
        color: Colors.red,) ,
      onPressed: () => toggleFavourite(mealId),
    ),);
  }
}
