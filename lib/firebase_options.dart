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
    apiKey: 'AIzaSyD52XQHHkDJVubPBizPeS8Z3zFA3fGGb7Y',
    appId: '1:654930478353:web:9f88a892d0d14924cff8b0',
    messagingSenderId: '654930478353',
    projectId: 'fooddeliveryapp-8184e',
    authDomain: 'fooddeliveryapp-8184e.firebaseapp.com',
    storageBucket: 'fooddeliveryapp-8184e.appspot.com',
    measurementId: 'G-8355MG8STS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBkNhxuC1XDCO0gcCffNxPmmDKn2ALEeYA',
    appId: '1:654930478353:android:e62d20f68b64927dcff8b0',
    messagingSenderId: '654930478353',
    projectId: 'fooddeliveryapp-8184e',
    storageBucket: 'fooddeliveryapp-8184e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCcdDR3oRa57IOrrAksN6XmtFf6At5Ye2c',
    appId: '1:654930478353:ios:44ce06817fccb02acff8b0',
    messagingSenderId: '654930478353',
    projectId: 'fooddeliveryapp-8184e',
    storageBucket: 'fooddeliveryapp-8184e.appspot.com',
    iosBundleId: 'com.example.foodDeliveryApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCcdDR3oRa57IOrrAksN6XmtFf6At5Ye2c',
    appId: '1:654930478353:ios:44ce06817fccb02acff8b0',
    messagingSenderId: '654930478353',
    projectId: 'fooddeliveryapp-8184e',
    storageBucket: 'fooddeliveryapp-8184e.appspot.com',
    iosBundleId: 'com.example.foodDeliveryApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD52XQHHkDJVubPBizPeS8Z3zFA3fGGb7Y',
    appId: '1:654930478353:web:b7a4144e0e07c08bcff8b0',
    messagingSenderId: '654930478353',
    projectId: 'fooddeliveryapp-8184e',
    authDomain: 'fooddeliveryapp-8184e.firebaseapp.com',
    storageBucket: 'fooddeliveryapp-8184e.appspot.com',
    measurementId: 'G-NBPQD28DZK',
  );
}
