import 'package:flutter/material.dart';


import './favourites_screen.dart';
import './category_screen.dart';
import '../models/meals_model.dart';
import '../widgets/drawer_item.dart';


class TabsScreen extends StatefulWidget {
  static const routeName = '/';
  final List<Meal> favouriteMeal;

  TabsScreen(this.favouriteMeal);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {


  List<Map<String, Object>> pages;


  int pageIndex = 0;

  @override
  void initState() {
    pages = [{
    'page': Category_Screen(),
    'title': 'Kili Meals Category',},
    {
    'page': Favourites(widget.favouriteMeal),
    'title': 'Your favourites'}];

    super.initState();
  }

  void selectPage(index){
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(pages[pageIndex]['title']),
          centerTitle: true,
        ),
        drawer: MainDrawer(),
        body: pages[pageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: selectPage,
          showUnselectedLabels: false,
          currentIndex: pageIndex,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), title: Text('Categories')),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), title: Text('Favourites')),
          ],
        ),
      ),
    );
  }
}
