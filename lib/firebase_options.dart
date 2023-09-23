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
    apiKey: 'AIzaSyClqQ5nlbFrKdbnyIs2w6GaYb6mEEhXudk',
    appId: '1:857445819748:web:0b08cef5acd87e6d0fc671',
    messagingSenderId: '857445819748',
    projectId: 'dpia-2772a',
    authDomain: 'dpia-2772a.firebaseapp.com',
    storageBucket: 'dpia-2772a.appspot.com',
    measurementId: 'G-H9P6YQSYKV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyABTz6pGIeyMmxkQT60wA17l2nc6N6Ouhc',
    appId: '1:857445819748:android:98c25f280aa73ffa0fc671',
    messagingSenderId: '857445819748',
    projectId: 'dpia-2772a',
    storageBucket: 'dpia-2772a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAwLGJGhM877rvIVQdAzHlM83NUHGRUsec',
    appId: '1:857445819748:ios:552859fc7e333ecf0fc671',
    messagingSenderId: '857445819748',
    projectId: 'dpia-2772a',
    storageBucket: 'dpia-2772a.appspot.com',
    iosBundleId: 'com.example.dpiaProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAwLGJGhM877rvIVQdAzHlM83NUHGRUsec',
    appId: '1:857445819748:ios:2e0b4d1408fb723c0fc671',
    messagingSenderId: '857445819748',
    projectId: 'dpia-2772a',
    storageBucket: 'dpia-2772a.appspot.com',
    iosBundleId: 'com.example.dpiaProject.RunnerTests',
  );
}
