import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_app/data/exercise.dart';

Stream<QuerySnapshot>  getExerciseList(String a){
  return (Firestore.instance
      .collection('Exercises')
      .orderBy(a)
      .snapshots());
}
Future<List<Exercise>> getExercises()async{
  return [];
}