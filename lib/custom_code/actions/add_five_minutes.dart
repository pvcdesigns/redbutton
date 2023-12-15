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

Future<int> addFiveMinutes(int? currentTimer) async {
  // use argument value, add 5 mins in miliseconds, return value in miliseconds
  if (currentTimer == null) {
    return Future.error('Current timer value is null');
  }
  int fiveMinutesInMilliseconds = 5 * 60 * 1000;
  int newTimerValue = currentTimer + fiveMinutesInMilliseconds;
  return Future.value(newTimerValue);
}
