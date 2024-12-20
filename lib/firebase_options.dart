// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCjB24g0hlm5vJk1Kas9jH2KPEZZagukpg',
    appId: '1:824717411889:web:7c3ba50e9f2d22ae78f710',
    messagingSenderId: '824717411889',
    projectId: 'flutter-tutorial-yk',
    authDomain: 'flutter-tutorial-yk.firebaseapp.com',
    storageBucket: 'flutter-tutorial-yk.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBjB98Yo7YT3Z2DHbGwdM_xeWSBLNvzsVM',
    appId: '1:824717411889:android:bc74f25015eeb94f78f710',
    messagingSenderId: '824717411889',
    projectId: 'flutter-tutorial-yk',
    storageBucket: 'flutter-tutorial-yk.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAdtoEZFlLDbZy7hHOaW82cAvRUNWn7guY',
    appId: '1:824717411889:ios:756a608987a41ec478f710',
    messagingSenderId: '824717411889',
    projectId: 'flutter-tutorial-yk',
    storageBucket: 'flutter-tutorial-yk.firebasestorage.app',
    iosBundleId: 'com.example.learningdart',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAdtoEZFlLDbZy7hHOaW82cAvRUNWn7guY',
    appId: '1:824717411889:ios:756a608987a41ec478f710',
    messagingSenderId: '824717411889',
    projectId: 'flutter-tutorial-yk',
    storageBucket: 'flutter-tutorial-yk.firebasestorage.app',
    iosBundleId: 'com.example.learningdart',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCjB24g0hlm5vJk1Kas9jH2KPEZZagukpg',
    appId: '1:824717411889:web:d02385ed4f64afa378f710',
    messagingSenderId: '824717411889',
    projectId: 'flutter-tutorial-yk',
    authDomain: 'flutter-tutorial-yk.firebaseapp.com',
    storageBucket: 'flutter-tutorial-yk.firebasestorage.app',
  );

}