// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:wakelock_plus/wakelock_plus.dart';

bool isWakelockEnabled = false;

Future<void> toggleWakelock() async {
  if (isWakelockEnabled) {
    await WakelockPlus.disable();
  } else {
    await WakelockPlus.enable();
  }
  isWakelockEnabled = !isWakelockEnabled;
}
