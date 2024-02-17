import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'activity_not_stopped_widget.dart' show ActivityNotStoppedWidget;
import 'package:flutter/material.dart';

class ActivityNotStoppedModel
    extends FlutterFlowModel<ActivityNotStoppedWidget> {
  ///  Local state fields for this component.

  int contactCounter = 0;

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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
