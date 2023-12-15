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
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    Key? key,
    this.notifications,
    this.selectedContactList,
    this.activityList,
    this.routeList,
  }) : super(key: key);

  final NotificationsRecord? notifications;
  final ContactListRecord? selectedContactList;
  final DocumentReference? activityList;
  final RouteListRecord? routeList;

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = {
    'buttonOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ShakeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          hz: 10,
          offset: Offset(5.0, 0.0),
          rotation: 0.087,
        ),
      ],
    ),
    'buttonOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 300.ms,
          begin: Offset(-64.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'buttonOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 300.ms,
          begin: Offset(64.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'timerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'setupContainerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'activityNotStoppedOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.loopCounter = 0;
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          FFAppState().currentTimer = _model.timerMilliseconds;
        },
        startImmediately: true,
      );
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              alignment: AlignmentDirectional(0.0, 1.0),
              children: [
                Builder(builder: (context) {
                  final _googleMapMarker = currentUserLocationValue;
                  return FlutterFlowGoogleMap(
                    controller: _model.googleMapsController,
                    onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
                    initialLocation: _model.googleMapsCenter ??=
                        currentUserLocationValue!,
                    markers: [
                      if (_googleMapMarker != null)
                        FlutterFlowMarker(
                          _googleMapMarker.serialize(),
                          _googleMapMarker,
                        ),
                    ],
                    markerColor: GoogleMarkerColor.red,
                    mapType: MapType.hybrid,
                    style: GoogleMapStyle.standard,
                    initialZoom: 18.0,
                    allowInteraction: true,
                    allowZoom: true,
                    showZoomControls: false,
                    showLocation: true,
                    showCompass: true,
                    showMapToolbar: true,
                    showTraffic: false,
                    centerMapOnMarkerTap: true,
                  );
                }),
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: PointerInterceptor(
                    intercepting: isWeb,
                    child: ClipRect(
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(
                          sigmaX: 0.0,
                          sigmaY: 0.0,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 50.0),
                          child: Container(
                            width: double.infinity,
                            height: 98.0,
                            decoration: BoxDecoration(
                              color: Color(0x66111111),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                PointerInterceptor(
                  intercepting: isWeb,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 50.0, 0.0, 0.0),
                            child: wrapWithModel(
                              model: _model.notificationsModel,
                              updateCallback: () => setState(() {}),
                              updateOnChange: true,
                              child: NotificationsWidget(
                                newRoute: _model.newRoute,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (FFAppState().startNow)
                        AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(0.0, -2.0),
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (FFAppState().activityIsSelected)
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (!valueOrDefault<bool>(
                                      FFAppState().activityStarted,
                                      true,
                                    ))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            currentUserLocationValue =
                                                await getCurrentUserLocation(
                                                    defaultLocation:
                                                        LatLng(0.0, 0.0));
                                            _model.soundPlayer1 ??=
                                                AudioPlayer();
                                            if (_model.soundPlayer1!.playing) {
                                              await _model.soundPlayer1!.stop();
                                            }
                                            _model.soundPlayer1!.setVolume(1.0);
                                            _model.soundPlayer1!
                                                .setAsset(
                                                    'assets/audios/activity-start.mp3')
                                                .then((_) => _model
                                                    .soundPlayer1!
                                                    .play());

                                            await _model
                                                .googleMapsController.future
                                                .then(
                                              (c) => c.animateCamera(
                                                CameraUpdate.newLatLng(
                                                    currentUserLocationValue!
                                                        .toGoogleMaps()),
                                              ),
                                            );
                                            _model.timerController
                                                .onStartTimer();
                                            FFAppState().activityStarted = true;
                                            FFAppState().userLocationStart =
                                                currentUserLocationValue;
                                            FFAppState().currentUserID =
                                                currentUserUid;
                                            FFAppState().startTime =
                                                _model.timerMilliseconds;
                                            _model.locationName =
                                                await GeoCodeReverseCall.call(
                                              latitude: functions.latLongString(
                                                  currentUserLocationValue!,
                                                  true),
                                              longitude:
                                                  functions.latLongString(
                                                      currentUserLocationValue!,
                                                      false),
                                            );

                                            var routeListRecordReference =
                                                RouteListRecord.collection
                                                    .doc();
                                            await routeListRecordReference
                                                .set(createRouteListRecordData(
                                              locationStart:
                                                  currentUserLocationValue,
                                              activityName:
                                                  FFAppState().selectedActivity,
                                              userId: currentUserUid,
                                              date: getCurrentTimestamp,
                                              status: false,
                                              startLocationName:
                                                  GeoCodeReverseCall
                                                      .locationName(
                                                (_model.locationName
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                            ));
                                            _model.newRoute = RouteListRecord
                                                .getDocumentFromData(
                                                    createRouteListRecordData(
                                                      locationStart:
                                                          currentUserLocationValue,
                                                      activityName: FFAppState()
                                                          .selectedActivity,
                                                      userId: currentUserUid,
                                                      date: getCurrentTimestamp,
                                                      status: false,
                                                      startLocationName:
                                                          GeoCodeReverseCall
                                                              .locationName(
                                                        (_model.locationName
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString(),
                                                    ),
                                                    routeListRecordReference);
                                            FFAppState().newRoute =
                                                _model.newRoute?.reference;

                                            var notificationsRecordReference1 =
                                                NotificationsRecord.collection
                                                    .doc();
                                            await notificationsRecordReference1
                                                .set({
                                              ...createNotificationsRecordData(
                                                timestamp: getCurrentTimestamp,
                                                userPhoto: currentUserPhoto,
                                                selectedActivityName: _model
                                                    .newRoute?.activityName,
                                                startLocation: _model
                                                    .newRoute?.locationStart,
                                                userID: currentUserReference,
                                                userName:
                                                    currentUserDisplayName,
                                                selectedActivityTime: (_model
                                                            .timerMilliseconds =
                                                        (_model.timerMilliseconds /
                                                                60000)
                                                            .ceil())
                                                    .toString(),
                                                isRead: false,
                                                startLocationName:
                                                    GeoCodeReverseCall
                                                        .locationName(
                                                  (_model.locationName
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString(),
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'contactList':
                                                      (currentUserDocument
                                                                  ?.contactList
                                                                  ?.toList() ??
                                                              [])
                                                          .map((e) => e.id)
                                                          .toList(),
                                                },
                                              ),
                                            });
                                            _model.startNotification =
                                                NotificationsRecord
                                                    .getDocumentFromData({
                                              ...createNotificationsRecordData(
                                                timestamp: getCurrentTimestamp,
                                                userPhoto: currentUserPhoto,
                                                selectedActivityName: _model
                                                    .newRoute?.activityName,
                                                startLocation: _model
                                                    .newRoute?.locationStart,
                                                userID: currentUserReference,
                                                userName:
                                                    currentUserDisplayName,
                                                selectedActivityTime: (_model
                                                            .timerMilliseconds =
                                                        (_model.timerMilliseconds /
                                                                60000)
                                                            .ceil())
                                                    .toString(),
                                                isRead: false,
                                                startLocationName:
                                                    GeoCodeReverseCall
                                                        .locationName(
                                                  (_model.locationName
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString(),
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'contactList':
                                                      (currentUserDocument
                                                                  ?.contactList
                                                                  ?.toList() ??
                                                              [])
                                                          .map((e) => e.id)
                                                          .toList(),
                                                },
                                              ),
                                            }, notificationsRecordReference1);

                                            var notificationsRecordReference2 =
                                                NotificationsRecord.collection
                                                    .doc();
                                            await notificationsRecordReference2
                                                .set(
                                                    createNotificationsRecordData(
                                              selectedActivityName:
                                                  _model.newRoute?.activityName,
                                              userID: currentUserReference,
                                              selectedActivityTime: (_model
                                                          .timerMilliseconds =
                                                      (_model.timerMilliseconds /
                                                              60000)
                                                          .ceil())
                                                  .toString(),
                                            ));
                                            _model.notEndedNotification =
                                                NotificationsRecord.getDocumentFromData(
                                                    createNotificationsRecordData(
                                                      selectedActivityName:
                                                          _model.newRoute
                                                              ?.activityName,
                                                      userID:
                                                          currentUserReference,
                                                      selectedActivityTime:
                                                          (_model.timerMilliseconds =
                                                                  (_model.timerMilliseconds /
                                                                          60000)
                                                                      .ceil())
                                                              .toString(),
                                                    ),
                                                    notificationsRecordReference2);
                                            await actions.toggleWakelock();
                                            triggerPushNotification(
                                              notificationTitle:
                                                  'Activity started',
                                              notificationText:
                                                  '${currentUserDisplayName} has just started ${_model.startNotification?.selectedActivityName} for ${_model.startNotification?.selectedActivityTime}mins',
                                              notificationSound: 'default',
                                              userRefs: (currentUserDocument
                                                          ?.contactList
                                                          ?.toList() ??
                                                      [])
                                                  .toList(),
                                              initialPageName: 'HomePage',
                                              parameterData: {},
                                            );

                                            setState(() {});
                                          },
                                          text: 'Start Activity',
                                          icon: Icon(
                                            Icons.play_arrow_rounded,
                                            size: 35.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: 180.0,
                                            height: 50.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: Colors.white,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'buttonOnPageLoadAnimation1']!),
                                      ),
                                  ],
                                ),
                              if (FFAppState().activityStarted)
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          currentUserLocationValue =
                                              await getCurrentUserLocation(
                                                  defaultLocation:
                                                      LatLng(0.0, 0.0));
                                          _model.soundPlayer2 ??= AudioPlayer();
                                          if (_model.soundPlayer2!.playing) {
                                            await _model.soundPlayer2!.stop();
                                          }
                                          _model.soundPlayer2!.setVolume(1.0);
                                          _model.soundPlayer2!
                                              .setAsset(
                                                  'assets/audios/alarm-notification.mp3')
                                              .then((_) =>
                                                  _model.soundPlayer2!.play());

                                          if (animationsMap[
                                                  'containerOnActionTriggerAnimation'] !=
                                              null) {
                                            await animationsMap[
                                                    'containerOnActionTriggerAnimation']!
                                                .controller
                                                .forward(from: 0.0);
                                          }
                                          await _model
                                              .googleMapsController.future
                                              .then(
                                            (c) => c.animateCamera(
                                              CameraUpdate.newLatLng(
                                                  currentUserLocationValue!
                                                      .toGoogleMaps()),
                                            ),
                                          );

                                          var notificationsRecordReference =
                                              NotificationsRecord.collection
                                                  .doc();
                                          await notificationsRecordReference
                                              .set({
                                            ...createNotificationsRecordData(
                                              timestamp: getCurrentTimestamp,
                                              userPhoto: currentUserPhoto,
                                              selectedActivityName:
                                                  FFAppState().selectedActivity,
                                              userID: currentUserReference,
                                              userName: currentUserDisplayName,
                                              endLocation:
                                                  currentUserLocationValue,
                                              isRead: false,
                                              contactNumber: currentPhoneNumber,
                                              isEmergency: true,
                                              needHelp: true,
                                              response: true,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'contactList':
                                                    (currentUserDocument
                                                                ?.contactList
                                                                ?.toList() ??
                                                            [])
                                                        .map((e) => e.id)
                                                        .toList(),
                                              },
                                            ),
                                          });
                                          _model.sosNotification =
                                              NotificationsRecord
                                                  .getDocumentFromData({
                                            ...createNotificationsRecordData(
                                              timestamp: getCurrentTimestamp,
                                              userPhoto: currentUserPhoto,
                                              selectedActivityName:
                                                  FFAppState().selectedActivity,
                                              userID: currentUserReference,
                                              userName: currentUserDisplayName,
                                              endLocation:
                                                  currentUserLocationValue,
                                              isRead: false,
                                              contactNumber: currentPhoneNumber,
                                              isEmergency: true,
                                              needHelp: true,
                                              response: true,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'contactList':
                                                    (currentUserDocument
                                                                ?.contactList
                                                                ?.toList() ??
                                                            [])
                                                        .map((e) => e.id)
                                                        .toList(),
                                              },
                                            ),
                                          }, notificationsRecordReference);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Request for help has been sent!',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 14.0,
                                                        ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          );
                                          triggerPushNotification(
                                            notificationTitle: 'SOS!',
                                            notificationText:
                                                '${currentUserDisplayName} has just sent an SOS during ${_model.startNotification?.selectedActivityName}! Please contact them now: ${currentPhoneNumber}',
                                            notificationSound: 'default',
                                            userRefs: (currentUserDocument
                                                        ?.contactList
                                                        ?.toList() ??
                                                    [])
                                                .toList(),
                                            initialPageName: 'HomePage',
                                            parameterData: {},
                                          );

                                          setState(() {});
                                        },
                                        child: Container(
                                          width: 120.0,
                                          height: 120.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.emergency_share,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 40.0,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: Text(
                                                  'SOS',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                          .animateOnPageLoad(animationsMap[
                                              'containerOnPageLoadAnimation']!)
                                          .animateOnActionTrigger(
                                            animationsMap[
                                                'containerOnActionTriggerAnimation']!,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              currentUserLocationValue =
                                                  await getCurrentUserLocation(
                                                      defaultLocation:
                                                          LatLng(0.0, 0.0));
                                              _model.soundPlayer3 ??=
                                                  AudioPlayer();
                                              if (_model
                                                  .soundPlayer3!.playing) {
                                                await _model.soundPlayer3!
                                                    .stop();
                                              }
                                              _model.soundPlayer3!
                                                  .setVolume(1.0);
                                              _model.soundPlayer3!
                                                  .setAsset(
                                                      'assets/audios/activity-stop.mp3')
                                                  .then((_) => _model
                                                      .soundPlayer3!
                                                      .play());

                                              await _model
                                                  .googleMapsController.future
                                                  .then(
                                                (c) => c.animateCamera(
                                                  CameraUpdate.newLatLng(
                                                      currentUserLocationValue!
                                                          .toGoogleMaps()),
                                                ),
                                              );
                                              _model.endlocationName =
                                                  await GeoCodeReverseCall.call(
                                                latitude: functions.latLongString(
                                                    currentUserLocationValue!,
                                                    true),
                                                longitude:
                                                    functions.latLongString(
                                                        currentUserLocationValue!,
                                                        false),
                                              );

                                              await FFAppState()
                                                  .newRoute!
                                                  .update(
                                                      createRouteListRecordData(
                                                    locationEnd:
                                                        currentUserLocationValue,
                                                    status: true,
                                                    finalTime: functions
                                                        .finalTime(_model
                                                            .timerMilliseconds),
                                                    duration: functions.activityDuration(
                                                        functions.finalStartTime(
                                                            FFAppState()
                                                                .startTime,
                                                            FFAppState()
                                                                .addFiveMinutesInMilliseconds),
                                                        functions.finalTime(_model
                                                            .timerMilliseconds)),
                                                    durationCircle:
                                                        valueOrDefault<double>(
                                                      functions.durationCircle2(
                                                          FFAppState()
                                                              .startTime,
                                                          _model
                                                              .timerMilliseconds,
                                                          FFAppState()
                                                              .addFiveMinutesInMilliseconds),
                                                      1.0,
                                                    ),
                                                    activityTime: functions
                                                        .finalStartTime(
                                                            FFAppState()
                                                                .startTime,
                                                            FFAppState()
                                                                .addFiveMinutesInMilliseconds),
                                                    endLocationName:
                                                        GeoCodeReverseCall
                                                            .locationName(
                                                      (_model.endlocationName
                                                              ?.jsonBody ??
                                                          ''),
                                                    ).toString(),
                                                  ));
                                              _model.timerController.timer
                                                  .setPresetTime(
                                                      mSec: 0, add: false);
                                              _model.timerController
                                                  .onResetTimer();

                                              FFAppState().activityStarted =
                                                  false;
                                              FFAppState().activityIsSelected =
                                                  false;
                                              FFAppState().userLocationEnd =
                                                  currentUserLocationValue;
                                              FFAppState()
                                                  .addFiveMinutesInMilliseconds = 0;

                                              var notificationsRecordReference =
                                                  NotificationsRecord.collection
                                                      .doc();
                                              await notificationsRecordReference
                                                  .set({
                                                ...createNotificationsRecordData(
                                                  timestamp:
                                                      getCurrentTimestamp,
                                                  userPhoto: currentUserPhoto,
                                                  selectedActivityName: _model
                                                      .newRoute?.activityName,
                                                  userID: currentUserReference,
                                                  userName:
                                                      currentUserDisplayName,
                                                  selectedActivityTime:
                                                      FFAppState()
                                                          .selectedActivityTime
                                                          .toString(),
                                                  endLocation:
                                                      currentUserLocationValue,
                                                  isRead: false,
                                                  endLocationName:
                                                      GeoCodeReverseCall
                                                          .locationName(
                                                    (_model.endlocationName
                                                            ?.jsonBody ??
                                                        ''),
                                                  ).toString(),
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'contactList':
                                                        (currentUserDocument
                                                                    ?.contactList
                                                                    ?.toList() ??
                                                                [])
                                                            .map((e) => e.id)
                                                            .toList(),
                                                  },
                                                ),
                                              });
                                              _model.endNotification =
                                                  NotificationsRecord
                                                      .getDocumentFromData({
                                                ...createNotificationsRecordData(
                                                  timestamp:
                                                      getCurrentTimestamp,
                                                  userPhoto: currentUserPhoto,
                                                  selectedActivityName: _model
                                                      .newRoute?.activityName,
                                                  userID: currentUserReference,
                                                  userName:
                                                      currentUserDisplayName,
                                                  selectedActivityTime:
                                                      FFAppState()
                                                          .selectedActivityTime
                                                          .toString(),
                                                  endLocation:
                                                      currentUserLocationValue,
                                                  isRead: false,
                                                  endLocationName:
                                                      GeoCodeReverseCall
                                                          .locationName(
                                                    (_model.endlocationName
                                                            ?.jsonBody ??
                                                        ''),
                                                  ).toString(),
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'contactList':
                                                        (currentUserDocument
                                                                    ?.contactList
                                                                    ?.toList() ??
                                                                [])
                                                            .map((e) => e.id)
                                                            .toList(),
                                                  },
                                                ),
                                              }, notificationsRecordReference);
                                              await _model.notEndedNotification!
                                                  .reference
                                                  .delete();
                                              setState(() {
                                                _model.dropDownValueController
                                                    ?.reset();
                                              });
                                              await actions.toggleWakelock();
                                              ScaffoldMessenger.of(context)
                                                  .clearSnackBars();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Activity has been stopped!',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 14.0,
                                                        ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                ),
                                              );
                                              triggerPushNotification(
                                                notificationTitle:
                                                    'Activity stopped',
                                                notificationText:
                                                    '${currentUserDisplayName} has just safely finished with ${_model.startNotification?.selectedActivityName}',
                                                notificationSound: 'default',
                                                userRefs: (currentUserDocument
                                                            ?.contactList
                                                            ?.toList() ??
                                                        [])
                                                    .toList(),
                                                initialPageName: 'HomePage',
                                                parameterData: {},
                                              );

                                              setState(() {});
                                            },
                                            text: 'Stop Activity',
                                            icon: FaIcon(
                                              FontAwesomeIcons.stop,
                                              size: 24.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: 180.0,
                                              height: 50.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: Colors.white,
                                                      ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(8.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(8.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'buttonOnPageLoadAnimation2']!),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    1.0, 0.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                _model.soundPlayer4 ??=
                                                    AudioPlayer();
                                                if (_model
                                                    .soundPlayer4!.playing) {
                                                  await _model.soundPlayer4!
                                                      .stop();
                                                }
                                                _model.soundPlayer4!
                                                    .setVolume(1.0);
                                                _model.soundPlayer4!
                                                    .setAsset(
                                                        'assets/audios/activity-start.mp3')
                                                    .then((_) => _model
                                                        .soundPlayer4!
                                                        .play());

                                                _model.addFiveMins =
                                                    await actions
                                                        .addFiveMinutes(
                                                  FFAppState().currentTimer,
                                                );
                                                _model.timerController.timer
                                                    .setPresetTime(
                                                  mSec: _model.addFiveMins!,
                                                  add: false,
                                                );
                                                _model.timerController
                                                    .onResetTimer();

                                                _model.timerController
                                                    .onStartTimer();
                                                FFAppState().activityStarted =
                                                    true;
                                                FFAppState()
                                                        .addFiveMinutesInMilliseconds =
                                                    FFAppState()
                                                            .addFiveMinutesInMilliseconds =
                                                        FFAppState()
                                                                .addFiveMinutesInMilliseconds +
                                                            (5 * 60 * 1000);

                                                var notificationsRecordReference =
                                                    NotificationsRecord
                                                        .collection
                                                        .doc();
                                                await notificationsRecordReference
                                                    .set({
                                                  ...createNotificationsRecordData(
                                                    timestamp:
                                                        getCurrentTimestamp,
                                                    userPhoto: currentUserPhoto,
                                                    selectedActivityName: _model
                                                        .newRoute?.activityName,
                                                    userID:
                                                        currentUserReference,
                                                    userName:
                                                        currentUserDisplayName,
                                                    isRead: false,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'contactList':
                                                          (currentUserDocument
                                                                      ?.contactList
                                                                      ?.toList() ??
                                                                  [])
                                                              .map((e) => e.id)
                                                              .toList(),
                                                    },
                                                  ),
                                                });
                                                _model.add5Notification =
                                                    NotificationsRecord
                                                        .getDocumentFromData({
                                                  ...createNotificationsRecordData(
                                                    timestamp:
                                                        getCurrentTimestamp,
                                                    userPhoto: currentUserPhoto,
                                                    selectedActivityName: _model
                                                        .newRoute?.activityName,
                                                    userID:
                                                        currentUserReference,
                                                    userName:
                                                        currentUserDisplayName,
                                                    isRead: false,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'contactList':
                                                          (currentUserDocument
                                                                      ?.contactList
                                                                      ?.toList() ??
                                                                  [])
                                                              .map((e) => e.id)
                                                              .toList(),
                                                    },
                                                  ),
                                                }, notificationsRecordReference);
                                                ScaffoldMessenger.of(context)
                                                    .clearSnackBars();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      '5 Minutes has been added to your activity!',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                fontSize: 14.0,
                                                              ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                  ),
                                                );
                                                triggerPushNotification(
                                                  notificationTitle:
                                                      '5 mins added',
                                                  notificationText:
                                                      '${currentUserDisplayName} has just added 5mins to ${_model.startNotification?.selectedActivityName}',
                                                  notificationSound: 'default',
                                                  userRefs: (currentUserDocument
                                                              ?.contactList
                                                              ?.toList() ??
                                                          [])
                                                      .toList(),
                                                  initialPageName: 'HomePage',
                                                  parameterData: {},
                                                );

                                                setState(() {});
                                              },
                                              text: '5min',
                                              icon: Icon(
                                                Icons.add,
                                                size: 20.0,
                                              ),
                                              options: FFButtonOptions(
                                                width: 90.0,
                                                height: 50.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                iconPadding:
                                                    EdgeInsets.all(0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          fontSize: 17.0,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(8.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(8.0),
                                                ),
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'buttonOnPageLoadAnimation3']!),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Container(
                                  width: 350.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child:
                                      StreamBuilder<List<ActivityListRecord>>(
                                    stream: queryActivityListRecord(
                                      queryBuilder: (activityListRecord) =>
                                          activityListRecord
                                              .where(
                                                'isChecked',
                                                isEqualTo: true,
                                              )
                                              .where(
                                                'userID',
                                                isEqualTo: currentUserUid,
                                              ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<ActivityListRecord>
                                          dropDownActivityListRecordList =
                                          snapshot.data!;
                                      return FlutterFlowDropDown<String>(
                                        controller: _model
                                                .dropDownValueController ??=
                                            FormFieldController<String>(null),
                                        options: dropDownActivityListRecordList
                                            .map((e) => e.activity)
                                            .toList(),
                                        onChanged: (val) async {
                                          setState(
                                              () => _model.dropDownValue = val);
                                          FFAppState().selectedActivity =
                                              _model.dropDownValue!;
                                          FFAppState().activityIsSelected =
                                              true;
                                          _model.selectedActivityTime =
                                              await actions.getActivityTime(
                                            FFAppState().selectedActivity,
                                          );
                                          FFAppState().selectedActivityTime =
                                              _model.selectedActivityTime!;
                                          setState(() {
                                            _model.sliderValue = FFAppState()
                                                .selectedActivityTime
                                                .toDouble();
                                          });
                                          _model.selectedActivityTimeinSeconds =
                                              await actions
                                                  .convertIntToDuration(
                                            FFAppState().selectedActivityTime,
                                          );
                                          FFAppState()
                                                  .selectedActivityTimeinSeconds =
                                              _model
                                                  .selectedActivityTimeinSeconds!;
                                          _model.timerController.timer
                                              .setPresetTime(
                                            mSec: valueOrDefault<int>(
                                              FFAppState()
                                                  .selectedActivityTimeinSeconds,
                                              0,
                                            ),
                                            add: false,
                                          );
                                          _model.timerController.onResetTimer();

                                          setState(() {});
                                        },
                                        width: 350.0,
                                        height: 55.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        hintText:
                                            'Please select activity to start...',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 20.0),
                                child: FlutterFlowTimer(
                                  initialTime: _model.timerMilliseconds,
                                  getDisplayTime: (value) =>
                                      StopWatchTimer.getDisplayTime(value,
                                          milliSecond: false),
                                  controller: _model.timerController,
                                  updateStateInterval:
                                      Duration(milliseconds: 1000),
                                  onChanged:
                                      (value, displayTime, shouldUpdate) {
                                    _model.timerMilliseconds = value;
                                    _model.timerValue = displayTime;
                                    if (shouldUpdate) setState(() {});
                                  },
                                  onEnded: () async {
                                    currentUserLocationValue =
                                        await getCurrentUserLocation(
                                            defaultLocation: LatLng(0.0, 0.0));
                                    final firestoreBatch =
                                        FirebaseFirestore.instance.batch();
                                    try {
                                      _model.soundPlayer5 ??= AudioPlayer();
                                      if (_model.soundPlayer5!.playing) {
                                        await _model.soundPlayer5!.stop();
                                      }
                                      _model.soundPlayer5!.setVolume(1.0);
                                      _model.soundPlayer5!
                                          .setAsset(
                                              'assets/audios/alarm-notification.mp3')
                                          .then((_) =>
                                              _model.soundPlayer5!.play());

                                      await _model.googleMapsController.future
                                          .then(
                                        (c) => c.animateCamera(
                                          CameraUpdate.newLatLng(
                                              currentUserLocationValue!
                                                  .toGoogleMaps()),
                                        ),
                                      );
                                      _model.notendedlocationName =
                                          await GeoCodeReverseCall.call(
                                        latitude: functions.latLongString(
                                            currentUserLocationValue!, true),
                                        longitude: functions.latLongString(
                                            currentUserLocationValue!, false),
                                      );

                                      firestoreBatch.update(
                                          FFAppState().newRoute!,
                                          createRouteListRecordData(
                                            locationEnd:
                                                currentUserLocationValue,
                                            finalTime: functions.finalTime(
                                                _model.timerMilliseconds),
                                            durationCircle:
                                                valueOrDefault<double>(
                                              functions.durationCircle2(
                                                  FFAppState().startTime,
                                                  _model.timerMilliseconds,
                                                  FFAppState()
                                                      .addFiveMinutesInMilliseconds),
                                              1.0,
                                            ),
                                            activityTime: functions.finalStartTime(
                                                FFAppState().startTime,
                                                FFAppState()
                                                    .addFiveMinutesInMilliseconds),
                                            endLocationName:
                                                GeoCodeReverseCall.locationName(
                                              (_model.notendedlocationName
                                                      ?.jsonBody ??
                                                  ''),
                                            ).toString(),
                                          ));

                                      firestoreBatch.update(
                                          _model
                                              .notEndedNotification!.reference,
                                          {
                                            ...createNotificationsRecordData(
                                              timestamp: getCurrentTimestamp,
                                              userPhoto: currentUserPhoto,
                                              selectedActivityName:
                                                  _model.newRoute?.activityName,
                                              userID: currentUserReference,
                                              userName: currentUserDisplayName,
                                              endLocation:
                                                  currentUserLocationValue,
                                              isRead: false,
                                              contactNumber: currentPhoneNumber,
                                              isEmergency: true,
                                              endLocationName:
                                                  GeoCodeReverseCall
                                                      .locationName(
                                                (_model.notendedlocationName
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'contactList':
                                                    (currentUserDocument
                                                                ?.contactList
                                                                ?.toList() ??
                                                            [])
                                                        .map((e) => e.id)
                                                        .toList(),
                                              },
                                            ),
                                          });
                                      _model.instantTimer?.cancel();
                                      setState(() {
                                        _model.dropDownValueController?.reset();
                                      });
                                      setState(() {
                                        FFAppState().activityIsSelected = false;
                                        FFAppState().activityStarted = false;
                                        FFAppState().activityNotStopped = true;
                                        FFAppState()
                                            .addFiveMinutesInMilliseconds = 0;
                                      });
                                      triggerPushNotification(
                                        notificationTitle:
                                            'Activity timer ended',
                                        notificationText:
                                            '${currentUserDisplayName} has not stopped their timer for ${_model.startNotification?.selectedActivityName} (${_model.startNotification?.selectedActivityTime}mins)',
                                        notificationSound: 'default',
                                        userRefs: (currentUserDocument
                                                    ?.contactList
                                                    ?.toList() ??
                                                [])
                                            .toList(),
                                        initialPageName: 'HomePage',
                                        parameterData: {},
                                      );
                                    } finally {
                                      await firestoreBatch.commit();
                                    }

                                    setState(() {});
                                  },
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FFAppState().currentTimer > 30000
                                            ? FlutterFlowTheme.of(context)
                                                .primaryText
                                            : FlutterFlowTheme.of(context)
                                                .primary,
                                        fontSize: 60.0,
                                      ),
                                ).animateOnPageLoad(
                                    animationsMap['timerOnPageLoadAnimation']!),
                              ),
                              if (FFAppState().activityIsSelected)
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (!FFAppState().activityStarted)
                                      Text(
                                        'Customize your timer',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge,
                                      ),
                                    if (!FFAppState().activityStarted)
                                      SliderTheme(
                                        data: SliderThemeData(
                                          showValueIndicator:
                                              ShowValueIndicator.always,
                                        ),
                                        child: Slider(
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          inactiveColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          min: 0.0,
                                          max: 120.0,
                                          value: _model.sliderValue ??=
                                              FFAppState()
                                                  .selectedActivityTime
                                                  .toDouble(),
                                          label: _model.sliderValue.toString(),
                                          onChanged: (newValue) async {
                                            newValue = double.parse(
                                                newValue.toStringAsFixed(0));
                                            setState(() =>
                                                _model.sliderValue = newValue);
                                            FFAppState().sliderValue =
                                                _model.sliderValue!;
                                            FFAppState().timeLimitInMinutes =
                                                FFAppState()
                                                        .timeLimitInMinutes =
                                                    FFAppState()
                                                        .sliderValue
                                                        .toInt();
                                            _model.timeLimitInSeconds =
                                                await actions
                                                    .convertIntToDuration(
                                              FFAppState().timeLimitInMinutes,
                                            );
                                            setState(() {
                                              FFAppState().timeLimitInSeconds =
                                                  _model.timeLimitInSeconds!;
                                            });
                                            _model.timerController.timer
                                                .setPresetTime(
                                              mSec: FFAppState()
                                                  .timeLimitInSeconds,
                                              add: false,
                                            );
                                            _model.timerController
                                                .onResetTimer();

                                            setState(() {});
                                          },
                                        ),
                                      ),
                                  ],
                                ).animateOnPageLoad(animationsMap[
                                    'columnOnPageLoadAnimation']!),
                              Container(
                                width: 100.0,
                                height: 80.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                PointerInterceptor(
                  intercepting: isWeb,
                  child: Container(
                    width: double.infinity,
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF111111),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FlutterFlowIconButton(
                          borderRadius: 20.0,
                          borderWidth: 0.0,
                          buttonSize: 40.0,
                          disabledIconColor: Color(0x65F1F4F8),
                          icon: FaIcon(
                            FontAwesomeIcons.route,
                            color: FlutterFlowTheme.of(context).info,
                            size: 24.0,
                          ),
                          onPressed: FFAppState().activityStarted
                              ? null
                              : () async {
                                  context.pushNamed(
                                    'routeList',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.leftToRight,
                                      ),
                                    },
                                  );
                                },
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderRadius: 0.0,
                              borderWidth: 1.0,
                              buttonSize: 60.0,
                              fillColor: FlutterFlowTheme.of(context).primary,
                              disabledIconColor: Color(0x67F1F4F8),
                              icon: Icon(
                                Icons.navigation_rounded,
                                color: FlutterFlowTheme.of(context).info,
                                size: 45.0,
                              ),
                              onPressed: FFAppState().activityStarted
                                  ? null
                                  : () async {
                                      setState(() {
                                        FFAppState().startNow =
                                            FFAppState().startNow == false;
                                      });
                                    },
                            ),
                          ],
                        ),
                        FlutterFlowIconButton(
                          borderRadius: 20.0,
                          borderWidth: 0.0,
                          buttonSize: 40.0,
                          disabledIconColor: Color(0x65F1F4F8),
                          icon: FaIcon(
                            FontAwesomeIcons.cog,
                            color: FlutterFlowTheme.of(context).info,
                            size: 24.0,
                          ),
                          onPressed: FFAppState().activityStarted
                              ? null
                              : () async {
                                  context.pushNamed('settings');
                                },
                        ),
                      ],
                    ),
                  ),
                ),
                if (FFAppState().firstSetup)
                  PointerInterceptor(
                    intercepting: isWeb,
                    child: wrapWithModel(
                      model: _model.setupContainerModel,
                      updateCallback: () => setState(() {}),
                      child: SetupContainerWidget(),
                    ).animateOnPageLoad(
                        animationsMap['setupContainerOnPageLoadAnimation']!),
                  ),
                if (FFAppState().activityNotStopped)
                  PointerInterceptor(
                    intercepting: isWeb,
                    child: wrapWithModel(
                      model: _model.activityNotStoppedModel,
                      updateCallback: () => setState(() {}),
                      child: ActivityNotStoppedWidget(
                        locationName: GeoCodeReverseCall.locationName(
                          (_model.locationName?.jsonBody ?? ''),
                        ).toString(),
                      ),
                    ).animateOnPageLoad(animationsMap[
                        'activityNotStoppedOnPageLoadAnimation']!),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
