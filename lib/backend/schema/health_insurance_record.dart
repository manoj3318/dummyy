import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HealthInsuranceRecord extends FirestoreRecord {
  HealthInsuranceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "whatsCovered" field.
  List<DocumentReference>? _whatsCovered;
  List<DocumentReference> get whatsCovered => _whatsCovered ?? const [];
  bool hasWhatsCovered() => _whatsCovered != null;

  // "planName" field.
  String? _planName;
  String get planName => _planName ?? '';
  bool hasPlanName() => _planName != null;

  // "planType" field.
  List<PlanTypeStruct>? _planType;
  List<PlanTypeStruct> get planType => _planType ?? const [];
  bool hasPlanType() => _planType != null;

  void _initializeFields() {
    _whatsCovered = getDataList(snapshotData['whatsCovered']);
    _planName = snapshotData['planName'] as String?;
    _planType = getStructList(
      snapshotData['planType'],
      PlanTypeStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('healthInsurance');

  static Stream<HealthInsuranceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HealthInsuranceRecord.fromSnapshot(s));

  static Future<HealthInsuranceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HealthInsuranceRecord.fromSnapshot(s));

  static HealthInsuranceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HealthInsuranceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HealthInsuranceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HealthInsuranceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HealthInsuranceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HealthInsuranceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHealthInsuranceRecordData({
  String? planName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'planName': planName,
    }.withoutNulls,
  );

  return firestoreData;
}

class HealthInsuranceRecordDocumentEquality
    implements Equality<HealthInsuranceRecord> {
  const HealthInsuranceRecordDocumentEquality();

  @override
  bool equals(HealthInsuranceRecord? e1, HealthInsuranceRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.whatsCovered, e2?.whatsCovered) &&
        e1?.planName == e2?.planName &&
        listEquality.equals(e1?.planType, e2?.planType);
  }

  @override
  int hash(HealthInsuranceRecord? e) =>
      const ListEquality().hash([e?.whatsCovered, e?.planName, e?.planType]);

  @override
  bool isValidKey(Object? o) => o is HealthInsuranceRecord;
}
