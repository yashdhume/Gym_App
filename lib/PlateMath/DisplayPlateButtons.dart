import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';
import 'package:gym_app/ViewModel.dart';
class DisplayPlateButtons extends StatelessWidget{
  final AddPlateCallback addMethod;
  DisplayPlateButtons({this.plates, this.addMethod});
  List plates;
  List<Widget> CreateDisplay(ViewModel model){
    List<Widget> a = [];
    for (int i = 0;i<plates.length;i++) {
      a.add(new PlateButtons(
        addValue: addMethod,
        plate: plates[i],
        color: model.colorDictionary[plates[i]],
      )
      );
    }
    return a;
  }
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ViewModel>(
        builder: (context, child, model) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: CreateDisplay(model),
        )
    );

  }
}
typedef AddPlateCallback = void Function(double value);
class PlateButtons extends StatelessWidget{
  final double plate;
  final Color color;
  final AddPlateCallback addValue;
  const PlateButtons({this.plate, this.color, this.addValue});
  Widget build(BuildContext context){
    return Center(
        child: FloatingActionButton(
          child: new Text(plate.toString()),
           onPressed: (){
            addValue(plate);
           },
          backgroundColor: color,
        )

    );
  }
}
