import 'package:flutter/material.dart';
class DisplayPlates extends StatelessWidget{
  DisplayPlates({this.values});
  List values;
  final colorDictionary = {
    50.0: Colors.orange[600],
    45: Colors.cyan[600],
    35: Colors.yellow[600],
    25: Colors.black,
    10: Colors.green[600],
    5 : Colors.red[600],
    2.5: Colors.purple[600]
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
        //color: color,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0)
            )
        ),

        child: new Center(
            child: new Text(
              weight.toString(),
              style: new TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            )
        )
    );
  }
}