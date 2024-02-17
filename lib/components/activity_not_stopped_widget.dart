import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'activity_not_stopped_model.dart';
export 'activity_not_stopped_model.dart';

class ActivityNotStoppedWidget extends StatefulWidget {
  const ActivityNotStoppedWidget({
    super.key,
    this.locationName,
  });

  final String? locationName;

  @override
  State<ActivityNotStoppedWidget> createState() =>
      _ActivityNotStoppedWidgetState();
}

class _ActivityNotStoppedWidgetState extends State<ActivityNotStoppedWidget>
    with TickerProviderStateMixin {
  late ActivityNotStoppedModel _model;

  LatLng? currentUserLocationValue;

  final animationsMap = {
    'iconOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: const Offset(0.0, 0.0),
          end: const Offset(1.0, 1.0),
        ),
        ShakeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          hz: 10,
          offset: const Offset(5.0, 0.0),
          rotation: 0.087,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActivityNotStoppedModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.timer,
                color: FlutterFlowTheme.of(context).info,
                size: 100.0,
              ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation']!),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.75,
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                    child: Text(
                      'Timer not stopped in time!',
                      textAlign: TextAlign.center,
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).info,
                                fontSize: 30.0,
                              ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FFButtonWidget(
                onPressed: () async {
                  currentUserLocationValue = await getCurrentUserLocation(
                      defaultLocation: const LatLng(0.0, 0.0));
                  _model.updatePage(() {
                    FFAppState().activityNotStopped = false;
                  });
                  _model.soslocationName = await GeoCodeReverseCall.call(
                    latitude: functions.latLongString(
                        currentUserLocationValue!, true),
                    longitude: functions.latLongString(
                        currentUserLocationValue!, false),
                  );

                  var notificationsRecordReference =
                      NotificationsRecord.collection.doc();
                  await notificationsRecordReference.set({
                    ...createNotificationsRecordData(
                      timestamp: getCurrentTimestamp,
                      userPhoto: currentUserPhoto,
                      selectedActivityName: FFAppState().selectedActivity,
                      userID: currentUserReference,
                      userName: currentUserDisplayName,
                      endLocation: currentUserLocationValue,
                      isRead: false,
                      isEmergency: true,
                      needHelp: false,
                      response: true,
                      endLocationName: GeoCodeReverseCall.locationName(
                        (_model.soslocationName?.jsonBody ?? ''),
                      ).toString(),
                    ),
                    ...mapToFirestore(
                      {
                        'contactList':
                            (currentUserDocument?.contactList.toList() ?? [])
                                .map((e) => e.id)
                                .toList(),
                      },
                    ),
                  });
                  _model.imGoodNotification =
                      NotificationsRecord.getDocumentFromData({
                    ...createNotificationsRecordData(
                      timestamp: getCurrentTimestamp,
                      userPhoto: currentUserPhoto,
                      selectedActivityName: FFAppState().selectedActivity,
                      userID: currentUserReference,
                      userName: currentUserDisplayName,
                      endLocation: currentUserLocationValue,
                      isRead: false,
                      isEmergency: true,
                      needHelp: false,
                      response: true,
                      endLocationName: GeoCodeReverseCall.locationName(
                        (_model.soslocationName?.jsonBody ?? ''),
                      ).toString(),
                    ),
                    ...mapToFirestore(
                      {
                        'contactList':
                            (currentUserDocument?.contactList.toList() ?? [])
                                .map((e) => e.id)
                                .toList(),
                      },
                    ),
                  }, notificationsRecordReference);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '"I\'m Good" notice has been sent!',
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              fontSize: 14.0,
                            ),
                      ),
                      duration: const Duration(milliseconds: 4000),
                      backgroundColor: FlutterFlowTheme.of(context).primaryText,
                    ),
                  );
                  triggerPushNotification(
                    notificationTitle: 'I\'m Good!',
                    notificationText:
                        '$currentUserDisplayName has confirmed they are safe.',
                    notificationSound: 'default',
                    userRefs: (currentUserDocument?.contactList.toList() ?? [])
                        .toList(),
                    initialPageName: 'HomePage',
                    parameterData: {},
                  );

                  setState(() {});
                },
                text: 'I\'m GOOD',
                icon: const Icon(
                  Icons.thumb_up,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  width: 270.0,
                  height: 45.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).info,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        color: const Color(0xFF111111),
                      ),
                  elevation: 3.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    currentUserLocationValue = await getCurrentUserLocation(
                        defaultLocation: const LatLng(0.0, 0.0));
                    _model.updatePage(() {
                      FFAppState().activityNotStopped = false;
                    });
                    _model.soslocationName2 = await GeoCodeReverseCall.call(
                      latitude: functions.latLongString(
                          currentUserLocationValue!, true),
                      longitude: functions.latLongString(
                          currentUserLocationValue!, false),
                    );

                    var notificationsRecordReference =
                        NotificationsRecord.collection.doc();
                    await notificationsRecordReference.set({
                      ...createNotificationsRecordData(
                        timestamp: getCurrentTimestamp,
                        userPhoto: currentUserPhoto,
                        selectedActivityName: FFAppState().selectedActivity,
                        userID: currentUserReference,
                        userName: currentUserDisplayName,
                        endLocation: currentUserLocationValue,
                        isRead: false,
                        contactNumber: currentPhoneNumber,
                        isEmergency: true,
                        needHelp: true,
                        response: true,
                        contactID: widget.locationName,
                        endLocationName: GeoCodeReverseCall.locationName(
                          (_model.soslocationName2?.jsonBody ?? ''),
                        ).toString(),
                      ),
                      ...mapToFirestore(
                        {
                          'contactList':
                              (currentUserDocument?.contactList.toList() ?? [])
                                  .map((e) => e.id)
                                  .toList(),
                        },
                      ),
                    });
                    _model.needHelpNotification =
                        NotificationsRecord.getDocumentFromData({
                      ...createNotificationsRecordData(
                        timestamp: getCurrentTimestamp,
                        userPhoto: currentUserPhoto,
                        selectedActivityName: FFAppState().selectedActivity,
                        userID: currentUserReference,
                        userName: currentUserDisplayName,
                        endLocation: currentUserLocationValue,
                        isRead: false,
                        contactNumber: currentPhoneNumber,
                        isEmergency: true,
                        needHelp: true,
                        response: true,
                        contactID: widget.locationName,
                        endLocationName: GeoCodeReverseCall.locationName(
                          (_model.soslocationName2?.jsonBody ?? ''),
                        ).toString(),
                      ),
                      ...mapToFirestore(
                        {
                          'contactList':
                              (currentUserDocument?.contactList.toList() ?? [])
                                  .map((e) => e.id)
                                  .toList(),
                        },
                      ),
                    }, notificationsRecordReference);
                    _model.updatePage(() {
                      FFAppState().showMedCard = true;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Request for help has been sent!',
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 14.0,
                                  ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor:
                            FlutterFlowTheme.of(context).primaryText,
                      ),
                    );
                    triggerPushNotification(
                      notificationTitle: 'SOS! I need HELP',
                      notificationText:
                          '$currentUserDisplayName has confirmed an SOS and needs help! Please contact them now: $currentPhoneNumber',
                      notificationSound: 'default',
                      userRefs:
                          (currentUserDocument?.contactList.toList() ?? [])
                              .toList(),
                      initialPageName: 'HomePage',
                      parameterData: {},
                    );

                    setState(() {});
                  },
                  text: 'I need HELP now!',
                  icon: const Icon(
                    Icons.medical_services,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    width: 270.0,
                    height: 100.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: const Color(0xFF111111),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).info,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
