
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpAuthPro extends ChangeNotifier {
  FirebaseAuth firebase;
  SignUpAuthPro(this.firebase);

  Stream<User?> stream() {
    return firebase.authStateChanges();
  }

  final signUpTextController = TextEditingController();
  final signUppasswrdController = TextEditingController();
  final signUpConfrmController = TextEditingController();

  Future<String> signUp(BuildContext context) async {
    String psswrd2 = signUppasswrdController.text.trim();
    String psswrd1 = signUpConfrmController.text.trim();

    if (psswrd2 != psswrd1) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          duration: Duration(milliseconds: 1500),
          // animation: const Animation<double>(.5),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Color.fromARGB(255, 215, 6, 6),
          margin: EdgeInsets.all(20),
          content: Padding(
            padding: EdgeInsets.symmetric(vertical: 9),
            child: Text(
              'Password Does not Match',
              style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.w500),
            ),
          )));
    } else {
      try {
        await firebase.createUserWithEmailAndPassword(
            email: signUpTextController.text.trim(),
            password: signUppasswrdController.text.trim());

        return Future.value('');
      } on FirebaseAuthException catch (exep) {
        return Future.value(exep.message);
      }
    }
    return 'Make sure both password are same';
  }
}
