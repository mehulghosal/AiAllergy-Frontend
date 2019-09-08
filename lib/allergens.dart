import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'dashboard.dart';

class Allergens extends StatefulWidget {
  @override
  AllergensState createState() => new AllergensState();
}


class AllergensState extends State<Allergens> {
  final TextEditingController textEditingController = new TextEditingController();

  List<String> allergies = [];

  Directory dir;
  File jsonFile;
  String fileName = "fuckthisuttershitihatemylife.json";
  bool fileExists = false;


  @override
  void initState() {
    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold (
        body: Stack (
          children: <Widget>[
            Container (
              alignment: new Alignment(0,-0.9),
              child: Text (
                'Allergens',
                style: new TextStyle (
                  fontFamily: 'Lato',
                  fontSize: 40,
                ),
              ),
            ),
            Container(
              color: Color(0xFFEFEEE8),
              alignment: new Alignment(0,-0.7),
                child: ListView.builder(
                  itemCount: allergies.length,
                  itemBuilder: (context, index) {
                    return new Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        color: Color(0xFF089CFF0),
                        child: ListTile(
                            leading: Text(
                              allergies[index],
                              style: new TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w300,
                              ),
                            )
                        ),
                      ),
                      actions: <Widget>[
                        new IconSlideAction(
                            caption: 'Delete',
                            color: Colors.red,
                            icon: Icons.delete,
                            onTap: () => deleteItem(index)
                        ),
                      ],
                    );
                  },
                )
            ),
            Container (
              alignment: new Alignment(0, 1),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Container(
                      child: TextField(
                        autofocus: true,
                        cursorColor: Colors.black,
                        style: TextStyle(color: Colors.black54, fontSize: 15.0),
                        controller: textEditingController,
                        decoration: InputDecoration.collapsed (
                          hintText: 'Enter your allergy...',
                          hintStyle: TextStyle(color: Colors.black12),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    child: new Container(
                      margin: new EdgeInsets.symmetric(horizontal: 8),
                      child: new IconButton(
                        icon: new Icon(Icons.file_upload),
                        iconSize: 20,
                        onPressed: () => addItem(textEditingController.text),
                        color: Theme.of(context).textSelectionColor,
                      ),
                    ),
                    color: Color(0xFFEFEEE8),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }

  void deleteItem(index){
    setState((){
      allergies.removeAt(index);
    });
  }
  void addItem(yum){
    setState((){
      allergies.add(yum);
      writeToFile('allergy', yum);
    });
  }
  void writeToFile(String key, String value) {
    print("Writing to file!");
    Map<String, String> content = {key: value};


//    this.setState(() => fileContent = new Map<String, dynamic>.from(json.decode(jsonFile.readAsStringSync()).value));
//    print(fileContent);
  }
}