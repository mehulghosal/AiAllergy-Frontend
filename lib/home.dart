import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return new Container(
//      decoration: BoxDecoration(
//        color: Theme.of(context).primaryColor,
//      ),
      child: Scaffold (
        backgroundColor: new Color(0xFFFFFF),
        body: Center (
          child: Column (
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/AiAllergy_logo.svg'),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {},
                child: const Text('Evaluate', style: TextStyle(fontSize: 20)),
//                shape: new ShapetBorder()
              ),
            ],
          ),
        ),
      ),
    );
  }
}