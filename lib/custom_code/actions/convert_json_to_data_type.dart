// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<Plans1Struct>> convertJsonToDataType(
    List<dynamic> jsonArray) async {
  // convert json array into list of objects

  List<Plans1Struct> listOfStruct = [];
  for (var item in jsonArray) {
    listOfStruct.addAll([Plans1Struct.fromMap(item)]);
    print(listOfStruct);
  }
  return listOfStruct;
}
