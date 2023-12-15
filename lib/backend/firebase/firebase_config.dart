import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBBr1HPzLPQaDlNEf31Q3_BuUnBZu0UzUQ",
            authDomain: "red-button-b6c84.firebaseapp.com",
            projectId: "red-button-b6c84",
            storageBucket: "red-button-b6c84.appspot.com",
            messagingSenderId: "390180966799",
            appId: "1:390180966799:web:634f06ef0a0c6b3e207bfa"));
  } else {
    await Firebase.initializeApp();
  }
}
