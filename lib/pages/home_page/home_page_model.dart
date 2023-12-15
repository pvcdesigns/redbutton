import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/activity_not_stopped_widget.dart';
import '/components/notifications_widget.dart';
import '/components/setup_container_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  int loopCounter = 0;

  LatLng? locationUpdate;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  InstantTimer? instantTimer;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for notifications component.
  late NotificationsModel notificationsModel;
  AudioPlayer? soundPlayer1;
  // Stores action output result for [Backend Call - API (GeoCodeReverse)] action in startButton widget.
  ApiCallResponse? locationName;
  // Stores action output result for [Backend Call - Create Document] action in startButton widget.
  RouteListRecord? newRoute;
  // Stores action output result for [Backend Call - Create Document] action in startButton widget.
  NotificationsRecord? startNotification;
  // Stores action output result for [Backend Call - Create Document] action in startButton widget.
  NotificationsRecord? notEndedNotification;
  AudioPlayer? soundPlayer2;
  // Stores action output result for [Backend Call - Create Document] action in emergencyButton widget.
  NotificationsRecord? sosNotification;
  AudioPlayer? soundPlayer3;
  // Stores action output result for [Backend Call - API (GeoCodeReverse)] action in stopButton widget.
  ApiCallResponse? endlocationName;
  // Stores action output result for [Backend Call - Create Document] action in stopButton widget.
  NotificationsRecord? endNotification;
  AudioPlayer? soundPlayer4;
  // Stores action output result for [Custom Action - addFiveMinutes] action in plus5Button widget.
  int? addFiveMins;
  // Stores action output result for [Backend Call - Create Document] action in plus5Button widget.
  NotificationsRecord? add5Notification;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - getActivityTime] action in DropDown widget.
  int? selectedActivityTime;
  // Stores action output result for [Custom Action - convertIntToDuration] action in DropDown widget.
  int? selectedActivityTimeinSeconds;
  // State field(s) for Timer widget.
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(0, milliSecond: false);
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  AudioPlayer? soundPlayer5;
  // Stores action output result for [Backend Call - API (GeoCodeReverse)] action in Timer widget.
  ApiCallResponse? notendedlocationName;
  // State field(s) for Slider widget.
  double? sliderValue;
  // Stores action output result for [Custom Action - convertIntToDuration] action in Slider widget.
  int? timeLimitInSeconds;
  // Model for setupContainer component.
  late SetupContainerModel setupContainerModel;
  // Model for activityNotStopped component.
  late ActivityNotStoppedModel activityNotStoppedModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    notificationsModel = createModel(context, () => NotificationsModel());
    setupContainerModel = createModel(context, () => SetupContainerModel());
    activityNotStoppedModel =
        createModel(context, () => ActivityNotStoppedModel());
  }

  void dispose() {
    unfocusNode.dispose();
    instantTimer?.cancel();
    notificationsModel.dispose();
    timerController.dispose();
    setupContainerModel.dispose();
    activityNotStoppedModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
