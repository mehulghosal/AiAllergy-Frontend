import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'dashboard.dart';

class Allergens extends StatefulWidget {
  @override
  AllergensState createState() => new AllergensState();
}

List<String> allergies = ['Nuts','Cheese'];

class AllergensState extends State<Allergens> {
  final TextEditingController textEditingController = new TextEditingController();

//  static List<List<String>> allergensList = new List();
//  static List<String> allergens1 = ["Nuts","0"];
//  static List<String> allergens2 = ["Dairy","1"];
//  allergensList.add(allergens1);
//  allergensList.add(allergens2);

  @override
  Widget build(BuildContext context) {
    return  Scaffold (
        body: Stack (
          children: <Widget>[
            Container(
                child: ListView.builder(
                  itemCount: allergies.length,
                  itemBuilder: (context, index) {
                    return new Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
//                        color: Color(0xFF089CFF0),
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
                        cursorColor: Theme.of(context).textSelectionColor,
                        style: TextStyle(color: Theme.of(context).textSelectionColor, fontSize: 15.0),
                        controller: textEditingController,
                        decoration: InputDecoration.collapsed (
                          hintText: 'Enter your allergy...',
                          hintStyle: TextStyle(color: Theme.of(context).hintColor),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    child: new Container(
                      margin: new EdgeInsets.symmetric(horizontal: 8),
                      child: new IconButton(
                        icon: new Icon(Icons.send),
                        iconSize: 20,
                        onPressed: () => addItem(textEditingController.text),
                        color: Theme.of(context).textSelectionColor,
                      ),
                    ),
                    color: Colors.white,
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
  void addItem(index){
    setState((){
      allergies.add(index);
    });
  }
}