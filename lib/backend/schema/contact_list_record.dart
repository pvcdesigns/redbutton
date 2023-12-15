import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContactListRecord extends FirestoreRecord {
  ContactListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "number" field.
  String? _number;
  String get number => _number ?? '';
  bool hasNumber() => _number != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "notificationID" field.
  String? _notificationID;
  String get notificationID => _notificationID ?? '';
  bool hasNotificationID() => _notificationID != null;

  // "notificationIDRef" field.
  DocumentReference? _notificationIDRef;
  DocumentReference? get notificationIDRef => _notificationIDRef;
  bool hasNotificationIDRef() => _notificationIDRef != null;

  void _initializeFields() {
    _number = snapshotData['number'] as String?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _userId = snapshotData['userId'] as String?;
    _notificationID = snapshotData['notificationID'] as String?;
    _notificationIDRef =
        snapshotData['notificationIDRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('contactList');

  static Stream<ContactListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContactListRecord.fromSnapshot(s));

  static Future<ContactListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContactListRecord.fromSnapshot(s));

  static ContactListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContactListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContactListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContactListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContactListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContactListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContactListRecordData({
  String? number,
  String? email,
  String? displayName,
  String? userId,
  String? notificationID,
  DocumentReference? notificationIDRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'number': number,
      'email': email,
      'display_name': displayName,
      'userId': userId,
      'notificationID': notificationID,
      'notificationIDRef': notificationIDRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContactListRecordDocumentEquality implements Equality<ContactListRecord> {
  const ContactListRecordDocumentEquality();

  @override
  bool equals(ContactListRecord? e1, ContactListRecord? e2) {
    return e1?.number == e2?.number &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.userId == e2?.userId &&
        e1?.notificationID == e2?.notificationID &&
        e1?.notificationIDRef == e2?.notificationIDRef;
  }

  @override
  int hash(ContactListRecord? e) => const ListEquality().hash([
        e?.number,
        e?.email,
        e?.displayName,
        e?.userId,
        e?.notificationID,
        e?.notificationIDRef
      ]);

  @override
  bool isValidKey(Object? o) => o is ContactListRecord;
}
