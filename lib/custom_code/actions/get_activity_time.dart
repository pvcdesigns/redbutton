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

import 'package:cloud_firestore/cloud_firestore.dart';

// Create a reference to the activityList collection in Firestore
CollectionReference activityListRef =
    FirebaseFirestore.instance.collection('activityList');

// Define the function to get the activity time
Future<int> getActivityTime(String? selectedActivity) async {
  // Check if the selectedActivity argument is null or empty
  if (selectedActivity == null || selectedActivity.isEmpty) {
    throw ArgumentError('selectedActivity argument cannot be null or empty');
  }

  // Query the activityList collection for the document with the matching activity name
  QuerySnapshot querySnapshot = await activityListRef
      .where('activity', isEqualTo: selectedActivity)
      .get();

  // Check if the query returned any documents
  if (querySnapshot.docs.isEmpty) {
    throw ArgumentError(
        'No document found with activityName: $selectedActivity');
  }

  // Get the first document from the query results
  DocumentSnapshot documentSnapshot = querySnapshot.docs.first;

  // Get the time field value from the document
  int time = documentSnapshot.get('time');

  // Return the time value
  return time;
}
