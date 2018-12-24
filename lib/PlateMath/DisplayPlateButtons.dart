import 'package:flutter/material.dart';
class DisplayPlateButtons extends StatelessWidget{
  DisplayPlateButtons({this.plates});
  List plates;
  final colorDictionary = {
    50.0: Colors.orange[600],
    45.0: Colors.cyan[600],
    35.0: Colors.yellow[600],
    25.0: Colors.black,
    10.0: Colors.green[600],
    5.0: Colors.red[600],
    2.5: Colors.purple[600]
  };
  List<Widget> CreateDisplay(){
    List<Widget> a = [];
    for (int i = 0;i<plates.length;i++) {
      a.add(new PlateButtons(
        plate: plates[i],
        color: colorDictionary[plates[i]],
      )
      );
    }
    return a;
  }
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Row(
        children: CreateDisplay(),
      ),
    );

  }
}
class PlateButtons extends StatelessWidget{
  final double plate;
  final Color color;
  // final _PlateMath  _plateMath;
  const PlateButtons({this.plate, this.color});
  Widget build(BuildContext context){
    return Center(
        child: FloatingActionButton(
          child: new Text(plate.toInt().toString()),
          // onPressed: () => plateAdd(plate),
          backgroundColor: color,
        )

    );
  }
}
