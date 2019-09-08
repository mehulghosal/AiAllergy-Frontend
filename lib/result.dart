import 'package:flutter/material.dart';

import 'dashboard.dart';

class Result extends StatefulWidget {
  @override
  ResultState createState() => new ResultState();
}

class ResultState extends State<Result> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFEFEEE8),
      body: Stack (
        children: <Widget>[
          Container (
            alignment: new Alignment(0,-.8),
            child: Text("Safety: ",
              style: new TextStyle(
                fontSize: 40.0,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

        ],

      ),
    );
  }
}