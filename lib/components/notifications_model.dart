import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notifications_widget.dart' show NotificationsWidget;
import 'package:flutter/material.dart';

class NotificationsModel extends FlutterFlowModel<NotificationsWidget> {
  ///  Local state fields for this component.

  int idCounter = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  NotificationsRecord? contactDeclined;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ContactListRecord? selectedContactList;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  NotificationsRecord? contactAccepted;
  // Stores action output result for [Custom Action - buildContactList] action in IconButton widget.
  List<String>? buildContactListAction2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
