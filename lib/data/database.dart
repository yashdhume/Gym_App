import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Stream<QuerySnapshot>  getExerciseList(String a){
  return (Firestore.instance
      .collection('Exercises')
      .orderBy(a)
      .snapshots());
}