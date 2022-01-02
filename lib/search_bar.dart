//import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchProducts extends StatefulWidget {
  @override
  SearchProductsState createState() => SearchProductsState();
}

class SearchProductsState extends State<SearchProducts> {
  List<DropdownMenuItem<String>> filterDrop = [];
  final myController = TextEditingController();
  void loadfilterData() {
    filterDrop = [];
    filterDrop.add(new DropdownMenuItem(
        child: new Text(
          'All',
          style: TextStyle(color: Colors.white, fontSize: 13.5),
        ),
        value: 'All'));
    filterDrop.add(new DropdownMenuItem(
        child: new Text('Gelatin',
            style: TextStyle(color: Colors.white, fontSize: 13.5)),
        value: 'Gelatin'));
    filterDrop.add(new DropdownMenuItem(
        child: new Text('Rennet',
            style: TextStyle(color: Colors.white, fontSize: 13.5)),
        value: 'Rennet'));
    filterDrop.add(new DropdownMenuItem(
      child: new Text('Lard/Tallow',
          style: TextStyle(color: Colors.white, fontSize: 13.5)),
      value: 'Lard/Tallow',
    ));
    filterDrop.add(new DropdownMenuItem(
        child: new Text('Anchovies',
            style: TextStyle(color: Colors.white, fontSize: 13.5)),
        value: 'Anchovies'));
    filterDrop.add(new DropdownMenuItem(
        child: new Text('Animal\nBroth/Stock',
            style: TextStyle(color: Colors.white, fontSize: 13.5)),
        value: 'Animal Broth/Stock'));
    filterDrop.add(new DropdownMenuItem(
        child: new Text('Isinglass',
            style: TextStyle(color: Colors.white, fontSize: 13.5)),
        value: 'Isinglass'));
  }

  String selected = 'All';
  String searchString;
  @override
  Widget build(BuildContext context) {
    loadfilterData();
    return new Theme(
        data: new ThemeData(
            primaryColor: Colors.red, cardColor: Colors.grey[350]),
        child: Scaffold(
            appBar: AppBar(
              title: Text('Subtly Meat'),
              actions: <Widget>[
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: new Center(
                      child: ButtonTheme(
                          alignedDropdown: true,
                          child: new DropdownButton(
                            underline:
                                Container(height: 1, color: Colors.white),
                            dropdownColor: Colors.red,
                            value: selected,
                            icon: Icon(Icons.sort, color: Colors.white),
                            items: filterDrop,
                            onChanged: (value) {
                              selected = value;
                              setState(() {});
                            },
                          )),
                    )),
              ],
            ),
            backgroundColor: Colors.white,
            body: Column(
              children: <Widget>[
                Expanded(
                    child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            searchString = value.toLowerCase();
                          });
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            contentPadding: EdgeInsets.only(left: 25.0),
                            hintText: 'Search Product',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0))),
                      ),
                    ),
                    Container(height: 2, color: Colors.grey[350]),
                    Expanded(
                        child: StreamBuilder<QuerySnapshot>(
                            //fix the gross nested if statement for filtered searching
                            stream: (selected == 'All' || selected == null)
                                ? ((searchString == null ||
                                        searchString.trim() == "")
                                    ? Firestore.instance
                                        .collection('Subtly_Meat')
                                        .where('status', isEqualTo: 'approved')
                                        .snapshots()
                                    : Firestore.instance
                                        .collection('Subtly_Meat')
                                        .where('status', isEqualTo: 'approved')
                                        .where("searchIndex",
                                            arrayContains: searchString)
                                        .snapshots())
                                : ((searchString == null ||
                                        searchString.trim() == "")
                                    ? Firestore.instance
                                        .collection('Subtly_Meat')
                                        .where('status', isEqualTo: 'approved')
                                        .where('type', isEqualTo: selected)
                                        .snapshots()
                                    : Firestore.instance
                                        .collection('Subtly_Meat')
                                        .where('status', isEqualTo: 'approved')
                                        .where('type', isEqualTo: selected)
                                        .where("searchIndex",
                                            arrayContains: searchString)
                                        .snapshots()),
                            builder: (context, snapshot) {
                              if (snapshot.hasError)
                                return Text('Error: ${snapshot.error}');
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return Center(
                                      child: CircularProgressIndicator());
                                default:
                                  return new ListView(
                                      children: snapshot.data.documents
                                          .map((DocumentSnapshot document) {
                                    return new Container(
                                        child: Column(children: <Widget>[
                                      new ListTile(
                                        title: new Text(document['name'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 19,
                                                color: Colors.black)),
                                        subtitle: new Text(document['type'],
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16,
                                            )),
                                      ),
                                      Container(
                                          height: 1, color: Colors.grey[350])
                                    ]));
                                  }).toList());
                              }
                            }))
                  ],
                ))
              ],
            )));
  }
}
