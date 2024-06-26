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
    apiKey: 'AIzaSyD82WoqQ7MWcQ9tKGNrV62i6sbpgr3WAjA',
    appId: '1:816275666851:web:494ab6e9e5dd0a7a2e8c16',
    messagingSenderId: '816275666851',
    projectId: 'agna-chatapp',
    authDomain: 'agna-chatapp.firebaseapp.com',
    storageBucket: 'agna-chatapp.appspot.com',
    measurementId: 'G-X2KWW8JVZB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAqjTXejISMlzh1ffcFCVkmlQjXxXmyJTQ',
    appId: '1:816275666851:android:7ba50a3a799706cc2e8c16',
    messagingSenderId: '816275666851',
    projectId: 'agna-chatapp',
    storageBucket: 'agna-chatapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBMNwbWF87mk05j_a98QGRqEP6KCfgZ9K0',
    appId: '1:816275666851:ios:394a93ef01eb2cca2e8c16',
    messagingSenderId: '816275666851',
    projectId: 'agna-chatapp',
    storageBucket: 'agna-chatapp.appspot.com',
    iosBundleId: 'com.example.aynaChatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBMNwbWF87mk05j_a98QGRqEP6KCfgZ9K0',
    appId: '1:816275666851:ios:394a93ef01eb2cca2e8c16',
    messagingSenderId: '816275666851',
    projectId: 'agna-chatapp',
    storageBucket: 'agna-chatapp.appspot.com',
    iosBundleId: 'com.example.aynaChatapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD82WoqQ7MWcQ9tKGNrV62i6sbpgr3WAjA',
    appId: '1:816275666851:web:f076d325ceb04e472e8c16',
    messagingSenderId: '816275666851',
    projectId: 'agna-chatapp',
    authDomain: 'agna-chatapp.firebaseapp.com',
    storageBucket: 'agna-chatapp.appspot.com',
    measurementId: 'G-1SYNB1TEF6',
  );
}
