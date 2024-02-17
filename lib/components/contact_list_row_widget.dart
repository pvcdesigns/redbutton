import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/no_contacts_yet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'contact_list_row_model.dart';
export 'contact_list_row_model.dart';

class ContactListRowWidget extends StatefulWidget {
  const ContactListRowWidget({super.key});

  @override
  State<ContactListRowWidget> createState() => _ContactListRowWidgetState();
}

class _ContactListRowWidgetState extends State<ContactListRowWidget> {
  late ContactListRowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContactListRowModel());

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
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: const AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
              child: Text(
                'Please add contacts to your list using the search bar above. (Only app users are available)',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontWeight: FontWeight.w300,
                    ),
              ),
            ),
          ),
          StreamBuilder<List<ContactListRecord>>(
            stream: queryContactListRecord(
              queryBuilder: (contactListRecord) => contactListRecord.where(
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
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<ContactListRecord> contactListColumnContactListRecordList =
                  snapshot.data!;
              if (contactListColumnContactListRecordList.isEmpty) {
                return const NoContactsYetWidget();
              }
              return Column(
                mainAxisSize: MainAxisSize.max,
                children:
                    List.generate(contactListColumnContactListRecordList.length,
                        (contactListColumnIndex) {
                  final contactListColumnContactListRecord =
                      contactListColumnContactListRecordList[
                          contactListColumnIndex];
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 300.0,
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 15.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 5.0),
                                child: Text(
                                  '${contactListColumnContactListRecord.displayName} - ${valueOrDefault<String>(
                                    contactListColumnContactListRecord.number,
                                    'No number',
                                  )}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              Text(
                                contactListColumnContactListRecord.email,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 12.0,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 40.0,
                        decoration: const BoxDecoration(),
                        child: FlutterFlowIconButton(
                          borderRadius: 20.0,
                          borderWidth: 0.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.delete_forever,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: const Text('Please confirm'),
                                      content: Text(
                                          'You are about to remove ${contactListColumnContactListRecord.displayName} from your emergency list. Are you sure?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: const Text('Confirm'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'contactList': FieldValue.arrayRemove([
                                      contactListColumnContactListRecord
                                          .notificationIDRef
                                    ]),
                                  },
                                ),
                              });
                              await contactListColumnContactListRecord.reference
                                  .delete();
                              _model.updatePage(() {});
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Contact deleted!',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
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
                            }
                          },
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
