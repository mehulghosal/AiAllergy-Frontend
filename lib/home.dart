import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Scaffold (
        backgroundColor: new Color(0xFFFFFF),
        body: Container (
          child: Column (
            children: <Widget>[

            ],
          ),
        ),
      ),
    );
  }
}