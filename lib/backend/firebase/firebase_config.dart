import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBvs08ee-BncuPSpIgOuLtNAjsSzBaAJys",
            authDomain: "one-abc-166e0.firebaseapp.com",
            projectId: "one-abc-166e0",
            storageBucket: "one-abc-166e0.appspot.com",
            messagingSenderId: "660914529613",
            appId: "1:660914529613:web:0639df9ca96736a4704304"));
  } else {
    await Firebase.initializeApp();
  }
}
