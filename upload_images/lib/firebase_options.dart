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
    apiKey: 'AIzaSyC-VLTqF6dYPEfXI3_rtYXGZm6b8gJ8QCY',
    appId: '1:1018249852552:web:e5f68f97fa492687f2513d',
    messagingSenderId: '1018249852552',
    projectId: 'upload-images-be2b8',
    authDomain: 'upload-images-be2b8.firebaseapp.com',
    storageBucket: 'upload-images-be2b8.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB9YD8pcTyt9XjJBs_TdmXYF1s9fDK4tow',
    appId: '1:1018249852552:android:f279b46d454a4984f2513d',
    messagingSenderId: '1018249852552',
    projectId: 'upload-images-be2b8',
    storageBucket: 'upload-images-be2b8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD89cbzFOxiqnKrK1Zv3NwCDXYT82TfT1s',
    appId: '1:1018249852552:ios:229233064cb69765f2513d',
    messagingSenderId: '1018249852552',
    projectId: 'upload-images-be2b8',
    storageBucket: 'upload-images-be2b8.appspot.com',
    iosBundleId: 'com.example.uploadImages',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD89cbzFOxiqnKrK1Zv3NwCDXYT82TfT1s',
    appId: '1:1018249852552:ios:ee519cc61adcee6ff2513d',
    messagingSenderId: '1018249852552',
    projectId: 'upload-images-be2b8',
    storageBucket: 'upload-images-be2b8.appspot.com',
    iosBundleId: 'com.example.uploadImages.RunnerTests',
  );
}
