import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';
import '../models/meals_model.dart';

class Category_Screen extends StatelessWidget {
  static const routeName = '/categories';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('Kili Meals'),
//        centerTitle: true,
//      ),
      body: GridView(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3/2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
        padding: EdgeInsets.all(15),
        children: <Widget>[
        ...DUMMY_CATEGORIES.map((categoryData) => CategoryItem(
          id: categoryData.id,
          title: categoryData.title,
          color: categoryData.color,
        ))
      ], )
    );
  }
}
