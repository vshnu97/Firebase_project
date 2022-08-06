
import 'package:firebase_project/utitis/colors/colors.dart';
import 'package:flutter/material.dart';

class SignupTextField extends StatelessWidget {
  String hintText;
  IconData iconprefix;
  TextEditingController? contoller;
   SignupTextField({
    Key? key,required this.hintText, required this.iconprefix, this.contoller
   
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width / 7,
      width: size.width / 1,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
          color: kBlackColor.withOpacity(.08),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        
        controller:contoller,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
            color: kBlackColor.withOpacity(.8), letterSpacing: .8),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon:
              Icon(iconprefix, color: kBlackColor.withOpacity(.7)),
          hintText: hintText,
          hintStyle: TextStyle(
              color: kBlackColor.withOpacity(.5), fontSize: 16),
        ),
      ),
    );
  }
}