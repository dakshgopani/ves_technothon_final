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
    apiKey: 'AIzaSyCvEwriqpTeDjWL5VZNLoY6c6BlRlKYS_8',
    appId: '1:837850795211:web:27f0fd366f57f7fc829f4e',
    messagingSenderId: '837850795211',
    projectId: 'algo-avengers-ves-final',
    authDomain: 'algo-avengers-ves-final.firebaseapp.com',
    storageBucket: 'algo-avengers-ves-final.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmv-BktS1xeyd07TH6EAGxogO6dx0iC1c',
    appId: '1:837850795211:android:b20c3c8a6da5cc2e829f4e',
    messagingSenderId: '837850795211',
    projectId: 'algo-avengers-ves-final',
    storageBucket: 'algo-avengers-ves-final.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAfH2sfnQyfnjUxTNTpmcccNVgslTgkrZE',
    appId: '1:837850795211:ios:a98cbc053d2d7756829f4e',
    messagingSenderId: '837850795211',
    projectId: 'algo-avengers-ves-final',
    storageBucket: 'algo-avengers-ves-final.firebasestorage.app',
    iosBundleId: 'com.example.algorithmAvengersVesFinal',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAfH2sfnQyfnjUxTNTpmcccNVgslTgkrZE',
    appId: '1:837850795211:ios:a98cbc053d2d7756829f4e',
    messagingSenderId: '837850795211',
    projectId: 'algo-avengers-ves-final',
    storageBucket: 'algo-avengers-ves-final.firebasestorage.app',
    iosBundleId: 'com.example.algorithmAvengersVesFinal',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCvEwriqpTeDjWL5VZNLoY6c6BlRlKYS_8',
    appId: '1:837850795211:web:e18710ed542849f1829f4e',
    messagingSenderId: '837850795211',
    projectId: 'algo-avengers-ves-final',
    authDomain: 'algo-avengers-ves-final.firebaseapp.com',
    storageBucket: 'algo-avengers-ves-final.firebasestorage.app',
  );

}