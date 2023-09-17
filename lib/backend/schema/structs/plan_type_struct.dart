// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlanTypeStruct extends FFFirebaseStruct {
  PlanTypeStruct({
    String? productName,
    String? productDescription,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _productName = productName,
        _productDescription = productDescription,
        super(firestoreUtilData);

  // "ProductName" field.
  String? _productName;
  String get productName => _productName ?? '';
  set productName(String? val) => _productName = val;
  bool hasProductName() => _productName != null;

  // "productDescription" field.
  String? _productDescription;
  String get productDescription => _productDescription ?? '';
  set productDescription(String? val) => _productDescription = val;
  bool hasProductDescription() => _productDescription != null;

  static PlanTypeStruct fromMap(Map<String, dynamic> data) => PlanTypeStruct(
        productName: data['ProductName'] as String?,
        productDescription: data['productDescription'] as String?,
      );

  static PlanTypeStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PlanTypeStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'ProductName': _productName,
        'productDescription': _productDescription,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ProductName': serializeParam(
          _productName,
          ParamType.String,
        ),
        'productDescription': serializeParam(
          _productDescription,
          ParamType.String,
        ),
      }.withoutNulls;

  static PlanTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlanTypeStruct(
        productName: deserializeParam(
          data['ProductName'],
          ParamType.String,
          false,
        ),
        productDescription: deserializeParam(
          data['productDescription'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PlanTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlanTypeStruct &&
        productName == other.productName &&
        productDescription == other.productDescription;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([productName, productDescription]);
}

PlanTypeStruct createPlanTypeStruct({
  String? productName,
  String? productDescription,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlanTypeStruct(
      productName: productName,
      productDescription: productDescription,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlanTypeStruct? updatePlanTypeStruct(
  PlanTypeStruct? planType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    planType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlanTypeStructData(
  Map<String, dynamic> firestoreData,
  PlanTypeStruct? planType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (planType == null) {
    return;
  }
  if (planType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && planType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final planTypeData = getPlanTypeFirestoreData(planType, forFieldValue);
  final nestedData = planTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = planType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlanTypeFirestoreData(
  PlanTypeStruct? planType, [
  bool forFieldValue = false,
]) {
  if (planType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(planType.toMap());

  // Add any Firestore field values
  planType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlanTypeListFirestoreData(
  List<PlanTypeStruct>? planTypes,
) =>
    planTypes?.map((e) => getPlanTypeFirestoreData(e, true)).toList() ?? [];
