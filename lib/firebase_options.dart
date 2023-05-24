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
    apiKey: 'AIzaSyDH3JMYDxJsuMrCEsXYxzivsxFI8m2WAuE',
    appId: '1:390044972602:web:7c708d939bb5eb66642703',
    messagingSenderId: '390044972602',
    projectId: 'notes-sharing-app-c040c',
    authDomain: 'notes-sharing-app-c040c.firebaseapp.com',
    storageBucket: 'notes-sharing-app-c040c.appspot.com',
    measurementId: 'G-QE4LKLY6WW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBf-eqYzjToCOZr8tMDwcP4TlVll3AurLk',
    appId: '1:390044972602:android:fcc1d48649ff46b1642703',
    messagingSenderId: '390044972602',
    projectId: 'notes-sharing-app-c040c',
    storageBucket: 'notes-sharing-app-c040c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCRAPsCyGGPtMB-GSVlP2tq-s0TdWeuv-k',
    appId: '1:390044972602:ios:99076e15c8763537642703',
    messagingSenderId: '390044972602',
    projectId: 'notes-sharing-app-c040c',
    storageBucket: 'notes-sharing-app-c040c.appspot.com',
    androidClientId: '390044972602-gktv46u2ue5jeid01kghvcn194hg8fck.apps.googleusercontent.com',
    iosClientId: '390044972602-s28eaajipk3qulcinpckpl6o9hds379m.apps.googleusercontent.com',
    iosBundleId: 'com.example.notesSharingApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCRAPsCyGGPtMB-GSVlP2tq-s0TdWeuv-k',
    appId: '1:390044972602:ios:99076e15c8763537642703',
    messagingSenderId: '390044972602',
    projectId: 'notes-sharing-app-c040c',
    storageBucket: 'notes-sharing-app-c040c.appspot.com',
    androidClientId: '390044972602-gktv46u2ue5jeid01kghvcn194hg8fck.apps.googleusercontent.com',
    iosClientId: '390044972602-s28eaajipk3qulcinpckpl6o9hds379m.apps.googleusercontent.com',
    iosBundleId: 'com.example.notesSharingApp',
  );
}