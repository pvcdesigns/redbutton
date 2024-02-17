import '/backend/backend.dart';
import '/components/activity_container_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'activity_list_widget.dart' show ActivityListWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ActivityListModel extends FlutterFlowModel<ActivityListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActivityListRecord? customActivity;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController;

  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ActivityListRecord? customActivity2Copy;
  // Model for activityContainer component.
  late ActivityContainerModel activityContainerModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
    activityContainerModel =
        createModel(context, () => ActivityContainerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    expandableController.dispose();
    activityContainerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
