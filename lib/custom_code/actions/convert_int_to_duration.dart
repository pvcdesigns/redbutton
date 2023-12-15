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

Future<int?> convertIntToDuration(int? timeLimitInMinutes) async {
  // use argument value, asume it is MM, convert to HH:value:SS. return value in ms
  if (timeLimitInMinutes == null) {
    return null;
  }

  int hours = (timeLimitInMinutes / 60).floor();
  int minutes = timeLimitInMinutes % 60;

  String formattedTime = '$hours:${minutes.toString().padLeft(2, '0')}:00';

  Duration duration = Duration(
    hours: hours,
    minutes: minutes,
  );

  return duration.inMilliseconds;
}
