import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Container (
        decoration: BoxDecoration(color: Colors.transparent),
        child: Stack (
          children: <Widget>[
            Container (
                child: Image.asset(
                  'images/logo1.png',
                  height: 300,
                ),
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                alignment: new Alignment(0,-1.05)
            ),
            Container (
              child: ButtonTheme (
                height: 110.0,
                minWidth: 300.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/evaluate');
                  },
                  color: Color(0xFFACECD5),
                  child: const Text('Evaluate', style: TextStyle(fontSize: 40, fontFamily: 'Open Sans', fontWeight: FontWeight.w400,)),
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                ),
              ),
              alignment: new Alignment(0,-0.05)
            ),
            Container (
              child: ButtonTheme (
                height: 110.0,
                minWidth: 300.0,
                child: RaisedButton(
                  onPressed: () {},
                  color: Color(0xFF5BB7E5),
                  child: const Text('Allergens', style: TextStyle(fontSize: 40, fontFamily: 'Open Sans', fontWeight: FontWeight.w400,)),
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                ),
              ),
              alignment: new Alignment(0,0.375)
            ),
            Container (
              child: ButtonTheme (
                height: 110.0,
                minWidth: 300.0,
                child: RaisedButton(
                  onPressed: () {},
                  color: Color(0xFFE57472),
                  child: const Text('Emergency', style: TextStyle(fontSize: 40, fontFamily: 'Open Sans', fontWeight: FontWeight.w400,)),
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                ),
              ),
              alignment: new Alignment(0,0.8)
            ),
          ],
        ),
    );
  }
}