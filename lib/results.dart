import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';

class Results extends StatefulWidget {
  final String data;

  const Results({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  ResultsState createState() => new ResultsState();
}

class ResultsState extends State<Results> {

  double safety(double SCoef, double MCoef, List<double> serious, List<double> mild){
    double SSum, MSum = 0;
    for(int i=0; i<serious.length; i++) SSum+=serious[i];
    for(int i=0; i<mild.length; i++) MSum+=mild[i];
    return SSum*SCoef + MSum*MCoef;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold (
      body: new Stack (
        children: <Widget>[
//          TODO
          Text(safety(.7, .3, serious, mild).toString(), style: TextStyle(fontSize: 40, fontFamily: 'Open Sans', fontWeight: FontWeight.w400,)),
          Container(
            child: ListView(),
          ),
        ],
      ),
    );
  }
}