import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/activity_container_widget.dart';
import '/components/contact_list_row_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'setup_container_widget.dart' show SetupContainerWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SetupContainerModel extends FlutterFlowModel<SetupContainerWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for phone_number widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberController;
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  // State field(s) for medical_aid widget.
  FocusNode? medicalAidFocusNode;
  TextEditingController? medicalAidController;
  String? Function(BuildContext, String?)? medicalAidControllerValidator;
  // State field(s) for policy_number widget.
  FocusNode? policyNumberFocusNode;
  TextEditingController? policyNumberController;
  String? Function(BuildContext, String?)? policyNumberControllerValidator;
  // State field(s) for blood_type widget.
  String? bloodTypeValue;
  FormFieldController<String>? bloodTypeValueController;
  // State field(s) for allergies widget.
  FocusNode? allergiesFocusNode;
  TextEditingController? allergiesController;
  String? Function(BuildContext, String?)? allergiesControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActivityListRecord? customActivity;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController;

  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ActivityListRecord? customActivity2;
  // Model for activityContainer component.
  late ActivityContainerModel activityContainerModel;
  // State field(s) for searchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldController;
  String? Function(BuildContext, String?)? searchFieldControllerValidator;
  // Algolia Search Results from action on IconButton
  List<UsersRecord>? algoliaSearchResults = [];
  // State field(s) for CheckboxListTile widget.

  Map<UsersRecord, bool> checkboxListTileValueMap = {};
  List<UsersRecord> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // Model for contactListRow component.
  late ContactListRowModel contactListRowModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    activityContainerModel =
        createModel(context, () => ActivityContainerModel());
    contactListRowModel = createModel(context, () => ContactListRowModel());
  }

  void dispose() {
    phoneNumberFocusNode?.dispose();
    phoneNumberController?.dispose();

    medicalAidFocusNode?.dispose();
    medicalAidController?.dispose();

    policyNumberFocusNode?.dispose();
    policyNumberController?.dispose();

    allergiesFocusNode?.dispose();
    allergiesController?.dispose();

    textFieldFocusNode1?.dispose();
    textController5?.dispose();

    textFieldFocusNode2?.dispose();
    textController6?.dispose();

    expandableController.dispose();
    activityContainerModel.dispose();
    searchFieldFocusNode?.dispose();
    searchFieldController?.dispose();

    contactListRowModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
