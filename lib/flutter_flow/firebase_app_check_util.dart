import 'package:firebase_app_check/firebase_app_check.dart';

Future initializeFirebaseAppCheck() => FirebaseAppCheck.instance.activate(
      webRecaptchaSiteKey: '6Ldv56UoAAAAAEOKqSTKwdhZqUSJC0mIAM4f2DP9',
      androidProvider: AndroidProvider.playIntegrity,
    );
