import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/no_contacts_yet_widget.dart';
import '/components/no_notifications_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:map_launcher/map_launcher.dart' as $ml;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'notifications_model.dart';
export 'notifications_model.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({
    Key? key,
    this.newRoute,
  }) : super(key: key);

  final RouteListRecord? newRoute;

  @override
  _NotificationsWidgetState createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget>
    with TickerProviderStateMixin {
  late NotificationsModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ShakeEffect(
          curve: Curves.easeInOut,
          delay: 3000.ms,
          duration: 1000.ms,
          hz: 5,
          offset: Offset(1.0, 1.0),
          rotation: 0.035,
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ShakeEffect(
          curve: Curves.easeInOut,
          delay: 3000.ms,
          duration: 1000.ms,
          hz: 5,
          offset: Offset(1.0, 1.0),
          rotation: 0.035,
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0.0, -50.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0.0, -50.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0.0, -50.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
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
    _model = createModel(context, () => NotificationsModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlutterFlowIconButton(
                borderRadius: 50.0,
                borderWidth: 0.0,
                buttonSize: 50.0,
                fillColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.medical_information,
                  color: FlutterFlowTheme.of(context).info,
                  size: 25.0,
                ),
                onPressed: () async {
                  setState(() {
                    FFAppState().showRequests = false;
                    FFAppState().showNotifications = false;
                    FFAppState().showMedCard =
                        FFAppState().showMedCard == false;
                  });
                },
              ),
              FlutterFlowIconButton(
                borderRadius: 20.0,
                borderWidth: 0.0,
                buttonSize: 45.0,
                icon: FaIcon(
                  FontAwesomeIcons.hatWizard,
                  color: FlutterFlowTheme.of(context).info,
                  size: 24.0,
                ),
                onPressed: FFAppState().activityStarted == true
                    ? null
                    : () async {
                        _model.updatePage(() {
                          FFAppState().showNotifications = false;
                          FFAppState().showMedCard = false;
                          FFAppState().showRequests = false;
                          FFAppState().firstSetup = true;
                        });
                      },
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: Stack(
                      alignment: AlignmentDirectional(1.0, -1.0),
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderRadius: 50.0,
                            borderWidth: 0.0,
                            buttonSize: 45.0,
                            icon: Icon(
                              Icons.person,
                              color: FlutterFlowTheme.of(context).info,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              setState(() {
                                FFAppState().showNotifications = false;
                                FFAppState().showMedCard = false;
                                FFAppState().showRequests =
                                    FFAppState().showRequests == false;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 6.0, 0.0),
                          child: FutureBuilder<int>(
                            future: queryNotificationsRecordCount(
                              queryBuilder: (notificationsRecord) =>
                                  notificationsRecord.where(
                                'contactID',
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
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              int containerCount = snapshot.data!;
                              return Container(
                                width: 15.0,
                                height: 15.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    containerCount > 0
                                        ? FlutterFlowTheme.of(context).primary
                                        : Colors.transparent,
                                    Colors.transparent,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Visibility(
                                  visible: containerCount > 0,
                                  child: Text(
                                    containerCount.toString(),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          fontSize: 10.0,
                                        ),
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation1']!);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: Stack(
                      alignment: AlignmentDirectional(1.0, -1.0),
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 50.0,
                          borderWidth: 0.0,
                          buttonSize: 45.0,
                          icon: Icon(
                            Icons.notifications,
                            color: FlutterFlowTheme.of(context).info,
                            size: 30.0,
                          ),
                          onPressed: () async {
                            setState(() {
                              FFAppState().showRequests = false;
                              FFAppState().showMedCard = false;
                              FFAppState().showNotifications =
                                  FFAppState().showNotifications == false;
                            });
                          },
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 5.0, 0.0),
                          child: FutureBuilder<int>(
                            future: queryNotificationsRecordCount(
                              queryBuilder: (notificationsRecord) =>
                                  notificationsRecord.where(
                                'contactList',
                                arrayContains: currentUserUid,
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
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              int containerCount = snapshot.data!;
                              return Container(
                                width: 15.0,
                                height: 15.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    containerCount > 0
                                        ? FlutterFlowTheme.of(context).primary
                                        : Colors.transparent,
                                    Colors.transparent,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Visibility(
                                  visible: containerCount > 0,
                                  child: Text(
                                    containerCount.toString(),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          fontSize: 10.0,
                                        ),
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation2']!);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (FFAppState().showRequests)
          Flexible(
            child: Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.95,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 2.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 5.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Contact Requests',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 20.0,
                                      ),
                                ),
                                FlutterFlowIconButton(
                                  borderRadius: 20.0,
                                  borderWidth: 0.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.close,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    setState(() {
                                      FFAppState().showRequests = false;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: FutureBuilder<List<NotificationsRecord>>(
                              future: queryNotificationsRecordOnce(
                                queryBuilder: (notificationsRecord) =>
                                    notificationsRecord
                                        .where(
                                          'contactID',
                                          isEqualTo: currentUserUid,
                                        )
                                        .orderBy('timestamp', descending: true),
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<NotificationsRecord>
                                    listViewNotificationsRecordList =
                                    snapshot.data!;
                                if (listViewNotificationsRecordList.isEmpty) {
                                  return NoNotificationsWidget();
                                }
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      listViewNotificationsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewNotificationsRecord =
                                        listViewNotificationsRecordList[
                                            listViewIndex];
                                    return Opacity(
                                      opacity:
                                          listViewNotificationsRecord.isRead
                                              ? 0.5
                                              : 1.0,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 10.0, 20.0, 20.0),
                                        child: StreamBuilder<UsersRecord>(
                                          stream: UsersRecord.getDocument(
                                              listViewNotificationsRecord
                                                  .userID!),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            final columnUsersRecord =
                                                snapshot.data!;
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (listViewNotificationsRecord
                                                        .approvalProcess ==
                                                    true)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            columnUsersRecord
                                                                .photoUrl,
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/red-button-v2-fpbbsu/assets/a78o8iw27cci/profile-pic-blank.png',
                                                          ),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.43,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    '${columnUsersRecord.displayName} has added you as their emergency contact.',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          fontSize:
                                                                              13.0,
                                                                        ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            3.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      columnUsersRecord
                                                                          .email,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                12.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      dateTimeFormat(
                                                                          'relative',
                                                                          listViewNotificationsRecord
                                                                              .timestamp!),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiary,
                                                                            fontSize:
                                                                                10.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderRadius:
                                                                  20.0,
                                                              borderWidth: 0.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              icon: Icon(
                                                                Icons.close,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                size: 22.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                var notificationsRecordReference =
                                                                    NotificationsRecord
                                                                        .collection
                                                                        .doc();
                                                                await notificationsRecordReference
                                                                    .set(
                                                                        createNotificationsRecordData(
                                                                  userName:
                                                                      currentUserDisplayName,
                                                                  contactID:
                                                                      listViewNotificationsRecord
                                                                          .userID
                                                                          ?.id,
                                                                  userPhoto:
                                                                      currentUserPhoto,
                                                                  timestamp:
                                                                      getCurrentTimestamp,
                                                                  contactEmail:
                                                                      currentUserEmail,
                                                                  approved:
                                                                      false,
                                                                  userID:
                                                                      listViewNotificationsRecord
                                                                          .userID,
                                                                  approvalProcess:
                                                                      false,
                                                                ));
                                                                _model.contactDeclined =
                                                                    NotificationsRecord
                                                                        .getDocumentFromData(
                                                                            createNotificationsRecordData(
                                                                              userName: currentUserDisplayName,
                                                                              contactID: listViewNotificationsRecord.userID?.id,
                                                                              userPhoto: currentUserPhoto,
                                                                              timestamp: getCurrentTimestamp,
                                                                              contactEmail: currentUserEmail,
                                                                              approved: false,
                                                                              userID: listViewNotificationsRecord.userID,
                                                                              approvalProcess: false,
                                                                            ),
                                                                            notificationsRecordReference);
                                                                await listViewNotificationsRecord
                                                                    .reference
                                                                    .delete();
                                                                setState(() {
                                                                  FFAppState()
                                                                          .hasNotification =
                                                                      false;
                                                                });
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Request declined and deleted!',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            fontSize:
                                                                                14.0,
                                                                          ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                  ),
                                                                );
                                                                triggerPushNotification(
                                                                  notificationTitle:
                                                                      'Contact request declined',
                                                                  notificationText:
                                                                      '${currentUserDisplayName} has just declined your request for emergency contact.',
                                                                  notificationSound:
                                                                      'default',
                                                                  userRefs: [
                                                                    listViewNotificationsRecord
                                                                        .userID!
                                                                  ],
                                                                  initialPageName:
                                                                      'HomePage',
                                                                  parameterData: {},
                                                                );

                                                                setState(() {});
                                                              },
                                                            ),
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderRadius: 20.0,
                                                            borderWidth: 0.0,
                                                            buttonSize: 40.0,
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                            icon: Icon(
                                                              Icons.check,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              size: 22.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              var contactListRecordReference =
                                                                  ContactListRecord
                                                                      .collection
                                                                      .doc();
                                                              await contactListRecordReference
                                                                  .set(
                                                                      createContactListRecordData(
                                                                displayName:
                                                                    currentUserDisplayName,
                                                                number:
                                                                    currentPhoneNumber,
                                                                email:
                                                                    currentUserEmail,
                                                                userId:
                                                                    listViewNotificationsRecord
                                                                        .userID
                                                                        ?.id,
                                                                notificationID:
                                                                    currentUserUid,
                                                                notificationIDRef:
                                                                    currentUserReference,
                                                              ));
                                                              _model.selectedContactList =
                                                                  ContactListRecord
                                                                      .getDocumentFromData(
                                                                          createContactListRecordData(
                                                                            displayName:
                                                                                currentUserDisplayName,
                                                                            number:
                                                                                currentPhoneNumber,
                                                                            email:
                                                                                currentUserEmail,
                                                                            userId:
                                                                                listViewNotificationsRecord.userID?.id,
                                                                            notificationID:
                                                                                currentUserUid,
                                                                            notificationIDRef:
                                                                                currentUserReference,
                                                                          ),
                                                                          contactListRecordReference);

                                                              var notificationsRecordReference =
                                                                  NotificationsRecord
                                                                      .collection
                                                                      .doc();
                                                              await notificationsRecordReference
                                                                  .set(
                                                                      createNotificationsRecordData(
                                                                userName:
                                                                    currentUserDisplayName,
                                                                contactID:
                                                                    listViewNotificationsRecord
                                                                        .userID
                                                                        ?.id,
                                                                userPhoto:
                                                                    currentUserPhoto,
                                                                timestamp:
                                                                    getCurrentTimestamp,
                                                                contactEmail:
                                                                    currentUserEmail,
                                                                approved: true,
                                                                userID:
                                                                    listViewNotificationsRecord
                                                                        .userID,
                                                                approvalProcess:
                                                                    false,
                                                                contactIDRef:
                                                                    listViewNotificationsRecord
                                                                        .contactIDRef,
                                                              ));
                                                              _model.contactAccepted =
                                                                  NotificationsRecord
                                                                      .getDocumentFromData(
                                                                          createNotificationsRecordData(
                                                                            userName:
                                                                                currentUserDisplayName,
                                                                            contactID:
                                                                                listViewNotificationsRecord.userID?.id,
                                                                            userPhoto:
                                                                                currentUserPhoto,
                                                                            timestamp:
                                                                                getCurrentTimestamp,
                                                                            contactEmail:
                                                                                currentUserEmail,
                                                                            approved:
                                                                                true,
                                                                            userID:
                                                                                listViewNotificationsRecord.userID,
                                                                            approvalProcess:
                                                                                false,
                                                                            contactIDRef:
                                                                                listViewNotificationsRecord.contactIDRef,
                                                                          ),
                                                                          notificationsRecordReference);
                                                              await listViewNotificationsRecord
                                                                  .reference
                                                                  .delete();
                                                              setState(() {
                                                                FFAppState()
                                                                        .hasNotification =
                                                                    false;
                                                              });
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'You have been added to ${columnUsersRecord.displayName}\'s emergency contact list!',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          fontSize:
                                                                              14.0,
                                                                        ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                ),
                                                              );
                                                              triggerPushNotification(
                                                                notificationTitle:
                                                                    'Contact request confirmed',
                                                                notificationText:
                                                                    '${currentUserDisplayName} has just accepted your request for emergency contact.',
                                                                notificationSound:
                                                                    'default',
                                                                userRefs: [
                                                                  listViewNotificationsRecord
                                                                      .userID!
                                                                ],
                                                                initialPageName:
                                                                    'HomePage',
                                                                parameterData: {},
                                                              );

                                                              setState(() {});
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                if (listViewNotificationsRecord
                                                        .approvalProcess ==
                                                    false)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            listViewNotificationsRecord
                                                                .userPhoto,
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/red-button-v2-fpbbsu/assets/a78o8iw27cci/profile-pic-blank.png',
                                                          ),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.61,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              if (listViewNotificationsRecord
                                                                      .approved ==
                                                                  true)
                                                                Text(
                                                                  '${listViewNotificationsRecord.userName} has accepted your request for emergency contact.',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            13.0,
                                                                      ),
                                                                ),
                                                              if (listViewNotificationsRecord
                                                                      .approved ==
                                                                  false)
                                                                Text(
                                                                  '${listViewNotificationsRecord.userName} has declined your request for emergency contact.',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            13.0,
                                                                      ),
                                                                ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  listViewNotificationsRecord
                                                                      .contactEmail,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  dateTimeFormat(
                                                                      'relative',
                                                                      listViewNotificationsRecord
                                                                          .timestamp!),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        fontSize:
                                                                            10.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      if (listViewNotificationsRecord
                                                              .isRead ==
                                                          true)
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 0.0,
                                                          buttonSize: 40.0,
                                                          icon: Icon(
                                                            Icons.close,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            size: 20.0,
                                                          ),
                                                          onPressed: () async {
                                                            await listViewNotificationsRecord
                                                                .reference
                                                                .delete();
                                                            setState(() {
                                                              FFAppState()
                                                                      .noticeRead =
                                                                  false;
                                                            });
                                                          },
                                                        ),
                                                      if (listViewNotificationsRecord
                                                              .isRead ==
                                                          false)
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            if (listViewNotificationsRecord
                                                                    .approved ==
                                                                true)
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                icon: Icon(
                                                                  Icons.link,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  size: 20.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  await listViewNotificationsRecord
                                                                      .reference
                                                                      .update(
                                                                          createNotificationsRecordData(
                                                                    isRead:
                                                                        true,
                                                                  ));

                                                                  await currentUserReference!
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'contactList':
                                                                            FieldValue.arrayUnion([
                                                                          listViewNotificationsRecord
                                                                              .contactIDRef
                                                                        ]),
                                                                      },
                                                                    ),
                                                                  });
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .noticeRead =
                                                                        true;
                                                                  });
                                                                },
                                                              ),
                                                            if (listViewNotificationsRecord
                                                                    .approved ==
                                                                true)
                                                              Text(
                                                                'Link',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          10.0,
                                                                    ),
                                                              ),
                                                            if (listViewNotificationsRecord
                                                                    .approved ==
                                                                false)
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .delete_forever,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 20.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  await listViewNotificationsRecord
                                                                      .reference
                                                                      .update(
                                                                          createNotificationsRecordData(
                                                                    isRead:
                                                                        true,
                                                                  ));
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .noticeRead =
                                                                        true;
                                                                  });
                                                                },
                                                              ),
                                                          ],
                                                        ),
                                                    ],
                                                  ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation3']!),
              ),
            ),
          ),
        if (FFAppState().showNotifications)
          Flexible(
            child: Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.95,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 2.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 5.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Notifications',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 20.0,
                                      ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 20.0,
                                  borderWidth: 0.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.close,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    setState(() {
                                      FFAppState().showNotifications = false;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(),
                            child: FutureBuilder<List<NotificationsRecord>>(
                              future: queryNotificationsRecordOnce(
                                queryBuilder: (notificationsRecord) =>
                                    notificationsRecord
                                        .where(
                                          'contactList',
                                          arrayContains: currentUserUid,
                                        )
                                        .orderBy('timestamp', descending: true),
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<NotificationsRecord>
                                    columnNotificationsRecordList =
                                    snapshot.data!;
                                if (columnNotificationsRecordList.isEmpty) {
                                  return NoNotificationsWidget();
                                }
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                        columnNotificationsRecordList.length,
                                        (columnIndex) {
                                      final columnNotificationsRecord =
                                          columnNotificationsRecordList[
                                              columnIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 10.0, 15.0, 20.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 50.0,
                                              height: 50.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  columnNotificationsRecord
                                                      .userPhoto,
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/red-button-v2-fpbbsu/assets/a78o8iw27cci/profile-pic-blank.png',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.57,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        if (columnNotificationsRecord
                                                                .startLocation !=
                                                            null)
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await launchMap(
                                                                location:
                                                                    columnNotificationsRecord
                                                                        .startLocation,
                                                                title: '',
                                                              );
                                                            },
                                                            child: Text(
                                                              '${columnNotificationsRecord.userName} has just started ${columnNotificationsRecord.selectedActivityName} for ${columnNotificationsRecord.selectedActivityTime}mins at ${valueOrDefault<String>(
                                                                columnNotificationsRecord
                                                                    .startLocationName,
                                                                '(click here)',
                                                              )}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    fontSize:
                                                                        13.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        if ((columnNotificationsRecord
                                                                    .endLocation !=
                                                                null) &&
                                                            (columnNotificationsRecord
                                                                    .isEmergency ==
                                                                false))
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await launchMap(
                                                                location:
                                                                    columnNotificationsRecord
                                                                        .endLocation,
                                                                title: '',
                                                              );
                                                            },
                                                            child: Text(
                                                              '${columnNotificationsRecord.userName} has just finished ${columnNotificationsRecord.selectedActivityName} safely at ${valueOrDefault<String>(
                                                                columnNotificationsRecord
                                                                    .endLocationName,
                                                                '(click here)',
                                                              )}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    fontSize:
                                                                        13.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        if ((columnNotificationsRecord
                                                                    .response ==
                                                                false) &&
                                                            (columnNotificationsRecord
                                                                    .isEmergency ==
                                                                true))
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await launchMap(
                                                                location:
                                                                    columnNotificationsRecord
                                                                        .endLocation,
                                                                title: '',
                                                              );
                                                            },
                                                            child: Text(
                                                              '${columnNotificationsRecord.userName} has not stopped the timer for ${columnNotificationsRecord.selectedActivityName}(${columnNotificationsRecord.selectedActivityTime}mins). Please get in touch. This is their last recorded location: ${valueOrDefault<String>(
                                                                columnNotificationsRecord
                                                                    .endLocationName,
                                                                '(click here)',
                                                              )}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xFFF8A233),
                                                                    fontSize:
                                                                        13.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        if ((columnNotificationsRecord
                                                                    .endLocation ==
                                                                null) &&
                                                            (columnNotificationsRecord
                                                                    .isEmergency ==
                                                                false) &&
                                                            (columnNotificationsRecord
                                                                    .startLocation ==
                                                                null))
                                                          Text(
                                                            '${columnNotificationsRecord.userName} has just added 5 minutes to ${columnNotificationsRecord.selectedActivityName}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  fontSize:
                                                                      13.0,
                                                                ),
                                                          ),
                                                        if ((columnNotificationsRecord
                                                                    .response ==
                                                                true) &&
                                                            (columnNotificationsRecord
                                                                    .isEmergency ==
                                                                true))
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              if (columnNotificationsRecord
                                                                      .needHelp ==
                                                                  false)
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await launchMap(
                                                                      location:
                                                                          columnNotificationsRecord
                                                                              .endLocation,
                                                                      title: '',
                                                                    );
                                                                  },
                                                                  child: Text(
                                                                    '${columnNotificationsRecord.userName} has just confirmed they are safe, and finished with ${columnNotificationsRecord.selectedActivityName} at ${valueOrDefault<String>(
                                                                      columnNotificationsRecord
                                                                          .endLocationName,
                                                                      '(click here)',
                                                                    )}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          fontSize:
                                                                              13.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              if (columnNotificationsRecord
                                                                      .needHelp ==
                                                                  true)
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await launchMap(
                                                                      location:
                                                                          columnNotificationsRecord
                                                                              .endLocation,
                                                                      title: '',
                                                                    );
                                                                  },
                                                                  child: Text(
                                                                    '${columnNotificationsRecord.userName} has confirmed they need HELP! Please contact them now! This is their current location: ${valueOrDefault<String>(
                                                                      columnNotificationsRecord
                                                                          .endLocationName,
                                                                      '(click here)',
                                                                    )}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          fontSize:
                                                                              13.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        if (columnNotificationsRecord
                                                                    .contactNumber !=
                                                                null &&
                                                            columnNotificationsRecord
                                                                    .contactNumber !=
                                                                '')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await launchUrl(
                                                                    Uri(
                                                                  scheme: 'tel',
                                                                  path: columnNotificationsRecord
                                                                      .contactNumber,
                                                                ));
                                                              },
                                                              child: Text(
                                                                'Phone number: ${columnNotificationsRecord.contactNumber}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ),
                                                          ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            dateTimeFormat(
                                                                'relative',
                                                                columnNotificationsRecord
                                                                    .timestamp!),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  fontSize:
                                                                      10.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (columnNotificationsRecord
                                                    .isRead ==
                                                true)
                                              FlutterFlowIconButton(
                                                borderRadius: 20.0,
                                                borderWidth: 0.0,
                                                buttonSize: 40.0,
                                                icon: Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  size: 20.0,
                                                ),
                                                onPressed: () async {
                                                  _model.buildContactListAction2 =
                                                      await actions
                                                          .buildContactList(
                                                    currentUserUid,
                                                  );
                                                  if (columnNotificationsRecord
                                                          .contactList.length <=
                                                      1) {
                                                    await columnNotificationsRecord
                                                        .reference
                                                        .delete();
                                                  } else {
                                                    await columnNotificationsRecord
                                                        .reference
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'contactList':
                                                              FieldValue
                                                                  .arrayRemove([
                                                            currentUserUid
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                  }

                                                  setState(() {
                                                    FFAppState().noticeRead =
                                                        false;
                                                  });

                                                  setState(() {});
                                                },
                                              ),
                                            if (columnNotificationsRecord
                                                    .isRead ==
                                                false)
                                              FlutterFlowIconButton(
                                                borderRadius: 20.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                icon: FaIcon(
                                                  FontAwesomeIcons.eyeSlash,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 18.0,
                                                ),
                                                onPressed: () async {
                                                  await columnNotificationsRecord
                                                      .reference
                                                      .update(
                                                          createNotificationsRecordData(
                                                    isRead: true,
                                                  ));
                                                  setState(() {
                                                    FFAppState().noticeRead =
                                                        true;
                                                  });
                                                },
                                              ),
                                          ],
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation4']!),
              ),
            ),
          ),
        if (FFAppState().showMedCard)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.95,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Transform.rotate(
                      angle: 0.0,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.sizeOf(context).height * 0.75,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Medical Information',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Outfit',
                                            fontSize: 20.0,
                                          ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.close,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        setState(() {
                                          FFAppState().showMedCard = false;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.27,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Name',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.57,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Color(0xFF101010)
                                          : Color(0xFFEFEFEF),
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            valueOrDefault<String>(
                                              currentUserDisplayName,
                                              'Please add name',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 16.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.27,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Color(0xFF101010)
                                          : Color(0xFFEFEFEF),
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Medical Aid',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.57,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          valueOrDefault<String>(
                                            valueOrDefault(
                                                currentUserDocument?.medicalAid,
                                                ''),
                                            'Please add medical aid',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 16.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.27,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Policy #',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.57,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Color(0xFF101010)
                                          : Color(0xFFEFEFEF),
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            valueOrDefault<String>(
                                              valueOrDefault(
                                                  currentUserDocument
                                                      ?.policyNumber,
                                                  ''),
                                              'Please add policy number',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 16.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.27,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Color(0xFF101010)
                                          : Color(0xFFEFEFEF),
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Blood Type',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.57,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            valueOrDefault<String>(
                                              valueOrDefault(
                                                  currentUserDocument
                                                      ?.bloodType,
                                                  ''),
                                              'Please add blood type',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 16.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.27,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Allergies',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.57,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Color(0xFF101010)
                                          : Color(0xFFEFEFEF),
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            valueOrDefault<String>(
                                              valueOrDefault(
                                                  currentUserDocument
                                                      ?.allergies,
                                                  ''),
                                              'Please add allergies',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 16.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.27,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Color(0xFF101010)
                                          : Color(0xFFEFEFEF),
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Emergency Contacts',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.57,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: StreamBuilder<
                                          List<ContactListRecord>>(
                                        stream: queryContactListRecord(
                                          queryBuilder: (contactListRecord) =>
                                              contactListRecord.where(
                                            'userId',
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
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<ContactListRecord>
                                              columnContactListRecordList =
                                              snapshot.data!;
                                          if (columnContactListRecordList
                                              .isEmpty) {
                                            return NoContactsYetWidget();
                                          }
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(
                                                columnContactListRecordList
                                                    .length, (columnIndex) {
                                              final columnContactListRecord =
                                                  columnContactListRecordList[
                                                      columnIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Text(
                                                        columnContactListRecord
                                                            .displayName,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              fontSize: 15.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  2.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons.call,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 16.0,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                columnContactListRecord
                                                                    .number,
                                                                '--',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.email,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          size: 14.0,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            columnContactListRecord
                                                                .email,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  fontSize:
                                                                      10.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ).animateOnPageLoad(
                animationsMap['containerOnPageLoadAnimation5']!),
          ),
        if (FFAppState().startNow == false)
          Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Container(
              width: 0.0,
              height: 80.0,
              decoration: BoxDecoration(),
            ),
          ),
      ],
    );
  }
}
