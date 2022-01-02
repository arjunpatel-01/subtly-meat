//import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:subtly_meat/products_list.dart';
import 'package:subtly_meat/expansion_tile.dart';
import 'package:subtly_meat/form_builder.dart';
import 'package:subtly_meat/search_bar.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final widgetTextOptions = [
    new Expansionpanel(),
    //new ProductListPage(),
    new SearchProducts(),
    new FormFirstPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: widgetTextOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Info'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('List'),
          ),
          /*BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
              ),*/
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            title: Text('Submission'),
          ),
        ],
        currentIndex: _currentIndex,
        fixedColor: Colors.white,
        onTap: onTabTapped,
      ),
    ));
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
