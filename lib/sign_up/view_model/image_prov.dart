import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class PicImageProv extends ChangeNotifier{
  String imageAvtr = '';

  pickIAge() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    final temp = File(image!.path).readAsBytesSync();
    imageAvtr = base64Encode(temp);
    notifyListeners();
  }
}