import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAUmCp9c3Vg9P_Z0fiGehp1Yti5CMGBALg",
            authDomain: "artisto-9f0e3.firebaseapp.com",
            projectId: "artisto-9f0e3",
            storageBucket: "artisto-9f0e3.firebasestorage.app",
            messagingSenderId: "125259234913",
            appId: "1:125259234913:web:6fa25e1a1bbc44ae0f3420",
            measurementId: "G-04Z1286H32"));
  } else {
    await Firebase.initializeApp();
  }
}
