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
import 'notifications_widget.dart' show NotificationsWidget;
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

class NotificationsModel extends FlutterFlowModel<NotificationsWidget> {
  ///  Local state fields for this component.

  int idCounter = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  NotificationsRecord? contactDeclined;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ContactListRecord? selectedContactList;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  NotificationsRecord? contactAccepted;
  // Stores action output result for [Custom Action - buildContactList] action in IconButton widget.
  List<String>? buildContactListAction2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
