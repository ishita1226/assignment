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
    apiKey: 'AIzaSyCqeaUMmY6ViMaO01NHejcJEIVvF0_zmek',
    appId: '1:381182842582:web:34f23285a3b790572cdb77',
    messagingSenderId: '381182842582',
    projectId: 'lingopanda-73bee',
    authDomain: 'lingopanda-73bee.firebaseapp.com',
    storageBucket: 'lingopanda-73bee.appspot.com',
    measurementId: 'G-8C5MVQQD94',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC0NlcXiNl-7jrobHhpCpRRw5sXuUNO62E',
    appId: '1:381182842582:android:ef0898918e7d5e1c2cdb77',
    messagingSenderId: '381182842582',
    projectId: 'lingopanda-73bee',
    storageBucket: 'lingopanda-73bee.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBL51HK0-Hyw9rI5hY78aHWaDYaCnbxVbA',
    appId: '1:381182842582:ios:4e9fce3101c8d5872cdb77',
    messagingSenderId: '381182842582',
    projectId: 'lingopanda-73bee',
    storageBucket: 'lingopanda-73bee.appspot.com',
    iosBundleId: 'com.ishita.lingopanda',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBL51HK0-Hyw9rI5hY78aHWaDYaCnbxVbA',
    appId: '1:381182842582:ios:4e9fce3101c8d5872cdb77',
    messagingSenderId: '381182842582',
    projectId: 'lingopanda-73bee',
    storageBucket: 'lingopanda-73bee.appspot.com',
    iosBundleId: 'com.ishita.lingopanda',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCqeaUMmY6ViMaO01NHejcJEIVvF0_zmek',
    appId: '1:381182842582:web:b59bbaa93a44d1482cdb77',
    messagingSenderId: '381182842582',
    projectId: 'lingopanda-73bee',
    authDomain: 'lingopanda-73bee.firebaseapp.com',
    storageBucket: 'lingopanda-73bee.appspot.com',
    measurementId: 'G-BCN4XZ883S',
  );
}




// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

// // ...

// await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );