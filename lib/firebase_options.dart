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
    apiKey: 'AIzaSyA2IUxJk8sBF3Zq5IsyIHpjJuEH1rViMgs',
    appId: '1:363843525846:web:e7195a812efd1472fc7d77',
    messagingSenderId: '363843525846',
    projectId: 'country-d5db8',
    authDomain: 'country-d5db8.firebaseapp.com',
    storageBucket: 'country-d5db8.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgx83mHHqnxmJ4A3GwlHrbCOekQeAGKVo',
    appId: '1:363843525846:android:b6a0afed153ca060fc7d77',
    messagingSenderId: '363843525846',
    projectId: 'country-d5db8',
    storageBucket: 'country-d5db8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAg7ScNH0Eki0hUFaBFysOkB-woFNhh1KU',
    appId: '1:363843525846:ios:d5ced97a2efe676cfc7d77',
    messagingSenderId: '363843525846',
    projectId: 'country-d5db8',
    storageBucket: 'country-d5db8.appspot.com',
    iosBundleId: 'com.example.loginWithFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAg7ScNH0Eki0hUFaBFysOkB-woFNhh1KU',
    appId: '1:363843525846:ios:cbaa27491c90da09fc7d77',
    messagingSenderId: '363843525846',
    projectId: 'country-d5db8',
    storageBucket: 'country-d5db8.appspot.com',
    iosBundleId: 'com.example.loginWithFirebase.RunnerTests',
  );
}
