import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for display_name widget.
  FocusNode? displayNameFocusNode;
  TextEditingController? displayNameController;
  String? Function(BuildContext, String?)? displayNameControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  String? _emailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for phone_number widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberController;
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  String? _phoneNumberControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

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

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emailControllerValidator = _emailControllerValidator;
    phoneNumberControllerValidator = _phoneNumberControllerValidator;
  }

  void dispose() {
    displayNameFocusNode?.dispose();
    displayNameController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberController?.dispose();

    medicalAidFocusNode?.dispose();
    medicalAidController?.dispose();

    policyNumberFocusNode?.dispose();
    policyNumberController?.dispose();

    allergiesFocusNode?.dispose();
    allergiesController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
