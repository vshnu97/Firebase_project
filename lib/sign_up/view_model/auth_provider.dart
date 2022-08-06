import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SignUpAuthPro extends ChangeNotifier {
  FirebaseAuth firebase;
  SignUpAuthPro(this.firebase);

  Stream<User?> stream() {
    return firebase.authStateChanges();
  }

  final signUpTextController = TextEditingController();
  final signUppasswrdController = TextEditingController();

  Future<String> signUp() async {
    log(signUpTextController.text.toString());
    try {
      await firebase.createUserWithEmailAndPassword(
          email: signUpTextController.text.trim(),
          password: signUppasswrdController.text.trim());

      return Future.value('');
    } on FirebaseAuthException catch (exep) {
      return Future.value(exep.message);
    }
  }
}
