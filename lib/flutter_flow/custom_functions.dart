import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

DateTimeRange? setTimerfromSlider(double? sliderValue) {
  // use argument value, use millisecondsSinceEpoch /1000
  if (sliderValue == null) {
    return null;
  }

  final int seconds = (sliderValue * 60).round();
  final DateTime now = DateTime.now();
  final DateTime start = now.add(Duration(seconds: 1));
  final DateTime end = start.add(Duration(seconds: seconds));

  return DateTimeRange(start: start, end: end);
}

String finalTime(int timeLeft) {
  // use arg value, convert from ms to HH:MM:SS
  final Duration duration = Duration(milliseconds: timeLeft);
  final int seconds = duration.inSeconds % 60;
  final int minutes = duration.inMinutes % 60;
  final int hours = duration.inHours % 24;
  final String secondsStr = seconds.toString().padLeft(2, '0');
  final String minutesStr = minutes.toString().padLeft(2, '0');
  final String hoursStr = hours.toString().padLeft(2, '0');
  return '$hoursStr:$minutesStr:$secondsStr';
}

String? activityDuration(
  String activityTime,
  String finalTime,
) {
  // Calculate time difference between arg 2 and arg 1 (final time minus activity time)
  final DateFormat formatter = DateFormat('hh:mm:ss');
  final DateTime activityDateTime = formatter.parse(activityTime);
  final DateTime finalDateTime = formatter.parse(finalTime);
  final Duration duration = activityDateTime.difference(finalDateTime);
  final int hours = duration.inHours;
  final int minutes = duration.inMinutes.remainder(60);
  final int seconds = duration.inSeconds.remainder(60);
  return '$hours:$minutes:$seconds';
}

String finalStartTime(
  int startTime,
  int? addFiveMinutesInMilliseconds,
) {
  int finalStartTime = startTime + addFiveMinutesInMilliseconds!;
  // use arg value, convert from ms to HH:MM:SS
  final Duration duration = Duration(milliseconds: finalStartTime);
  final int seconds = duration.inSeconds % 60;
  final int minutes = duration.inMinutes % 60;
  final int hours = duration.inHours % 24;
  final String secondsStr = seconds.toString().padLeft(2, '0');
  final String minutesStr = minutes.toString().padLeft(2, '0');
  final String hoursStr = hours.toString().padLeft(2, '0');
  return '$hoursStr:$minutesStr:$secondsStr';
}

double durationCircle2(
  int startTime,
  int endTime,
  int? addFiveMinutesInMilliseconds,
) {
  // Calculate the opposite percentage value
  final int finalStartTime = startTime + addFiveMinutesInMilliseconds!;
  final double percentage = (endTime / finalStartTime * 100);
  final double oppositePercentage = (100 - percentage) / 100;

  // Check if oppositePercentage is 0, and if so, add 1
  if (oppositePercentage == 0) {
    return 1.0;
  } else {
    return oppositePercentage;
  }
}

String? latLongString(
  LatLng activityLocation,
  bool isLat,
) {
  if (isLat) {
    return activityLocation.latitude.toString();
  } else {
    return activityLocation.longitude.toString();
  }
}
