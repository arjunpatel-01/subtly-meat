import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Expansionpanel extends StatefulWidget {
  Expansionpanelstate createState() => Expansionpanelstate();
}

class NewItem {
  NewItem({this.isExpanded: false, this.header, this.body});

  bool isExpanded;
  final String header;
  final String body;
}

class Expansionpanelstate extends State<Expansionpanel> {
  List<NewItem> _items = <NewItem>[
    NewItem(
        header: "Gelatin",
        body:
            "Gelatin is typically made from the hides, bones, and tissues of cattle or pigs. It usually has a gummy texture when combined with a liquid (i.e. Jell-O) and is used as a bonding agent. Some of the vegetarian replacements for gelatin include Agar Agar and carrageenan."),
    NewItem(
        header: "Rennet",
        body:
            "Rennet is a set of enzymes that are obtained from the intestine and stomach of a young cow. Rennet is typcially used to culture various cheese products and often goes by the names \"enzymes\" or \"cheese enzymes\". The vegetarian-friendly replacement for rennet is called microbial rennet (sometimes referred to as vegetarian rennet)."),
    NewItem(
        header: "Lard and Tallow",
        body:
            "Lard is the fatty tissue obtained from pigs while Tallow is the fatty tissue from cattle or sheep. Commonly referred to as animal shortening or animal fat, Lard and Tallow are often found in fried and baked goods. A common alternative for Lard and Tallow is vegetable shortening. Note that this alternative is also widely used so for any product that uses Lard or Tallow, there is likely a vegetarian option as well."),
    NewItem(
        header: "Anchovies",
        body:
            "An Anchovy is a kind of fish that is usually small and skinny in appearance. These fish are most notable for their strong odor. Many sauces (such as Worchestershire sauce) include anchovies."),
    NewItem(
        header: "Animal Broth/Stock",
        body:
            "Animal broth or stock is typically made by simmering animal bones and meat in water. Broth and stock can be used interchangeably and are often found in soups, gravies, and sauces. Vegetable stock is a suitable and commonly used alternative."),
    NewItem(
        header: "Carmine",
        body:
            "Carmine (also called cochineal extract) is a pigment responsible for dyeing and coloring many things red. Carmine is obtained by drying, crushing, then boiling cochineal beetles to extract carminic acid which is then used to make bright red food coloring."),
    NewItem(
        header: "Isinglass",
        body:
            "Isinglass is obtained from the swim bladders of fish. It (often along with gelatin) is used to refine certain beers, wines, and other alcoholic beverages. Isinglass is also similar to gelatin as it can be made into a paste and used as a bonding agent."),
  ];

  final keyIsFirstLoaded = 'is_first_loaded';
  showDialogIfFirstLoaded(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLoaded = prefs.getBool(keyIsFirstLoaded);
    if (isFirstLoaded == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Welcome to Subtly Meat!!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red)),
            content: new SingleChildScrollView(
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text:
                            'Welcome to Subtly Meat, a database of products that contain non-vegetarian ingredients and are not clearly advertised as such. Our goal is to have a collection that encompasses most if not all of these kinds of products. We encourage user-submitted suggestions and additions. If you would like to contribute by adding your own knowledge and discoveries, see the "Submission" page.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                '\n\n**Please note that while some products have the ingredients listed in them, there can be vegetarian alternatives. Always check the ingredients list when purchasing a product or ask the chef when ordering from a restaurant.**',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          )
                        ]))),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("OK", style: TextStyle(color: Colors.red)),
                onPressed: () {
                  // Close the dialog
                  Navigator.of(context).pop();
                  prefs.setBool(keyIsFirstLoaded, false);
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showDialogIfFirstLoaded(context));
    return SafeArea(
        child: new Theme(
            data: new ThemeData(
                primaryColor: Colors.red, cardColor: Colors.grey[350]),
            child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Subtly Meat',
                    style: TextStyle(color: Colors.white),
                  ),
                  actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.info, color: Colors.white),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              // return object of type Dialog
                              return AlertDialog(
                                title: new Text("Welcome to Subtly Meat!!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.red)),
                                content: new SingleChildScrollView(
                                    child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                            text:
                                                'Welcome to Subtly Meat, a database of products that contain non-vegetarian ingredients and are not clearly advertised as such. Our goal is to have a collection that encompasses most if not all of these kinds of products. We encourage user-submitted suggestions and additions. If you would like to contribute by adding your own knowledge and discoveries, see the "Submission" page.',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    '\n\n**Please note that while some products have the ingredients listed in them, there can be vegetarian alternatives. Always check the ingredients list when purchasing a product or ask the chef when ordering from a restaurant.**',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ]))),
                                actions: <Widget>[
                                  // usually buttons at the bottom of the dialog
                                  new FlatButton(
                                    child: new Text(
                                      "OK",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    onPressed: () {
                                      // Close the dialog
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        })
                  ],
                ),
                backgroundColor: Colors.white,
                body: ListView(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          child: ExpansionPanelList(
                            expansionCallback: (int index, bool isExpanded) {
                              setState(() {
                                _items[index].isExpanded =
                                    !_items[index].isExpanded;
                              });
                            },
                            children: _items.map((NewItem item) {
                              return ExpansionPanel(
                                  canTapOnHeader: true,
                                  headerBuilder:
                                      (BuildContext context, bool isExpanded) {
                                    return Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: ListTile(
                                            title: Text(
                                          item.header,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )));
                                  },
                                  isExpanded: item.isExpanded,
                                  body: Padding(
                                      padding: EdgeInsets.all(25),
                                      child: Container(
                                        child: Center(
                                            child: Text(item.body,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ))),
                                      )));
                            }).toList(),
                          ),
                        )),
                  ],
                ))));
  }
}
