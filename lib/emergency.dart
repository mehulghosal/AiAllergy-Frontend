import 'package:flutter/material.dart';

import 'dashboard.dart';

class Emergency extends StatefulWidget {
  @override
  EmergencyState createState() => new EmergencyState();
}

class EmergencyState extends State<Emergency> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFEFEEE8),
      body: Stack (
        children: <Widget>[
          Container (
            alignment: new Alignment(0,-.8),
            child: Text("What to do in Emergencies",
              style: new TextStyle(
                fontSize: 40.0,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container (
            alignment: new Alignment(0,-.45),
            child: Text("  blah ",
              style: new TextStyle(
                fontSize: 20.0,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container (
            alignment: new Alignment(0, .6),
            child: Text("   blah",
              style: new TextStyle(
                fontSize: 20.0,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],

      ),
    );
  }
}