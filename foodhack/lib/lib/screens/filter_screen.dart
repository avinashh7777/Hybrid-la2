import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/settings';

 final Function saveFilters;

 FilterScreen(this.saveFilters);



  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  Widget _buildSwitch(String title, String desc, bool curVal, Function update) {
    return SwitchListTile(
        title: Text(title),
        value: curVal,
        subtitle: Text(desc),
        onChanged: update);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: <Widget>[
         IconButton(icon: Icon(Icons.save),onPressed: widget.saveFilters,)

        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your settings',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitch(
                    'Gluten-free', 'only gluten-free meals', _glutenFree,
                    (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  },);
                },),

                 _buildSwitch(
                    'vegetarian','only veg meals.', _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  },);
                },),

                 _buildSwitch(
                    'vegan ', 'only vegan food.', _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  },);
                },),
              ],
            ),
          )
        ],
      ),
    );
  }
}
