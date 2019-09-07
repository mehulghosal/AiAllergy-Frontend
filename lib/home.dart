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
//        backgroundColor: new ,
        body: Column (
          children: <Widget>[
            Container (
              child: Image.asset(
                'images/AiAllergy_logo.svg',
              ),
              alignment: new Alignment(0,0),
            ),
            Column (
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  child: const Text('Evaluate', style: TextStyle(fontSize: 50, fontFamily: 'Avenir')),
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                ),
                SizedBox(height: 20),
                RaisedButton(
                  onPressed: () {},
                  child: const Text('Allergens', style: TextStyle(fontSize: 50, fontFamily: '')),
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                ),
                SizedBox(height: 20),
                ButtonTheme (
                  height: 100.0,
                  child: RaisedButton(
                    onPressed: () {},
                    child: const Text('Emergency', style: TextStyle(fontSize: 50, fontFamily: 'Avenir')),
                     shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),

                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}