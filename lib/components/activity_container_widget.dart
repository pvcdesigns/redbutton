import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'activity_container_model.dart';
export 'activity_container_model.dart';

class ActivityContainerWidget extends StatefulWidget {
  const ActivityContainerWidget({Key? key}) : super(key: key);

  @override
  _ActivityContainerWidgetState createState() =>
      _ActivityContainerWidgetState();
}

class _ActivityContainerWidgetState extends State<ActivityContainerWidget> {
  late ActivityContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActivityContainerModel());

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
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          StreamBuilder<List<ActivityListRecord>>(
            stream: queryActivityListRecord(
              queryBuilder: (activityListRecord) => activityListRecord
                  .where(
                    'userID',
                    isEqualTo: currentUserUid,
                  )
                  .orderBy('activity'),
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
              List<ActivityListRecord> columnActivityListRecordList =
                  snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: List.generate(columnActivityListRecordList.length,
                    (columnIndex) {
                  final columnActivityListRecord =
                      columnActivityListRecordList[columnIndex];
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 260.0,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: Text(
                                columnActivityListRecord.activity,
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                            Text(
                              '${columnActivityListRecord.time.toString()}mins',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 80.0,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 50.0,
                                borderWidth: 0.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.delete_forever,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  await columnActivityListRecord.reference
                                      .delete();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Activity deleted!',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              fontSize: 14.0,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                    ),
                                  );
                                },
                              ),
                            ),
                            ToggleIcon(
                              onPressed: () async {
                                await columnActivityListRecord.reference
                                    .update({
                                  ...mapToFirestore(
                                    {
                                      'isChecked':
                                          !columnActivityListRecord.isChecked,
                                    },
                                  ),
                                });

                                await columnActivityListRecord.reference
                                    .update(createActivityListRecordData(
                                  isChecked:
                                      !columnActivityListRecord.isChecked,
                                ));
                              },
                              value: columnActivityListRecord.isChecked,
                              onIcon: Icon(
                                Icons.check_circle,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 25.0,
                              ),
                              offIcon: Icon(
                                Icons.circle_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 25.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
