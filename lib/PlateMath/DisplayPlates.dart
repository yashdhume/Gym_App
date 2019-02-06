import 'package:flutter/material.dart';


class DisplayPlate extends StatelessWidget {
  final Color color;
  final double weight;

  DisplayPlate({this.color, this.weight});

  Widget build(BuildContext context) {
    return new Container(
        padding: EdgeInsets.all(15.0),
        width:  100 + weight * 10,
        height: 50,
        //color: color,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0))),
        child: new Center(
            child: new Text(
          weight.toString(),
          style: new TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        )));
  }
}
