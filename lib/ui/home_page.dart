import 'package:flutter/material.dart';
import 'package:gym_app/PlateMath/PlateMain.dart';
import 'package:gym_app/ExercisesList/ListExercises.dart';
import 'package:gym_app/data/auth.dart';
class HomePage extends StatelessWidget{
  final Auth auth;
  final VoidCallback onSignedOut;
  HomePage({this.auth, this.onSignedOut});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        children: <Widget>[
          SizedBox(height: 100,),
          RaisedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PlateMain())), child: Text('Plate Math'),), 
          SizedBox(height: 20,),
          RaisedButton(onPressed:() => Navigator.push(context, MaterialPageRoute(builder: (context) => ListExercises())), child: Text('List Exercises'),),
          SizedBox(height: 20,),
          RaisedButton(onPressed: onSignedOut, child: Text('Sign Out'),)
        ],
      ),),
    );
  }
}