import '/backend/backend.dart';
import '/components/contact_list_row_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'contact_list_widget.dart' show ContactListWidget;
import 'package:flutter/material.dart';

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

  @override
  void initState(BuildContext context) {
    searchFieldControllerValidator = _searchFieldControllerValidator;
    contactListRowModel = createModel(context, () => ContactListRowModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    searchFieldFocusNode?.dispose();
    searchFieldController?.dispose();

    contactListRowModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
