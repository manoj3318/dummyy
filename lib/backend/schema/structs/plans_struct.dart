// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlansStruct extends FFFirebaseStruct {
  PlansStruct({
    String? name,
    String? date,
    String? updates,
    String? string,
    String? img,
    String? selectedImg,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _date = date,
        _updates = updates,
        _string = string,
        _img = img,
        _selectedImg = selectedImg,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;
  bool hasDate() => _date != null;

  // "updates" field.
  String? _updates;
  String get updates => _updates ?? '';
  set updates(String? val) => _updates = val;
  bool hasUpdates() => _updates != null;

  // "string" field.
  String? _string;
  String get string => _string ?? '';
  set string(String? val) => _string = val;
  bool hasString() => _string != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  set img(String? val) => _img = val;
  bool hasImg() => _img != null;

  // "selectedImg" field.
  String? _selectedImg;
  String get selectedImg => _selectedImg ?? '';
  set selectedImg(String? val) => _selectedImg = val;
  bool hasSelectedImg() => _selectedImg != null;

  static PlansStruct fromMap(Map<String, dynamic> data) => PlansStruct(
        name: data['name'] as String?,
        date: data['date'] as String?,
        updates: data['updates'] as String?,
        string: data['string'] as String?,
        img: data['img'] as String?,
        selectedImg: data['selectedImg'] as String?,
      );

  static PlansStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PlansStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'date': _date,
        'updates': _updates,
        'string': _string,
        'img': _img,
        'selectedImg': _selectedImg,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'updates': serializeParam(
          _updates,
          ParamType.String,
        ),
        'string': serializeParam(
          _string,
          ParamType.String,
        ),
        'img': serializeParam(
          _img,
          ParamType.String,
        ),
        'selectedImg': serializeParam(
          _selectedImg,
          ParamType.String,
        ),
      }.withoutNulls;

  static PlansStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlansStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        updates: deserializeParam(
          data['updates'],
          ParamType.String,
          false,
        ),
        string: deserializeParam(
          data['string'],
          ParamType.String,
          false,
        ),
        img: deserializeParam(
          data['img'],
          ParamType.String,
          false,
        ),
        selectedImg: deserializeParam(
          data['selectedImg'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PlansStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlansStruct &&
        name == other.name &&
        date == other.date &&
        updates == other.updates &&
        string == other.string &&
        img == other.img &&
        selectedImg == other.selectedImg;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, date, updates, string, img, selectedImg]);
}

PlansStruct createPlansStruct({
  String? name,
  String? date,
  String? updates,
  String? string,
  String? img,
  String? selectedImg,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlansStruct(
      name: name,
      date: date,
      updates: updates,
      string: string,
      img: img,
      selectedImg: selectedImg,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlansStruct? updatePlansStruct(
  PlansStruct? plans, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    plans
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlansStructData(
  Map<String, dynamic> firestoreData,
  PlansStruct? plans,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (plans == null) {
    return;
  }
  if (plans.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && plans.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final plansData = getPlansFirestoreData(plans, forFieldValue);
  final nestedData = plansData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = plans.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlansFirestoreData(
  PlansStruct? plans, [
  bool forFieldValue = false,
]) {
  if (plans == null) {
    return {};
  }
  final firestoreData = mapToFirestore(plans.toMap());

  // Add any Firestore field values
  plans.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlansListFirestoreData(
  List<PlansStruct>? planss,
) =>
    planss?.map((e) => getPlansFirestoreData(e, true)).toList() ?? [];
