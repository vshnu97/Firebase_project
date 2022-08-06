import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationProv extends ChangeNotifier {
  FirebaseAuth firebase;
  AuthenticationProv(this.firebase);
  bool _activityIndicator = false;

  Stream<User?> stream() {
    return firebase.authStateChanges();
  }

  bool get activityIndicator => _activityIndicator;

  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  Future<String> logIn() async {
    try {
      _activityIndicator = true;
      notifyListeners();
      await firebase.signInWithEmailAndPassword(
          email: emailTextEditingController.text.trim(),
          password: passwordTextEditingController.text.trim());
      _activityIndicator = false;
      notifyListeners();
      return Future.value('');
    } on FirebaseAuthException catch (exep) {
      _activityIndicator = false;
      notifyListeners();
      return Future.value(exep.message);
    }
  }

  Future<void> signOut() async {
    await firebase.signOut();
  }
}
