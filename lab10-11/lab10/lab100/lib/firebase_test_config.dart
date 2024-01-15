import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> initializeFirebaseForTest() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBvqcD_FWjNo614fBg2t2y5AdAW8IAwHJ8',
      appId: "1:347211390325:android:af13178e0e24972ec3873c",
      messagingSenderId: "347211390325",
      projectId: "lab10-cef7c",
    ),
  );
}
