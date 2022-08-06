import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationProv extends ChangeNotifier {
   FirebaseAuth firebase;
  AuthenticationProv(this.firebase);

  Stream<User?> stream() {
    return firebase.authStateChanges();
  }

  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  Future<String> logIn() async {
    try {
      await firebase.signInWithEmailAndPassword(
          email: emailTextEditingController.text.trim(),
          password: passwordTextEditingController.text.trim());
      return Future.value('');
    } on FirebaseAuthException catch (exep) {
      return Future.value(exep.message);
    }
  }
}
