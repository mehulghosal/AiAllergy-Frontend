import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'dashboard.dart';

class Allergens extends StatefulWidget {
  @override
  AllergensState createState() => new AllergensState();
}

class AllergensState extends State<Allergens> {

  List<Container> allergensList(){

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold (
      body: new ListView (
        children: <Widget>[
          new Slidable(
            delegate: new SlidableDrawerDelegate(),
            actionExtentRatio: 0.25,
            child: new Container(
              color: Colors.white,
              child: new ListTile(
                leading: new CircleAvatar(
                  backgroundColor: Colors.indigoAccent,
                  child: new Text('$3'),
                  foregroundColor: Colors.white,
                ),
                title: new Text('Tile n°$3'),
                subtitle: new Text('SlidableDrawerDelegate'),
              ),
            ),
            actions: <Widget>[
              new IconSlideAction(
                caption: 'Delete',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () => _showSnackBar('Delete'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}