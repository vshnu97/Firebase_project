import 'package:flutter/cupertino.dart';

class LoginProv extends ChangeNotifier{
   bool isObscure = true;

   passwordHide(){
    isObscure = !isObscure;
    notifyListeners();
   }
}