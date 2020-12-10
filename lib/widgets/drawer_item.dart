import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget listBuilder(BuildContext ctx, IconData icon, String title, Function selectHandler,){
    return ListTile(
      onTap: selectHandler,

      leading: Icon(
        icon,
        color: Theme.of(ctx).primaryColor,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: Theme.of(ctx).primaryColor,
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
              height: 200,
              padding: EdgeInsets.all(20),
              color: Theme.of(context).primaryColor,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'kili MEALS',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  Text(
                    'your one stop meal place!',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 12,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: 20,
          ),
          listBuilder(
              context,
              Icons.restaurant,
              'Meals',
                (){
                Navigator.of(context).pushReplacementNamed('/');
          }
          ),
          listBuilder(context, Icons.settings, 'Filter', (){
            Navigator.of(context).pushReplacementNamed(Filters.routeName);
          }),
        ],
      ),
    );
  }
}
