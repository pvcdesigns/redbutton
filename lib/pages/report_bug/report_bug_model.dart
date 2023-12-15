import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'report_bug_widget.dart' show ReportBugWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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

  void initState(BuildContext context) {}

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
