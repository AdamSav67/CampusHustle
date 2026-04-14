import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDe9U-_vLD4iDLStIb15EaLdTBE94dUWVI",
            authDomain: "campus-hustle-c-s-c305-mn8qj2.firebaseapp.com",
            projectId: "campus-hustle-c-s-c305-mn8qj2",
            storageBucket: "campus-hustle-c-s-c305-mn8qj2.firebasestorage.app",
            messagingSenderId: "429363413184",
            appId: "1:429363413184:web:c10c4e352c420ed1d3ed25",
            measurementId: "G-EGFDG27LD9"));
  } else {
    await Firebase.initializeApp();
  }
}
