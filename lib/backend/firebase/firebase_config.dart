import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAQ3OvGwDdvCoKpF2E34a7_K96SSCONjgs",
            authDomain: "be-vannes-nwcay7.firebaseapp.com",
            projectId: "be-vannes-nwcay7",
            storageBucket: "be-vannes-nwcay7.appspot.com",
            messagingSenderId: "292036195863",
            appId: "1:292036195863:web:cf64946b51a09fe4758e52",
            measurementId: "G-JR521RPFDN"));
  } else {
    await Firebase.initializeApp();
  }
}
