import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActivityListRecord extends FirestoreRecord {
  ActivityListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "activity" field.
  String? _activity;
  String get activity => _activity ?? '';
  bool hasActivity() => _activity != null;

  // "isChecked" field.
  bool? _isChecked;
  bool get isChecked => _isChecked ?? false;
  bool hasIsChecked() => _isChecked != null;

  // "time" field.
  int? _time;
  int get time => _time ?? 0;
  bool hasTime() => _time != null;

  // "isSelected" field.
  bool? _isSelected;
  bool get isSelected => _isSelected ?? false;
  bool hasIsSelected() => _isSelected != null;

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "admin" field.
  bool? _admin;
  bool get admin => _admin ?? false;
  bool hasAdmin() => _admin != null;

  void _initializeFields() {
    _activity = snapshotData['activity'] as String?;
    _isChecked = snapshotData['isChecked'] as bool?;
    _time = castToType<int>(snapshotData['time']);
    _isSelected = snapshotData['isSelected'] as bool?;
    _userID = snapshotData['userID'] as String?;
    _admin = snapshotData['admin'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('activityList');

  static Stream<ActivityListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActivityListRecord.fromSnapshot(s));

  static Future<ActivityListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ActivityListRecord.fromSnapshot(s));

  static ActivityListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActivityListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActivityListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActivityListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActivityListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActivityListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActivityListRecordData({
  String? activity,
  bool? isChecked,
  int? time,
  bool? isSelected,
  String? userID,
  bool? admin,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'activity': activity,
      'isChecked': isChecked,
      'time': time,
      'isSelected': isSelected,
      'userID': userID,
      'admin': admin,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActivityListRecordDocumentEquality
    implements Equality<ActivityListRecord> {
  const ActivityListRecordDocumentEquality();

  @override
  bool equals(ActivityListRecord? e1, ActivityListRecord? e2) {
    return e1?.activity == e2?.activity &&
        e1?.isChecked == e2?.isChecked &&
        e1?.time == e2?.time &&
        e1?.isSelected == e2?.isSelected &&
        e1?.userID == e2?.userID &&
        e1?.admin == e2?.admin;
  }

  @override
  int hash(ActivityListRecord? e) => const ListEquality().hash(
      [e?.activity, e?.isChecked, e?.time, e?.isSelected, e?.userID, e?.admin]);

  @override
  bool isValidKey(Object? o) => o is ActivityListRecord;
}
