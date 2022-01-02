import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';

class FormFirstPage extends StatelessWidget {
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
            body: Stack(children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset(
                    'official_arjuntile2.png',
                    repeat: ImageRepeat.repeat,
                  )),
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: FractionallySizedBox(
                          heightFactor: 0.75,
                          child: Container(
                              //height: 200,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                border: Border.all(
                                  color: Colors.grey[100],
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              alignment: Alignment.center,
                              child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: FractionallySizedBox(
                                                //heightFactor: 0.95,
                                                child: Container(
                                                    child: Center(
                                                        child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 10,
                                                                    right: 10),
                                                            child: SingleChildScrollView(
                                                                child: RichText(
                                                                    textAlign: TextAlign.center,
                                                                    text: TextSpan(children: <TextSpan>[
                                                                      TextSpan(
                                                                        text:
                                                                            'Since we are an ever-growing database, it would be a great help to us if you could submit any new additions that we have not yet included in our list. To enter a submission, tap the button below and provide the details of the product. ',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                22,
                                                                            fontWeight:
                                                                                FontWeight.normal),
                                                                      ),
                                                                      TextSpan(
                                                                        text:
                                                                            '\n\nPlease be as specific as possible to eliminate any chance of confusion. ',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                21,
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                      TextSpan(
                                                                        text:
                                                                            '\n\nWe appreciate your help and support!',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                21,
                                                                            fontWeight:
                                                                                FontWeight.normal),
                                                                      )
                                                                    ])))))))),
                                        /*SizedBox(
                                            height: 10,
                                          ),*/
                                        Container(
                                            child: new Center(
                                                //child: SizedBox(
                                                //width: 225,
                                                //height: 40,
                                                child: RaisedButton(
                                                    color: Colors.grey[350],
                                                    child: Text(
                                                      'Enter a Submission',
                                                      style: TextStyle(
                                                          fontSize: 17),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  FormValidate()));
                                                    })) /*)*/),
                                      ]))))))
            ])));
  }
}

class FormValidate extends StatefulWidget {
  @override
  _FormValidateState createState() => _FormValidateState();
}

String _meatType;
String _productName;
//String _firstLetter;  //debugging tool
//List<String> _otherWords = [];  //debugging tool
//List<int> _numberArrayPlaces = [];  //debugging tool

class _FormValidateState extends State<FormValidate> {
  List<DropdownMenuItem<String>> listDrop = [];
  String selected;
  final myController = TextEditingController();
  void loadData() {
    listDrop = [];
    listDrop.add(
        new DropdownMenuItem(child: new Text('Gelatin'), value: 'Gelatin'));
    listDrop
        .add(new DropdownMenuItem(child: new Text('Rennet'), value: 'Rennet'));
    listDrop.add(new DropdownMenuItem(
        child: new Text('Lard/Tallow'), value: 'Lard/Tallow'));
    listDrop.add(
        new DropdownMenuItem(child: new Text('Anchovies'), value: 'Anchovies'));
    listDrop.add(new DropdownMenuItem(
        child: new Text('Animal Broth/Stock'), value: 'Animal Broth/Stock'));
    listDrop.add(
        new DropdownMenuItem(child: new Text('Carmine'), value: 'Carmine'));
    listDrop.add(new DropdownMenuItem(
        child: new Text('Isinglass'), value: 'Isinglass or Gelatin'));
    listDrop
        .add(new DropdownMenuItem(child: new Text('Other'), value: 'Other'));
  }

  @override
  Widget build(BuildContext context) {
    loadData();
    return new Theme(
        data: new ThemeData(
            primaryColor: Colors.red, cardColor: Colors.grey[350]),
        child: Scaffold(
            appBar: AppBar(
              title: Text('Subtly Meat'),
            ),
            backgroundColor: Colors.white,
            body: Stack(children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset(
                    'official_arjuntile2.png',
                    repeat: ImageRepeat.repeat,
                  )),
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(
                              color: Colors.grey[200],
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          alignment: Alignment.center,
                          child: Padding(
                              padding: EdgeInsets.all(15),
                              child: SizedBox(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                    Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[400],
                                          border: Border.all(
                                            color: Colors.grey[400],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: new Center(
                                          child: ButtonTheme(
                                              alignedDropdown: true,
                                              child: new DropdownButton(
                                                isExpanded: true,
                                                dropdownColor: Colors.grey[400],
                                                value: selected,
                                                items: listDrop,
                                                hint: new Text('Select Type'),
                                                onChanged: (value) {
                                                  selected = value;
                                                  _meatType = selected;
                                                  setState(() {});
                                                },
                                              )),
                                        )),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                        width: 210,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.grey[400]),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: new TextFormField(
                                              controller: myController,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder:
                                                    InputBorder.none,
                                                hintText: 'Product Name',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                                suffixIcon: Icon(Icons.create,
                                                    color: Colors.black),
                                              ),
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ))),
                                    Container(
                                        child: Text(
                                      "Special Characters /, !, *, \$, #, \\, &, ), (, =, %, are not allowed",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 10),
                                    )),
                                    Builder(
                                        builder: (context) => RaisedButton(
                                            color: Colors.red,
                                            onPressed: () {
                                              if (selected == null ||
                                                  (myController == null ||
                                                      myController.text
                                                              .trim() ==
                                                          "")) {
                                                Scaffold.of(context)
                                                    .showSnackBar(SnackBar(
                                                        duration: Duration(
                                                            milliseconds: 800),
                                                        backgroundColor:
                                                            Colors.black,
                                                        content: Text(
                                                          'Please select a type and enter a product',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.red),
                                                        )));
                                              } else if ((myController.text
                                                          .contains('/') ==
                                                      true) ||
                                                  (myController.text
                                                          .contains('!') ==
                                                      true) ||
                                                  (myController.text
                                                          .contains('*') ==
                                                      true) ||
                                                  (myController.text
                                                          .contains('\$') ==
                                                      true) ||
                                                  (myController.text
                                                          .contains('#') ==
                                                      true) ||
                                                  (myController.text
                                                          .contains('\\') ==
                                                      true) ||
                                                  (myController.text
                                                          .contains('&') ==
                                                      true) ||
                                                  (myController.text
                                                          .contains('(') ==
                                                      true) ||
                                                  (myController.text
                                                          .contains(')') ==
                                                      true) ||
                                                  (myController.text
                                                          .contains('=') ==
                                                      true) ||
                                                  (myController.text
                                                          .contains('%') ==
                                                      true)) {
                                                Scaffold.of(context)
                                                    .showSnackBar(SnackBar(
                                                        duration: Duration(
                                                            milliseconds: 800),
                                                        backgroundColor:
                                                            Colors.black,
                                                        content: Text(
                                                          'Please enter valid characters',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.red),
                                                        )));
                                              } else {
                                                _productName =
                                                    myController.text;
                                                _productName = _productName[0]
                                                        .toUpperCase() +
                                                    _productName.substring(1);
                                                for (var i = 0;
                                                    i < _productName.length;
                                                    i++) {
                                                  if (_productName[i] == ' ') {
                                                    _productName = _productName
                                                            .substring(
                                                                0, i + 1) +
                                                        _productName[i + 1]
                                                            .toUpperCase() +
                                                        _productName
                                                            .substring(i + 2);
                                                  }
                                                }
                                                //_firstLetter = _productName[0].toUpperCase();
                                                //print("selected: $_meatType"); //debugging tool
                                                //print("provided: $_productName"); //debugging tool
                                                //print(_productName.length); //debugging tool
                                                //print(_numberArrayPlaces); //debugging tool
                                                //print(_otherWords); //debugging tool
                                                myController.clear();
                                                createSubmissionRecord(
                                                    _productName);
                                                Navigator.pop(context);
                                              }
                                            },
                                            child: Text('Submit',
                                                style: TextStyle(
                                                    color: Colors.white))))
                                  ]))))))
            ])));
  }
}

final dbreference = Firestore.instance;
void createSubmissionRecord(String name) async {
  List<String> splitList = name.split(" ");
  List<String> indexList = [];

  for (int i = 0; i < splitList.length; i++) {
    for (int y = 1; y < splitList[i].length + 1; y++) {
      indexList.add(splitList[i].substring(0, y).toLowerCase());
    }
  }

  for (int j = 0; j < splitList.length; j++) {
    for (int h = 0; h < splitList.length; h++) {
      if (h != j) {
        indexList.add(splitList[j].substring(0).toLowerCase() + " ");
        for (int y = 1; y < splitList[h].length + 1; y++) {
          indexList.add(splitList[j].substring(0).toLowerCase() +
              " " +
              splitList[h].substring(0, y).toLowerCase());
        }
      }
    }
  }

  if (splitList.length > 1) {
    for (int k = splitList[0].length + splitList[1].length + 2;
        k < name.length + 1;
        k++) {
      indexList.add(
          splitList[0].substring(0, splitList[0].length).toLowerCase() +
              " " +
              splitList[1].substring(0, splitList[1].length - 1).toLowerCase() +
              name
                  .substring(splitList[0].length + splitList[1].length, k)
                  .toLowerCase());
    }
  }
  //print(indexList); //debugging tool

  await dbreference.collection('Subtly_Meat').document(_productName).setData({
    'name': _productName,
    'type': _meatType,
    'status': "pending",
    'searchIndex': indexList
  }, merge: false);
}
