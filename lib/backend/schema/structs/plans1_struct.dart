// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Plans1Struct extends FFFirebaseStruct {
  Plans1Struct({
    PlansStruct? value,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _value = value,
        super(firestoreUtilData);

  // "value" field.
  PlansStruct? _value;
  PlansStruct get value => _value ?? PlansStruct();
  set value(PlansStruct? val) => _value = val;
  void updateValue(Function(PlansStruct) updateFn) =>
      updateFn(_value ??= PlansStruct());
  bool hasValue() => _value != null;

  static Plans1Struct fromMap(Map<String, dynamic> data) => Plans1Struct(
        value: PlansStruct.maybeFromMap(data['value']),
      );

  static Plans1Struct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? Plans1Struct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'value': _value?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'value': serializeParam(
          _value,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static Plans1Struct fromSerializableMap(Map<String, dynamic> data) =>
      Plans1Struct(
        value: deserializeStructParam(
          data['value'],
          ParamType.DataStruct,
          false,
          structBuilder: PlansStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'Plans1Struct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is Plans1Struct && value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([value]);
}

Plans1Struct createPlans1Struct({
  PlansStruct? value,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    Plans1Struct(
      value: value ?? (clearUnsetFields ? PlansStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

Plans1Struct? updatePlans1Struct(
  Plans1Struct? plans1, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    plans1
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlans1StructData(
  Map<String, dynamic> firestoreData,
  Plans1Struct? plans1,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (plans1 == null) {
    return;
  }
  if (plans1.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && plans1.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final plans1Data = getPlans1FirestoreData(plans1, forFieldValue);
  final nestedData = plans1Data.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = plans1.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlans1FirestoreData(
  Plans1Struct? plans1, [
  bool forFieldValue = false,
]) {
  if (plans1 == null) {
    return {};
  }
  final firestoreData = mapToFirestore(plans1.toMap());

  // Handle nested data for "value" field.
  addPlansStructData(
    firestoreData,
    plans1.hasValue() ? plans1.value : null,
    'value',
    forFieldValue,
  );

  // Add any Firestore field values
  plans1.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlans1ListFirestoreData(
  List<Plans1Struct>? plans1s,
) =>
    plans1s?.map((e) => getPlans1FirestoreData(e, true)).toList() ?? [];
