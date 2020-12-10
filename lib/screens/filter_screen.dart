import 'package:flutter/material.dart';

import '../widgets/drawer_item.dart';

class Filters extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilter;

  Filters(this.currentFilter, this.saveFilters,);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState(){
    _glutenFree = widget.currentFilter['gluten'];
    _vegetarian = widget.currentFilter['vegetarian'];
    _vegan = widget.currentFilter['vegan'];
    _lactoseFree = widget.currentFilter['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      {String titleText,
      bool currentValue,
      String subtitleText,
      Function updateValue}) {
    return SwitchListTile(
      title: Text(titleText),
      value: currentValue,
      subtitle: Text(subtitleText),
      onChanged: updateValue,
      activeColor: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('filter'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.save,
                color: Colors.white,
              ),
              onPressed: (){
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian' : _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your meal Selection Here',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                    titleText: 'Gluten Free',
                    subtitleText: 'Only include gluten free meals',
                    currentValue: _glutenFree,
                    updateValue: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    }),
                _buildSwitchListTile(
                    titleText: 'Lactose free',
                    subtitleText: 'Only include lactose free meals',
                    currentValue: _lactoseFree,
                    updateValue: (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }),
                _buildSwitchListTile(
                    titleText: 'Vegetarian',
                    subtitleText: 'Only include vegetarian meals',
                    currentValue: _vegetarian,
                    updateValue: (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }),
                _buildSwitchListTile(
                    titleText: 'Vegan',
                    subtitleText: 'Only include Vegan meals',
                    currentValue: _vegan,
                    updateValue: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
