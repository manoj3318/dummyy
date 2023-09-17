import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<PlansStruct> _plansList = [];
  List<PlansStruct> get plansList => _plansList;
  set plansList(List<PlansStruct> _value) {
    _plansList = _value;
  }

  void addToPlansList(PlansStruct _value) {
    _plansList.add(_value);
  }

  void removeFromPlansList(PlansStruct _value) {
    _plansList.remove(_value);
  }

  void removeAtIndexFromPlansList(int _index) {
    _plansList.removeAt(_index);
  }

  void updatePlansListAtIndex(
    int _index,
    PlansStruct Function(PlansStruct) updateFn,
  ) {
    _plansList[_index] = updateFn(_plansList[_index]);
  }

  String _comparePlans = '';
  String get comparePlans => _comparePlans;
  set comparePlans(String _value) {
    _comparePlans = _value;
  }

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int _value) {
    _selectedIndex = _value;
  }

  String _firstName = '';
  String get firstName => _firstName;
  set firstName(String _value) {
    _firstName = _value;
  }

  int _selectedCompare = 1;
  int get selectedCompare => _selectedCompare;
  set selectedCompare(int _value) {
    _selectedCompare = _value;
  }

  int _intgers = 0;
  int get integers => _intgers;
  set integers(int _value) {
    _intgers = _value;
  }

  List<PlansStruct> _compare = [
    PlansStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"\",\"date\":\"\",\"updates\":\"\",\"string\":\"\",\"img\":\"\",\"selectedImg\":\"\"}')),
    PlansStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"\",\"date\":\"\",\"updates\":\"\",\"string\":\"\",\"img\":\"\",\"selectedImg\":\"\"}'))
  ];
  List<PlansStruct> get compare => _compare;
  set compare(List<PlansStruct> _value) {
    _compare = _value;
  }

  void addToCompare(PlansStruct _value) {
    _compare.add(_value);
  }

  void removeFromCompare(PlansStruct _value) {
    _compare.remove(_value);
  }

  void removeAtIndexFromCompare(int _index) {
    _compare.removeAt(_index);
  }

  void updateCompareAtIndex(
    int _index,
    PlansStruct Function(PlansStruct) updateFn,
  ) {
    _compare[_index] = updateFn(_compare[_index]);
  }

  List<dynamic> _json = [];
  List<dynamic> get json => _json;
  set json(List<dynamic> _value) {
    _json = _value;
  }

  void addToJson(dynamic _value) {
    _json.add(_value);
  }

  void removeFromJson(dynamic _value) {
    _json.remove(_value);
  }

  void removeAtIndexFromJson(int _index) {
    _json.removeAt(_index);
  }

  void updateJsonAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _json[_index] = updateFn(_json[_index]);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
