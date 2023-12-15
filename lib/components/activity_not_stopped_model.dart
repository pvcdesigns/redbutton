import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'activity_not_stopped_widget.dart' show ActivityNotStoppedWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ActivityNotStoppedModel
    extends FlutterFlowModel<ActivityNotStoppedWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (GeoCodeReverse)] action in Button widget.
  ApiCallResponse? soslocationName;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotificationsRecord? imGoodNotification;
  // Stores action output result for [Backend Call - API (GeoCodeReverse)] action in Button widget.
  ApiCallResponse? soslocationName2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotificationsRecord? needHelpNotification;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
