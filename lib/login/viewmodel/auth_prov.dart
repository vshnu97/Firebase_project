import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/main_page/viewmodel/main_prov.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      sharedFunction( emailTextEditingController.text.trim());
      return Future.value('');
    } on FirebaseAuthException catch (exep) {
      _activityIndicator = false;
      notifyListeners();
      return Future.value(exep.message);
    }
  }

   sharedFunction(String email) async {
    emailTemp = email;
    final obj = await SharedPreferences.getInstance();
    obj.setString('userName', email);
  }

  Future<void> signOut() async {
    await firebase.signOut();
  }

Future<String>googleLogIn()async{
  try{
    _activityIndicator = true;
      notifyListeners();
      final isLogged = await GoogleSignIn().isSignedIn();
      if(isLogged)GoogleSignIn().signOut();
      final result = await GoogleSignIn().signIn();
      if(result== null){
         _activityIndicator = false;
      notifyListeners();
      return Future.value("Ocurred an error");

      }
      final cred = await result.authentication;
      await firebase.signInWithCredential(GoogleAuthProvider.credential(accessToken: cred.accessToken,idToken: cred.idToken));
 _activityIndicator = false;
      notifyListeners();
     return Future.value('');
  }on FirebaseAuthException catch(exe){
     _activityIndicator = true;
      notifyListeners();
      return Future.value(exe.message);
  }
 
}
}
