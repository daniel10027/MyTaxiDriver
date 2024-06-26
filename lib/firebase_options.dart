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
    apiKey: 'AIzaSyBN5DutM7DIIVXPAxZwtLg57bLVvtE6n6A',
    appId: '1:815045054834:web:ee7dfe2fd9e36c92340deb',
    messagingSenderId: '815045054834',
    projectId: 'mytaxi-58a76',
    authDomain: 'mytaxi-58a76.firebaseapp.com',
    databaseURL: 'https://mytaxi-58a76-default-rtdb.firebaseio.com',
    storageBucket: 'mytaxi-58a76.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBDH3KjqIWdultRw2oTtM8t1jHoRvcJCMA',
    appId: '1:815045054834:android:26649e7f41233dd8340deb',
    messagingSenderId: '815045054834',
    projectId: 'mytaxi-58a76',
    databaseURL: 'https://mytaxi-58a76-default-rtdb.firebaseio.com',
    storageBucket: 'mytaxi-58a76.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBA5lwyuYNwTHYbBB0j9JGrzwbNREB3wKU',
    appId: '1:815045054834:ios:eda56eb718f7e118340deb',
    messagingSenderId: '815045054834',
    projectId: 'mytaxi-58a76',
    databaseURL: 'https://mytaxi-58a76-default-rtdb.firebaseio.com',
    storageBucket: 'mytaxi-58a76.appspot.com',
    iosClientId: '815045054834-dkdevvcfmp6ml9edbht0uc5q9ehp94p3.apps.googleusercontent.com',
    iosBundleId: 'com.example.driver',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBA5lwyuYNwTHYbBB0j9JGrzwbNREB3wKU',
    appId: '1:815045054834:ios:0f0e366075c080a5340deb',
    messagingSenderId: '815045054834',
    projectId: 'mytaxi-58a76',
    databaseURL: 'https://mytaxi-58a76-default-rtdb.firebaseio.com',
    storageBucket: 'mytaxi-58a76.appspot.com',
    iosClientId: '815045054834-gfv5qp1l10efl6co9la1dh604hnpsu38.apps.googleusercontent.com',
    iosBundleId: 'comp.example.driver',
  );
}
