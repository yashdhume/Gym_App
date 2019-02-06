import 'package:flutter/material.dart';
import 'package:gym_app/PlateMath/DisplayPlateButtons.dart';
import 'package:gym_app/PlateMath/DisplayPlates.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gym_app/domain/view_model.dart';
import 'package:gym_app/domain/app_state.dart';
import 'package:redux/redux.dart';

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

  /*@override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }*/

  List plateMath(double weight, ViewModel model) {
    List plates = [];
    double rem = weight - model.barWeight;
    while (rem > 0) {
      bool found = false;
      for (int i = 0; i < model.plates.length; i++) {
        double amount = model.plates[i] * 2;
        if (amount <= rem) {
          rem -= amount;
          plates.add(model.plates[i]);
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
    for (int i = 0; i < model.plates.length ~/ 2; i++) a.add(model.plates[i]);
    return a;
  }

  List lastHalfList(ViewModel model) {
    List a = [];
    for (int i = model.plates.length ~/ 2; i < model.plates.length; i++)
      a.add(model.plates[i]);
    return a;
  }

  void enterButton(ViewModel model) {
    setShowPlates(
        plateMath(double.parse(_myController.text.toString()), model));
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
  List<Widget> CreateDisplay(ViewModel model, List values) {
    List<Widget> a = [];

    for (int i = 0; i < values.length; i++) {
      a.add(new DisplayPlate(
        color: model.theme.colorDictionary[values[i]],
        weight: values[i],
      ));
    }
    return a;
  }

  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      converter: (Store<AppState> store) => ViewModel.create(store),
      builder: (BuildContext context, ViewModel model) => Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new GestureDetector(
        onTap: () {
          // call this method here to hide soft keyboard
          FocusScope.of(context).requestFocus(new FocusNode());

          SystemChannels.textInput.invokeMethod('TextInput.hide');
        },
        child: new ListView(children: <Widget>[
          new Column(children: <Widget>[
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
            ),
            Row(
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
                  textInputAction: TextInputAction.done,
                )),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                RaisedButton(
                  onPressed: () => enterButton(model),
                  //plateMath(double.parse(_myController.text)),
                  child: new Text("Enter"),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(50.0)),
                  color: Colors.red[600],
                ),
                Padding(
                  padding:  EdgeInsets.all(40.0),
                ),
              ],
            ),
            new Container(
                //padding: EdgeInsets.only(top: 30.0),
                child: Column(children:CreateDisplay(model, _showPlates,
            )))
          ])
        ]),
      )));
  }
}
