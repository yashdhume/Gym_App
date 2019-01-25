import 'package:flutter/material.dart';
import 'package:gym_app/PlateMath/DisplayPlateButtons.dart';
import 'package:gym_app/PlateMath/DisplayPlates.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:gym_app/ViewModel.dart';
import 'package:gym_app/PlateMath/PlateSettings.dart';

typedef AddCallBack = void Function(int n);

class PlateMath extends StatefulWidget {
  PlateMath({Key key}) : super(key: key);

  @override
  _PlateMath createState() => new _PlateMath();
}

class _PlateMath extends State<PlateMath> {
  @override
  var _total = 0.0;
  List _plate = [];
  List _showPlates = [];
  final _myController = TextEditingController();

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  List plateMath(double weight, ViewModel model) {
    List plates = [];
    double rem = weight - model.barWeight;
    while (rem > 0) {
      bool found = false;
      for (int i = 0; i < model.weights.length; i++) {
        double amount = model.weights[i] * 2;
        if (amount <= rem) {
          rem -= amount;
          plates.add(model.weights[i]);
          found = true;
          break;
        }
      }
      if (!found) {
        break;
      }
    }
    _plate = plates;
    return _plate;
  }

  void setShowPlates(List values) {
    setState(() {
      _showPlates = values;
    });
  }

  List printPlate(double weights, ViewModel model) {
    setState(() {
      return plateMath(weights, model);
    });
  }

  void plateAdd(double which) {
    setState(() {
      if (which == 0.0) _total = 0.0;
      _total += which;
    });
  }

  List firstHalfList(ViewModel model) {
    List a = [];
    for (int i = 0; i < model.weights.length ~/ 2; i++) a.add(model.weights[i]);
    return a;
  }

  List lastHalfList(ViewModel model) {
    List a = [];
    for (int i = model.weights.length ~/ 2; i < model.weights.length; i++)
      a.add(model.weights[i]);
    return a;
  }

  Widget build(BuildContext context) {
    return ScopedModelDescendant<ViewModel>(
        builder: (context, child, model) => Scaffold(
              body: new Container(
                  child: new Column(children: <Widget>[
                SizedBox(height: 50.0),
                Container(
                  //padding: EdgeInsets.only(top:30.0),
                  child: DisplayPlateButtons(
                      addMethod: plateAdd, plates: firstHalfList(model)),
                ),
                SizedBox(height: 10.0),
                Container(
                  child: DisplayPlateButtons(
                      addMethod: plateAdd, plates: lastHalfList(model)),
                ),
                SizedBox(height: 10.0),
                SizedBox(
                    height: 72.0,
                    child: Column(children: <Widget>[
                      Text(
                        _total.toString(),
                        style: new TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {
                          setShowPlates([]);
                          plateAdd(0.0);
                        },
                        child: new Text("Clear"),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(50.0)),
                        color: Colors.red[600],
                      )
                    ])),
                SizedBox(
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(40.0),
                      ),
                      new Flexible(
                          child: new TextField(
                        decoration:
                            new InputDecoration(hintText: 'Enter Weight'),
                        keyboardType: TextInputType.number,
                        controller: _myController,
                      )),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      RaisedButton(
                        onPressed: () => setShowPlates(plateMath(
                            double.parse(_myController.text.toString()),
                            model)),
                        //plateMath(double.parse(_myController.text)),
                        child: new Text("Enter"),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(50.0)),
                        color: Colors.red[600],
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                      ),
                    ],
                  ),
                ),
                new Container(
                    padding: EdgeInsets.only(top: 30.0),
                    child: DisplayPlates(
                      values: _showPlates,
                    ))
              ])),
            ));
  }
}
