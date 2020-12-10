import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meals_model.dart';

class Favourites extends StatelessWidget {
  final List<Meal> favouriteMeal;

  Favourites(this.favouriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeal.isEmpty) {
      return Center(
        child: Text('You have no favourites yet!', style: Theme
            .of(context)
            .textTheme
            .headline6,),
      );
    } else {
      return ListView.builder(itemBuilder: (ctx, index){
        return MealItem(
          id: favouriteMeal[index].id,
          title: favouriteMeal[index].title,
          imageUrl: favouriteMeal[index].imageUrl,
          duration: favouriteMeal[index].duration,
          affordability: favouriteMeal[index].affordability,
          complexity: favouriteMeal[index].complexity,
          color: Colors.grey,
        );
      },
      itemCount: favouriteMeal.length,);}
  }
}
