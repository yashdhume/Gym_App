import 'package:flutter/material.dart';

class DisplayPlateChange extends StatelessWidget{
  final List plates = [50.0,45.0, 35.0, 25.0, 10.0, 5.0, 2.5];
 // PlateChange({this.plates});
  List<Widget> CreateDisplay(){
    List<Widget>a=[];
    for(int i=0; i<plates.length;i++){
      a.add(PlateChange(plate: plates[i]));
    }
    return a;
  }
  Widget build (BuildContext context){
    return new Center(
      child: Row(
        children: CreateDisplay()
      )
    );
  }
}
bool a = false;
class PlateChange extends StatelessWidget{
  final double plate;
  const PlateChange({this.plate});
  Widget build(BuildContext context){
    return Center(
      child: SwitchListTile(
        title: new Text(plate.toString()),
        value: a,
        //onChanged: _a(),
       // onChanged: {a=true},

      )
    );

  }
}