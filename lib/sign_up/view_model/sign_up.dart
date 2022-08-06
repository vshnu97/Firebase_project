import 'package:flutter/cupertino.dart';

class SignUpProv extends ChangeNotifier{
   bool isObscure = true;
   bool isobscureConfirm =true;

   passwordHide(){
    isObscure = !isObscure;
    notifyListeners();
   }
    passwordHideConfirm(){
    isobscureConfirm = !isobscureConfirm;
    notifyListeners();
   }

}