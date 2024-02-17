import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "userPhoto" field.
  String? _userPhoto;
  String get userPhoto => _userPhoto ?? '';
  bool hasUserPhoto() => _userPhoto != null;

  // "contactID" field.
  String? _contactID;
  String get contactID => _contactID ?? '';
  bool hasContactID() => _contactID != null;

  // "contactName" field.
  String? _contactName;
  String get contactName => _contactName ?? '';
  bool hasContactName() => _contactName != null;

  // "contactEmail" field.
  String? _contactEmail;
  String get contactEmail => _contactEmail ?? '';
  bool hasContactEmail() => _contactEmail != null;

  // "contactNumber" field.
  String? _contactNumber;
  String get contactNumber => _contactNumber ?? '';
  bool hasContactNumber() => _contactNumber != null;

  // "selectedActivityName" field.
  String? _selectedActivityName;
  String get selectedActivityName => _selectedActivityName ?? '';
  bool hasSelectedActivityName() => _selectedActivityName != null;

  // "startLocation" field.
  LatLng? _startLocation;
  LatLng? get startLocation => _startLocation;
  bool hasStartLocation() => _startLocation != null;

  // "endLocation" field.
  LatLng? _endLocation;
  LatLng? get endLocation => _endLocation;
  bool hasEndLocation() => _endLocation != null;

  // "contactList" field.
  List<String>? _contactList;
  List<String> get contactList => _contactList ?? const [];
  bool hasContactList() => _contactList != null;

  // "selectedActivityTime" field.
  String? _selectedActivityTime;
  String get selectedActivityTime => _selectedActivityTime ?? '';
  bool hasSelectedActivityTime() => _selectedActivityTime != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "isRead" field.
  bool? _isRead;
  bool get isRead => _isRead ?? false;
  bool hasIsRead() => _isRead != null;

  // "isEmergency" field.
  bool? _isEmergency;
  bool get isEmergency => _isEmergency ?? false;
  bool hasIsEmergency() => _isEmergency != null;

  // "approved" field.
  bool? _approved;
  bool get approved => _approved ?? false;
  bool hasApproved() => _approved != null;

  // "approvalProcess" field.
  bool? _approvalProcess;
  bool get approvalProcess => _approvalProcess ?? false;
  bool hasApprovalProcess() => _approvalProcess != null;

  // "needHelp" field.
  bool? _needHelp;
  bool get needHelp => _needHelp ?? false;
  bool hasNeedHelp() => _needHelp != null;

  // "response" field.
  bool? _response;
  bool get response => _response ?? false;
  bool hasResponse() => _response != null;

  // "contactIDRef" field.
  DocumentReference? _contactIDRef;
  DocumentReference? get contactIDRef => _contactIDRef;
  bool hasContactIDRef() => _contactIDRef != null;

  // "endLocationName" field.
  String? _endLocationName;
  String get endLocationName => _endLocationName ?? '';
  bool hasEndLocationName() => _endLocationName != null;

  // "startLocationName" field.
  String? _startLocationName;
  String get startLocationName => _startLocationName ?? '';
  bool hasStartLocationName() => _startLocationName != null;

  void _initializeFields() {
    _userID = snapshotData['userID'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _userPhoto = snapshotData['userPhoto'] as String?;
    _contactID = snapshotData['contactID'] as String?;
    _contactName = snapshotData['contactName'] as String?;
    _contactEmail = snapshotData['contactEmail'] as String?;
    _contactNumber = snapshotData['contactNumber'] as String?;
    _selectedActivityName = snapshotData['selectedActivityName'] as String?;
    _startLocation = snapshotData['startLocation'] as LatLng?;
    _endLocation = snapshotData['endLocation'] as LatLng?;
    _contactList = getDataList(snapshotData['contactList']);
    _selectedActivityTime = snapshotData['selectedActivityTime'] as String?;
    _userName = snapshotData['userName'] as String?;
    _isRead = snapshotData['isRead'] as bool?;
    _isEmergency = snapshotData['isEmergency'] as bool?;
    _approved = snapshotData['approved'] as bool?;
    _approvalProcess = snapshotData['approvalProcess'] as bool?;
    _needHelp = snapshotData['needHelp'] as bool?;
    _response = snapshotData['response'] as bool?;
    _contactIDRef = snapshotData['contactIDRef'] as DocumentReference?;
    _endLocationName = snapshotData['endLocationName'] as String?;
    _startLocationName = snapshotData['startLocationName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  DocumentReference? userID,
  DateTime? timestamp,
  String? userPhoto,
  String? contactID,
  String? contactName,
  String? contactEmail,
  String? contactNumber,
  String? selectedActivityName,
  LatLng? startLocation,
  LatLng? endLocation,
  String? selectedActivityTime,
  String? userName,
  bool? isRead,
  bool? isEmergency,
  bool? approved,
  bool? approvalProcess,
  bool? needHelp,
  bool? response,
  DocumentReference? contactIDRef,
  String? endLocationName,
  String? startLocationName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userID': userID,
      'timestamp': timestamp,
      'userPhoto': userPhoto,
      'contactID': contactID,
      'contactName': contactName,
      'contactEmail': contactEmail,
      'contactNumber': contactNumber,
      'selectedActivityName': selectedActivityName,
      'startLocation': startLocation,
      'endLocation': endLocation,
      'selectedActivityTime': selectedActivityTime,
      'userName': userName,
      'isRead': isRead,
      'isEmergency': isEmergency,
      'approved': approved,
      'approvalProcess': approvalProcess,
      'needHelp': needHelp,
      'response': response,
      'contactIDRef': contactIDRef,
      'endLocationName': endLocationName,
      'startLocationName': startLocationName,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userID == e2?.userID &&
        e1?.timestamp == e2?.timestamp &&
        e1?.userPhoto == e2?.userPhoto &&
        e1?.contactID == e2?.contactID &&
        e1?.contactName == e2?.contactName &&
        e1?.contactEmail == e2?.contactEmail &&
        e1?.contactNumber == e2?.contactNumber &&
        e1?.selectedActivityName == e2?.selectedActivityName &&
        e1?.startLocation == e2?.startLocation &&
        e1?.endLocation == e2?.endLocation &&
        listEquality.equals(e1?.contactList, e2?.contactList) &&
        e1?.selectedActivityTime == e2?.selectedActivityTime &&
        e1?.userName == e2?.userName &&
        e1?.isRead == e2?.isRead &&
        e1?.isEmergency == e2?.isEmergency &&
        e1?.approved == e2?.approved &&
        e1?.approvalProcess == e2?.approvalProcess &&
        e1?.needHelp == e2?.needHelp &&
        e1?.response == e2?.response &&
        e1?.contactIDRef == e2?.contactIDRef &&
        e1?.endLocationName == e2?.endLocationName &&
        e1?.startLocationName == e2?.startLocationName;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.userID,
        e?.timestamp,
        e?.userPhoto,
        e?.contactID,
        e?.contactName,
        e?.contactEmail,
        e?.contactNumber,
        e?.selectedActivityName,
        e?.startLocation,
        e?.endLocation,
        e?.contactList,
        e?.selectedActivityTime,
        e?.userName,
        e?.isRead,
        e?.isEmergency,
        e?.approved,
        e?.approvalProcess,
        e?.needHelp,
        e?.response,
        e?.contactIDRef,
        e?.endLocationName,
        e?.startLocationName
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
