import 'package:flutter/material.dart';
class DisplayPlates extends StatelessWidget{
  DisplayPlates({this.values});
  List values;
  final colorDictionary = {
    45: Colors.black,
    35: Colors.purple,
    25: Colors.blue,
    10: Colors.green,
    5 : Colors.red,
    2.5: Colors.pink
  };
  List<Widget> CreateDisplay(){
    List<Widget> a = [];
    if (values.isEmpty) {
      a.add(new DisplayPlate(color: Colors.grey, weight: 0));
      return a;
    }
    for (int i = values.length-1; i > -1; i--) {
      a.add(new DisplayPlate(
        color: colorDictionary[values[i]],
        weight: values[i],
      ));
    }
    return a;
  }
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: CreateDisplay(),
    );
  }
}
class DisplayPlate extends StatelessWidget{
  final Color color;
  final double weight;
  DisplayPlate({this.color, this.weight});

  Widget build(BuildContext context){
    return new Container(
      padding: EdgeInsets.all(15.0),
      width: 150.0,
      color: color,
      child: new Center(
        child: new Text(weight.toString(),
          style: new TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        )
      )
    );
  }
}