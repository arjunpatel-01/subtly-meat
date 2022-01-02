import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

class ProductListPage extends StatefulWidget {
  ProductListPage({Key key}) : super(key: key);

  @override
  ProductListPageState createState() => ProductListPageState();
}

class ProductListPageState extends State<ProductListPage> {
  Future getPosts() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore
        .collection("Subtly_Meat")
        .where('status', isEqualTo: 'approved')
        .getDocuments();
    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    return new Theme(
        data: new ThemeData(
            primaryColor: Colors.red, cardColor: Colors.grey[350]),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Subtly Meat'),
          ),
          backgroundColor: Colors.white,
          body: Container(
              child: FutureBuilder(
                  future: getPosts(),
                  builder: (_, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Text(
                          "Loading...",
                          style: TextStyle(color: Colors.grey),
                        ),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (_, index) {
                            return Card(
                                child: ListTile(
                                    title: Text(
                                      snapshot.data[index].data['name'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19),
                                    ),
                                    subtitle: Text(
                                      snapshot.data[index].data['type'],
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    )));
                          });
                    }
                  })),
        ));
  }
}
