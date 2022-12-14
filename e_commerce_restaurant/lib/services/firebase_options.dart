// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
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
    apiKey: 'AIzaSyAoeccloYc_jTfRhki39SiSrjiqgnpOwgk',
    appId: '1:775064403457:web:83697b1327a18697488a00',
    messagingSenderId: '775064403457',
    projectId: 'e-commerce-restaurant-app',
    authDomain: 'e-commerce-restaurant-app.firebaseapp.com',
    storageBucket: 'e-commerce-restaurant-app.appspot.com',
    measurementId: 'G-4KQVBE8262',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAJoCREqHpdUqfEuFYdRaCSdfbuMW2TpkQ',
    appId: '1:775064403457:android:5ec193bce3fb9ec1488a00',
    messagingSenderId: '775064403457',
    projectId: 'e-commerce-restaurant-app',
    storageBucket: 'e-commerce-restaurant-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA6dE6YIoVRqQ36WOQ70T3_yNf-wvj-bZQ',
    appId: '1:775064403457:ios:919ec40a61741fb2488a00',
    messagingSenderId: '775064403457',
    projectId: 'e-commerce-restaurant-app',
    storageBucket: 'e-commerce-restaurant-app.appspot.com',
    iosClientId: '775064403457-l5a8ncmvvtea7vs8tdo8s2mstdqb9bru.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommerceRestaurant',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA6dE6YIoVRqQ36WOQ70T3_yNf-wvj-bZQ',
    appId: '1:775064403457:ios:919ec40a61741fb2488a00',
    messagingSenderId: '775064403457',
    projectId: 'e-commerce-restaurant-app',
    storageBucket: 'e-commerce-restaurant-app.appspot.com',
    iosClientId: '775064403457-l5a8ncmvvtea7vs8tdo8s2mstdqb9bru.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommerceRestaurant',
  );
}
