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
            alignment: new Alignment(0,-.8),
            child: Text("About AiAllergy",
              style: new TextStyle(
                fontSize: 40.0,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container (
            alignment: new Alignment(0,-.45),
            child: Text("   Though this app was developed for PennApps 2019f, We made it out of a concern of other people with asllergies. Two of our developers suffer from "
                "serious allergies, and we have not been able ot find a reliable resource to identify potenetial risks. We decided to pull many public datasets and scrape mutliple "
                "food-related APIs to create our own, comprehensive database. We hope that this may bring some security to people's minds. ",
              style: new TextStyle(
                fontSize: 20.0,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container (
            alignment: new Alignment(0, .6),
            child: Text("   We are a team of four high school students that are dedicated to building new ideas. Though we crave the challenge that comes from learning a new language or framework,"
                "we also want to positvely impact other's lives with our creations!",
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