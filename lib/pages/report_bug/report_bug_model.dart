import '/flutter_flow/flutter_flow_util.dart';
import 'report_bug_widget.dart' show ReportBugWidget;
import 'package:flutter/material.dart';

class ReportBugModel extends FlutterFlowModel<ReportBugWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for buginfo widget.
  FocusNode? buginfoFocusNode;
  TextEditingController? buginfoController;
  String? Function(BuildContext, String?)? buginfoControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    yourNameFocusNode?.dispose();
    yourNameController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    buginfoFocusNode?.dispose();
    buginfoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
