import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_app/domain/view_model.dart';
import 'package:gym_app/domain/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
class DisplayPlateButtonss extends StatelessWidget {
  List<double> plates = [100, 55, 45, 35, 25, 10, 5, 2.5];

  Color colorChange(ViewModel model, value) {
    if (model.plates.contains(value))
      return model.theme.colorDictionary[value];
    else
      return Colors.grey;
  }

  List<Widget> CreateDisplay(ViewModel model) {
    List<Widget> a = [];
    for (int i = 0; i < plates.length ~/ 2; i++) {
      a.add(new PlateButtonss(
        plate: plates[i],
        color: colorChange(model, plates[i]),
      ));
    }
    return a;
  }

  List<Widget> CreateDisplay2(ViewModel model) {
    List<Widget> a = [];
    for (int i = plates.length ~/ 2; i < plates.length; i++) {
      a.add(new PlateButtonss(
        plate: plates[i],
        color: colorChange(model, plates[i]),
      ));
    }
    return a;
  }


  final _myController = TextEditingController();

  @override
  void changeBar(ViewModel model) {
    model.onSetBarWeight(double.parse(_myController.text));
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      converter: (Store<AppState> store) => ViewModel.create(store),
      rebuildOnChange: true,
      builder: (BuildContext context, ViewModel model) => new Center(
          child: new GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                SystemChannels.textInput.invokeMethod('TextInput.hide');
              },
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: CreateDisplay(model),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: CreateDisplay2(model),
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(40.0),
                        ),
                        new Flexible(
                            child: new TextField(
                          decoration: new InputDecoration(
                              hintText: 'Enter Bar Weight'),
                          keyboardType: TextInputType.number,
                          controller: _myController,
                        )),
                        Padding(
                          padding: EdgeInsets.all(40.0),
                        ),
                      ],
                    ),
                    new RaisedButton(
                      onPressed: () => changeBar(model),
                      //plateMath(double.parse(_myController.text)),
                      child: new Text("Enter"),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50.0)),
                      color: Colors.red[600],
                    ),
                  ]))));
  }
}
class PlateButtonss extends StatelessWidget {
  double plate;
  Color color;
  PlateButtonss({this.plate, this.color});

  void change(ViewModel model, double value) {
    if (model.plates.contains(value)) {
      model.onSetPlates([]..addAll(model.plates)
                          ..remove(value));
      color = Colors.grey;
    } else {
      model.onSetPlates([]..addAll(model.plates)..add(value));
      color = model.theme.colorDictionary[plate];
    }
  }

  Widget build(BuildContext context) {
    return StoreConnector<AppState,ViewModel>(
      converter: (Store<AppState> store) => ViewModel.create(store),
      builder: (BuildContext context, ViewModel model) => new Center(
              child: FloatingActionButton(
            onPressed: () => change(model, plate),
            child: Text(plate.toString()),
            backgroundColor: color,
          )),
    );
  }
}
