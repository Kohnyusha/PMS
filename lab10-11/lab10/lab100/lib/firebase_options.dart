// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDodXJOpFs2yOdc2xI5_e1qbh6UBknLHyg',
    appId: '1:347211390325:web:d99c456e2e83b7cec3873c',
    messagingSenderId: '347211390325',
    projectId: 'lab10-cef7c',
    authDomain: 'lab10-cef7c.firebaseapp.com',
    storageBucket: 'lab10-cef7c.appspot.com',
    measurementId: 'G-VZ2RR21J62',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvqcD_FWjNo614fBg2t2y5AdAW8IAwHJ8',
    appId: '1:347211390325:android:af13178e0e24972ec3873c',
    messagingSenderId: '347211390325',
    projectId: 'lab10-cef7c',
    storageBucket: 'lab10-cef7c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC28EIOC0gXtYDDJngN4unVd2ofTu6vks4',
    appId: '1:347211390325:ios:f28daf5d598170c6c3873c',
    messagingSenderId: '347211390325',
    projectId: 'lab10-cef7c',
    storageBucket: 'lab10-cef7c.appspot.com',
    iosBundleId: 'com.example.lab100',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC28EIOC0gXtYDDJngN4unVd2ofTu6vks4',
    appId: '1:347211390325:ios:d8b8efd21f102c71c3873c',
    messagingSenderId: '347211390325',
    projectId: 'lab10-cef7c',
    storageBucket: 'lab10-cef7c.appspot.com',
    iosBundleId: 'com.example.lab100.RunnerTests',
  );
}