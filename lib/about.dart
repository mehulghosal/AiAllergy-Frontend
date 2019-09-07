import 'package:flutter/material.dart';

import 'dashboard.dart';

class About extends StatefulWidget {
  @override
  AboutState createState() => new AboutState();
}

class AboutState extends State<About> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFEFEEE8),
      body: Stack (
        children: <Widget>[
          Container (
            alignment: new Alignment(0,-1),
            child: Text("About AiAllergy",
              style: new TextStyle(
                fontSize: 40.0,
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