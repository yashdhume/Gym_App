import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:gym_app/ViewModel.dart';

class DisplayPlateChange extends StatelessWidget {
  // PlateChange({this.plates});
  List<Widget> CreateDisplay(ViewModel model) {
    List<Widget> a = [];
    for (int i = 0; i < model.weights.length; i++) {
      a.add(PlateChange(plate: model.weights[i]));
    }
    return a;
  }

  Widget build(BuildContext context) {
    return ScopedModelDescendant<ViewModel>(
        builder: (context, child, model) =>
            Center(child: Row(children: CreateDisplay(model))));
  }
}

bool a = false;

class PlateChange extends StatelessWidget {
  final double plate;

  const PlateChange({this.plate});

  Widget build(BuildContext context) {
    return Center(
        child: SwitchListTile(
      title: new Text(plate.toString()),
      value: a,
      //onChanged: _a(),
      // onChanged: {a=true},
    ));
  }
}
