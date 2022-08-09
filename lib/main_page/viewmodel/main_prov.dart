import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

String emailTemp ='user';

class MainScreenProv extends ChangeNotifier {
  final nameTextController = TextEditingController();
  final phoneTextController = TextEditingController();

   String imageAvtr = '';

  pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    final temp = File(image!.path).readAsBytesSync();
    imageAvtr = base64Encode(temp);
    notifyListeners();
  }

  

  final emailModel = FirebaseFirestore.instance.collection(emailTemp);
}
