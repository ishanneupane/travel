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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBBmR27gABZ-zXUVsZVxPbwpTXE_om4XKc',
    appId: '1:518537187623:android:9c7eabf89a030c6d6a1902',
    messagingSenderId: '518537187623',
    projectId: 'travelapp-cbad7',
    storageBucket: 'travelapp-cbad7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBiprngnfs23ofxsdHna66DGonaswiwESg',
    appId: '1:518537187623:ios:47e908b7817379b36a1902',
    messagingSenderId: '518537187623',
    projectId: 'travelapp-cbad7',
    storageBucket: 'travelapp-cbad7.appspot.com',
    iosBundleId: 'com.example.travel',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBiprngnfs23ofxsdHna66DGonaswiwESg',
    appId: '1:518537187623:ios:47e908b7817379b36a1902',
    messagingSenderId: '518537187623',
    projectId: 'travelapp-cbad7',
    storageBucket: 'travelapp-cbad7.appspot.com',
    iosBundleId: 'com.example.travel',
  );
}
