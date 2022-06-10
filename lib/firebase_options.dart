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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAjnJJ7zo276EBTv9fuxsRxVKCpRWxeXTc',
    appId: '1:707935865063:web:5839ec3a180f058ba2fa42',
    messagingSenderId: '707935865063',
    projectId: 'test-app-5d85c',
    authDomain: 'test-app-5d85c.firebaseapp.com',
    storageBucket: 'test-app-5d85c.appspot.com',
    measurementId: 'G-FG6HWDTHF0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAqanRNdSvbAqmk0aPjyFcLg869Q4eGcQ8',
    appId: '1:707935865063:android:93e4643a5552d87aa2fa42',
    messagingSenderId: '707935865063',
    projectId: 'test-app-5d85c',
    storageBucket: 'test-app-5d85c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBGerBXXKHYUAS3WL8aN0nqKeOk9BSVMxQ',
    appId: '1:707935865063:ios:a55d4720a7edcfc9a2fa42',
    messagingSenderId: '707935865063',
    projectId: 'test-app-5d85c',
    storageBucket: 'test-app-5d85c.appspot.com',
    iosClientId: '707935865063-0bjdkfpbflasf5qi68teqknkaobfv84e.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );
}
