import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'SortPopUpMenu.dart';
import 'package:gym_app/data/database.dart';

class ListExercises extends StatefulWidget {
  _ListExercises createState() => new _ListExercises();
}

class _ListExercises extends State<ListExercises> {
  void initState() {
    _streamList = getExerciseList("Muscle");
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot documents) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              documents['Exercise'],
              style: Theme.of(context).textTheme.headline,
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.pinkAccent),
            padding: const EdgeInsets.all(10),
            child: Text(
              documents['Muscle'].toString(),
            ),
          )
        ],
      ),
    );
  }

  Stream<QuerySnapshot> _streamList;

  void streamer(String a) {
    setState(() {
      _streamList = getExerciseList(a);
    });
  }

  String choicee = 'Muscle';

  void choiceAction(String choice) {
    if (choice == SortPopUpMenuConstants.exercise) {
      choicee = 'Exercise';
      streamer(choicee);
    } else if (choice == SortPopUpMenuConstants.muscle) {
      choicee = 'Muscle';
      streamer(choicee);
    }
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('List'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search), onPressed: null),
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return SortPopUpMenuConstants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      body: StreamBuilder(
          stream: _streamList,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              // streamer(choicee);
              return new CircularProgressIndicator();
            }
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            return ListView.builder(
              itemExtent: 80.0,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) =>
                  _buildListItem(context, snapshot.data.documents[index]),
            );
          }),
    );
  }
}
