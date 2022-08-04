import 'package:firebase_project/login/viewmodel/login.dart';
import 'package:firebase_project/utitis/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextfieldWidget extends StatelessWidget {
  String hinttext;
  IconData prefixIcon;
  TextInputType inputType;
  Icon? suffixIcon;
  TextfieldWidget(
      {Key? key,
      required this.hinttext,
      required this.inputType,
      required this.prefixIcon,
      this.suffixIcon})
      : super(key: key);

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
      child: Consumer<LoginProv>(builder: (context, value, child) => 
         TextField(
          obscureText: context.read<LoginProv>().isObscure,
          keyboardType: inputType,
          style: TextStyle(color: kBlackColor.withOpacity(.8), letterSpacing: .8),
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(prefixIcon, color: kBlackColor.withOpacity(.7)),
              hintText: hinttext,
              hintStyle:
                  TextStyle(color: kBlackColor.withOpacity(.5), fontSize: 16),
              suffixIcon: IconButton(
                onPressed: () {
                  print('sjdgksgskgbvs');
                  context.read<LoginProv>().passwordHide();
                },
                icon: Icon(context.read<LoginProv>().isObscure
                    ? Icons.visibility
                    : Icons.visibility_off),
              )),
        ),
      ),
    );
  }
}
