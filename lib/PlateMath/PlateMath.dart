import 'package:flutter/material.dart';
import 'package:gym_app/PlateMath/DisplayPlateButtons.dart';
import 'package:gym_app/PlateMath/DisplayPlates.dart';
import 'package:gym_app/PlateMath/PlateChange.dart';
typedef AddCallBack = void Function(int n);
class PlateMath extends StatefulWidget {
  PlateMath({Key key}) : super(key: key);
  @override
  _PlateMath createState() => new _PlateMath();
}
class _PlateMath extends State<PlateMath> {
  @override
  var total = 0.0;
  List platess = [];
  List showPlates = [];
  final myController = TextEditingController();
  bool plateBool45 = false;

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
  List weights = [50.0,45.0, 35.0, 25.0, 10.0, 5.0, 2.5];
  List plateMath(double weight) {
    double barWeight = 45.0;
    List plates = [];
    double rem = weight - barWeight;
    while (rem > 0) {
      bool found = false;
      for (int i = 0; i < weights.length; i++) {
        double amount = weights[i] * 2;
        if (amount <= rem) {
          rem -= amount;
          plates.add(weights[i]);
          found = true;
          break;
        }
      }
      if (!found) {
        break;
      }
    }
    platess= plates;
    return platess;
  }
  void setShowPlates(List values){
    setState(() {
      showPlates = values;
    });
  }
  List printPlate(double weights){
    setState(() {
      return plateMath(weights);
    });
  }

  void plateAdd(double which) {
    setState(() {
      if (which ==0.0) total =0.0;
      total+= which;
    });
  }
  List firstHalfList(){
    List a = [];
    for (int i = 0;i<weights.length~/2;i++)a.add(weights[i]);
    return a;
  }
  List lastHalfList(){
    List a = [];
    for (int i = weights.length~/2;i<weights.length;i++) a.add(weights[i]);
    return a;
  }
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  void _showModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
              color: Colors.red[600],
              height: 600.0,
              child: SizedBox(
                child: Row(
                  children: <Widget>[
                    new Center(


                    )

                  ],
                ),
              )
          );
        });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text('Plate Math'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.keyboard_arrow_down),
            onPressed: _showModalSheet,
          )
        ],
      ),
      body: new Container(
          child: new Column(
              children: <Widget>[
                SizedBox(height: 50.0),
                Container(
                  //padding: EdgeInsets.only(top:30.0),
                  child: DisplayPlateButtons(
                      addMethod: plateAdd,
                      plates: firstHalfList()
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  child: DisplayPlateButtons(
                      addMethod: plateAdd,
                      plates: lastHalfList()
                  ),
                ),
                SizedBox(height: 10.0,),
                SizedBox(
                    height: 72.0,
                    child: Column(children: <Widget>[
                      Text(total.toString(),
                        style: new TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      RaisedButton(
                        onPressed: () => plateAdd(0.0),
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
                            decoration: new InputDecoration(
                              //fillColor: Colors.white,
                                hintText: 'Enter Weight'
                            ),
                            keyboardType: TextInputType.number,
                            controller: myController,
                          )),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      RaisedButton(
                        onPressed: () {
                          setShowPlates(plateMath(double.parse(myController.text.toString())));
                        },//plateMath(double.parse(myController.text)),
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
                    padding: EdgeInsets.only(top:30.0),
                    child: DisplayPlates(
                      values: showPlates,
                    )
                )
              ]
          )
      ),
    );

  }
}

