import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/contact_list_row_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'contact_list_widget.dart' show ContactListWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ContactListModel extends FlutterFlowModel<ContactListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for searchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldController;
  String? Function(BuildContext, String?)? searchFieldControllerValidator;
  String? _searchFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Algolia Search Results from action on IconButton
  List<UsersRecord>? algoliaSearchResults = [];
  // State field(s) for CheckboxListTile widget.

  Map<UsersRecord, bool> checkboxListTileValueMap = {};
  List<UsersRecord> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // Model for contactListRow component.
  late ContactListRowModel contactListRowModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    searchFieldControllerValidator = _searchFieldControllerValidator;
    contactListRowModel = createModel(context, () => ContactListRowModel());
  }

  void dispose() {
    unfocusNode.dispose();
    searchFieldFocusNode?.dispose();
    searchFieldController?.dispose();

    contactListRowModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
