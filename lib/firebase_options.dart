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
    apiKey: 'AIzaSyDYTZET68Z-kwspQxRwDB69mnCGFHjRZ-4',
    appId: '1:279801847394:web:e8fb124f7918e950a63b3b',
    messagingSenderId: '279801847394',
    projectId: 'feed-app-a8b0e',
    authDomain: 'feed-app-a8b0e.firebaseapp.com',
    storageBucket: 'feed-app-a8b0e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDa8UQXe7XcmJhCkz5Mbcjijeb_zLGuM0s',
    appId: '1:279801847394:android:e1514ae1d27cbd2ea63b3b',
    messagingSenderId: '279801847394',
    projectId: 'feed-app-a8b0e',
    storageBucket: 'feed-app-a8b0e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBhVstuAPa_6dd5Y4_ufpZLWv_jtPWckmU',
    appId: '1:279801847394:ios:19fec9b88508dbfea63b3b',
    messagingSenderId: '279801847394',
    projectId: 'feed-app-a8b0e',
    storageBucket: 'feed-app-a8b0e.appspot.com',
    iosBundleId: 'com.example.feedapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBhVstuAPa_6dd5Y4_ufpZLWv_jtPWckmU',
    appId: '1:279801847394:ios:36c6565f5a93fa28a63b3b',
    messagingSenderId: '279801847394',
    projectId: 'feed-app-a8b0e',
    storageBucket: 'feed-app-a8b0e.appspot.com',
    iosBundleId: 'com.example.feedapp.RunnerTests',
  );
}
