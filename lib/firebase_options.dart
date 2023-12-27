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
    apiKey: 'AIzaSyBzf35iem1bPRzxMuCKom768zN4rHCbgYY',
    appId: '1:755753072446:web:762ea63b856ecad5141e6f',
    messagingSenderId: '755753072446',
    projectId: 'meal-snap',
    authDomain: 'meal-snap.firebaseapp.com',
    storageBucket: 'meal-snap.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD3RCAc-hzB-jhI5xBPETOapHbN4l8h1vk',
    appId: '1:755753072446:android:0d648a770b970206141e6f',
    messagingSenderId: '755753072446',
    projectId: 'meal-snap',
    storageBucket: 'meal-snap.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDqosyDAfF2EwWXjCdNloG6dq_pmCYMkd8',
    appId: '1:755753072446:ios:b5b407a5c473d277141e6f',
    messagingSenderId: '755753072446',
    projectId: 'meal-snap',
    storageBucket: 'meal-snap.appspot.com',
    iosBundleId: 'com.example.mealSnap',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDqosyDAfF2EwWXjCdNloG6dq_pmCYMkd8',
    appId: '1:755753072446:ios:358bb416e2c6ba5e141e6f',
    messagingSenderId: '755753072446',
    projectId: 'meal-snap',
    storageBucket: 'meal-snap.appspot.com',
    iosBundleId: 'com.example.mealSnap.RunnerTests',
  );
}