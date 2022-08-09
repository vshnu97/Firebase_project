import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/main_page/viewmodel/main_prov.dart';
import 'package:firebase_project/sign_up/view_model/image_prov.dart';
import 'package:firebase_project/utitis/img.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SignUpAuthPro extends ChangeNotifier {
  FirebaseAuth firebase;
  SignUpAuthPro(this.firebase);

  Stream<User?> stream() {
    return firebase.authStateChanges();
  }

  final signUpPhoneNumControler = TextEditingController();
  final signUpnameController = TextEditingController();
  final signUpEmailController = TextEditingController();
  final signUppasswrdController = TextEditingController();
  final signUpConfrmController = TextEditingController();

  addDataBAse(BuildContext context, String email) async {
    await FirebaseFirestore.instance.collection(email).add({
      'name': signUpnameController.text,
      'email': signUpEmailController.text,
      'phone': signUpPhoneNumControler.text,
      'image': context.read<PicImageProv>().imageAvtr,
      'password': signUppasswrdController.text,
    });
  }

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
            email: signUpEmailController.text.trim(),
            password: signUppasswrdController.text.trim());
        await addDataBAse(context, signUpEmailController.text);
       emailTemp = signUpEmailController.text.trim();

        return Future.value('');
      } on FirebaseAuthException catch (exep) {
        return Future.value(exep.message);
      }
    }
    return 'Make sure both password are same';
  }

  void disposeFunction(BuildContext context) {
    signUpPhoneNumControler.text = '';
    signUpnameController.text = '';
    signUpEmailController.text = '';
    signUppasswrdController.text = '';
    signUpConfrmController.text = '';
    context.read<PicImageProv>().imageAvtr = encodeImage;
  }

  updateData(
      {required BuildContext context,
      required String imageQ,
      required String phone,
      required String name,
      required String email,
      required String password,
      required String documentQ}) {
    String finalImage = context.read<MainScreenProv>().imageAvtr.trim().isEmpty
        ? imageQ
        : context.read<MainScreenProv>().imageAvtr;
    FirebaseFirestore.instance.collection(emailTemp).doc(documentQ).set({
      'image': finalImage,
      'phone': phone,
      'name': name,
      'email': email,
      'password': password,
    });
  }

 
}
