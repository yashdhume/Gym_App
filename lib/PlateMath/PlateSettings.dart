import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:gym_app/ViewModel.dart';
import 'package:flutter/services.dart';

class DisplayPlateButtonss extends StatelessWidget {
  List<double> plates = [100, 55, 45, 35, 25, 10, 5, 2.5];

  Color colorChange(ViewModel model, value) {
    if (model.weights.contains(value))
      return model.colorDictionary[value];
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
    model.barWeight = double.parse(_myController.text);
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  Widget build(BuildContext context) {
    return ScopedModelDescendant<ViewModel>(
        builder: (context, child, model) => new Center(
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
    if (model.weights.contains(value)) {
      model.removeWeight(value);
      color = Colors.grey;
    } else {
      model.addWeight(value);
      color = model.colorDictionary[plate];
    }
  }

  Widget build(BuildContext context) {
    return ScopedModelDescendant<ViewModel>(
      builder: (context, child, model) => new Center(
              child: FloatingActionButton(
            onPressed: () => change(model, plate),
            child: Text(plate.toString()),
            backgroundColor: color,
          )),
    );
  }
}
