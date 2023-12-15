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

// Import necessary packages and files
import 'package:cloud_firestore/cloud_firestore.dart';

// Define the function to build the contact list
Future<List<String>> buildContactList(String currentUserId) async {
  // Access the Firestore collection
  CollectionReference contactListRef =
      FirebaseFirestore.instance.collection('contactList');

  // Query the collection to get documents where userId equals the current user's ID
  QuerySnapshot querySnapshot =
      await contactListRef.where('userId', isEqualTo: currentUserId).get();

// Create an empty list to store the notification IDs
  List<String> notificationIds = [];

  // Loop through the documents and add the notification ID to the list
  querySnapshot.docs.forEach((doc) {
    notificationIds.add(doc['notificationID']);
  });

  // Return the list of notification IDs
  return notificationIds;
}
