// Automatic FlutterFlow imports
import 'dart:core';

import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// ignore: non_constant_identifier_names
Future<List<PlansStruct>> convertJsonToDataType(List<dynamic> jsonArray) async {
  // convert json array into list of objects

  List<PlansStruct> listOfStruct = [];
  for (var item in jsonArray) {
    listOfStruct.add(PlansStruct.fromMap(item));
  }
  return listOfStruct;
}
