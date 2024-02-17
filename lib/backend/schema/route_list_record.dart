import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RouteListRecord extends FirestoreRecord {
  RouteListRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "locationStart" field.
  LatLng? _locationStart;
  LatLng? get locationStart => _locationStart;
  bool hasLocationStart() => _locationStart != null;

  // "locationEnd" field.
  LatLng? _locationEnd;
  LatLng? get locationEnd => _locationEnd;
  bool hasLocationEnd() => _locationEnd != null;

  // "activityName" field.
  String? _activityName;
  String get activityName => _activityName ?? '';
  bool hasActivityName() => _activityName != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "activityTime" field.
  String? _activityTime;
  String get activityTime => _activityTime ?? '';
  bool hasActivityTime() => _activityTime != null;

  // "finalTime" field.
  String? _finalTime;
  String get finalTime => _finalTime ?? '';
  bool hasFinalTime() => _finalTime != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  bool hasDuration() => _duration != null;

  // "durationCircle" field.
  double? _durationCircle;
  double get durationCircle => _durationCircle ?? 0.0;
  bool hasDurationCircle() => _durationCircle != null;

  // "endLocationName" field.
  String? _endLocationName;
  String get endLocationName => _endLocationName ?? '';
  bool hasEndLocationName() => _endLocationName != null;

  // "startLocationName" field.
  String? _startLocationName;
  String get startLocationName => _startLocationName ?? '';
  bool hasStartLocationName() => _startLocationName != null;

  void _initializeFields() {
    _locationStart = snapshotData['locationStart'] as LatLng?;
    _locationEnd = snapshotData['locationEnd'] as LatLng?;
    _activityName = snapshotData['activityName'] as String?;
    _userId = snapshotData['userId'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _status = snapshotData['status'] as bool?;
    _activityTime = snapshotData['activityTime'] as String?;
    _finalTime = snapshotData['finalTime'] as String?;
    _duration = snapshotData['duration'] as String?;
    _durationCircle = castToType<double>(snapshotData['durationCircle']);
    _endLocationName = snapshotData['endLocationName'] as String?;
    _startLocationName = snapshotData['startLocationName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('routeList');

  static Stream<RouteListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RouteListRecord.fromSnapshot(s));

  static Future<RouteListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RouteListRecord.fromSnapshot(s));

  static RouteListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RouteListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RouteListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RouteListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RouteListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RouteListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRouteListRecordData({
  LatLng? locationStart,
  LatLng? locationEnd,
  String? activityName,
  String? userId,
  DateTime? date,
  bool? status,
  String? activityTime,
  String? finalTime,
  String? duration,
  double? durationCircle,
  String? endLocationName,
  String? startLocationName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'locationStart': locationStart,
      'locationEnd': locationEnd,
      'activityName': activityName,
      'userId': userId,
      'date': date,
      'status': status,
      'activityTime': activityTime,
      'finalTime': finalTime,
      'duration': duration,
      'durationCircle': durationCircle,
      'endLocationName': endLocationName,
      'startLocationName': startLocationName,
    }.withoutNulls,
  );

  return firestoreData;
}

class RouteListRecordDocumentEquality implements Equality<RouteListRecord> {
  const RouteListRecordDocumentEquality();

  @override
  bool equals(RouteListRecord? e1, RouteListRecord? e2) {
    return e1?.locationStart == e2?.locationStart &&
        e1?.locationEnd == e2?.locationEnd &&
        e1?.activityName == e2?.activityName &&
        e1?.userId == e2?.userId &&
        e1?.date == e2?.date &&
        e1?.status == e2?.status &&
        e1?.activityTime == e2?.activityTime &&
        e1?.finalTime == e2?.finalTime &&
        e1?.duration == e2?.duration &&
        e1?.durationCircle == e2?.durationCircle &&
        e1?.endLocationName == e2?.endLocationName &&
        e1?.startLocationName == e2?.startLocationName;
  }

  @override
  int hash(RouteListRecord? e) => const ListEquality().hash([
        e?.locationStart,
        e?.locationEnd,
        e?.activityName,
        e?.userId,
        e?.date,
        e?.status,
        e?.activityTime,
        e?.finalTime,
        e?.duration,
        e?.durationCircle,
        e?.endLocationName,
        e?.startLocationName
      ]);

  @override
  bool isValidKey(Object? o) => o is RouteListRecord;
}
