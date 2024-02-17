// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContactListStruct extends FFFirebaseStruct {
  ContactListStruct({
    List<String>? contactID,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _contactID = contactID,
        super(firestoreUtilData);

  // "contactID" field.
  List<String>? _contactID;
  List<String> get contactID => _contactID ?? const [];
  set contactID(List<String>? val) => _contactID = val;
  void updateContactID(Function(List<String>) updateFn) =>
      updateFn(_contactID ??= []);
  bool hasContactID() => _contactID != null;

  static ContactListStruct fromMap(Map<String, dynamic> data) =>
      ContactListStruct(
        contactID: getDataList(data['contactID']),
      );

  static ContactListStruct? maybeFromMap(dynamic data) => data is Map
      ? ContactListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'contactID': _contactID,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'contactID': serializeParam(
          _contactID,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static ContactListStruct fromSerializableMap(Map<String, dynamic> data) =>
      ContactListStruct(
        contactID: deserializeParam<String>(
          data['contactID'],
          ParamType.String,
          true,
        ),
      );

  static ContactListStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ContactListStruct(
        contactID: convertAlgoliaParam<String>(
          data['contactID'],
          ParamType.String,
          true,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ContactListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ContactListStruct &&
        listEquality.equals(contactID, other.contactID);
  }

  @override
  int get hashCode => const ListEquality().hash([contactID]);
}

ContactListStruct createContactListStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ContactListStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ContactListStruct? updateContactListStruct(
  ContactListStruct? contactList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    contactList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addContactListStructData(
  Map<String, dynamic> firestoreData,
  ContactListStruct? contactList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (contactList == null) {
    return;
  }
  if (contactList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && contactList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final contactListData =
      getContactListFirestoreData(contactList, forFieldValue);
  final nestedData =
      contactListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = contactList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getContactListFirestoreData(
  ContactListStruct? contactList, [
  bool forFieldValue = false,
]) {
  if (contactList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(contactList.toMap());

  // Add any Firestore field values
  contactList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getContactListListFirestoreData(
  List<ContactListStruct>? contactLists,
) =>
    contactLists?.map((e) => getContactListFirestoreData(e, true)).toList() ??
    [];
