import 'package:firebase_project/login/viewmodel/login.dart';
import 'package:firebase_project/sign_up/view/widget/signup_textfield.dart';
import 'package:firebase_project/utitis/colors/colors.dart';
import 'package:firebase_project/utitis/fonts/fonts.dart';
import 'package:firebase_project/utitis/sizedbox/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenSignUp extends StatelessWidget {
  const ScreenSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(
              'Sign Up',
              style: primaryFont(fsize: 36, fweight: FontWeight.w800),
            ),
            ksizedbox60,
            SignupTextField(
              hintText: 'Name',
              iconprefix: Icons.person,
            ),
            ksizedBox20,
            SignupTextField(
              hintText: 'Email',
              iconprefix: Icons.email_outlined,
            ),
            ksizedBox20,
            Container(
              height: size.width / 7,
              width: size.width / 1,
              alignment: Alignment.center,
              padding: EdgeInsets.only(right: size.width / 30),
              decoration: BoxDecoration(
                  color: kBlackColor.withOpacity(.08),
                  borderRadius: BorderRadius.circular(10)),
              child: Consumer<LoginProv>(
                builder: (context, value, child) => TextField(
                  obscureText: context.read<LoginProv>().isObscure,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                      color: kBlackColor.withOpacity(.8), letterSpacing: .8),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.password_outlined,
                          color: kBlackColor.withOpacity(.7)),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                          color: kBlackColor.withOpacity(.5), fontSize: 16),
                      suffixIcon: IconButton(
                        onPressed: () {
                          context.read<LoginProv>().passwordHide();
                        },
                        icon: Icon(context.read<LoginProv>().isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                      )),
                ),
              ),
            ),
            ksizedBox20,
               Container(
              height: size.width / 7,
              width: size.width / 1,
              alignment: Alignment.center,
              padding: EdgeInsets.only(right: size.width / 30),
              decoration: BoxDecoration(
                  color: kBlackColor.withOpacity(.08),
                  borderRadius: BorderRadius.circular(10)),
              child: Consumer<LoginProv>(
                builder: (context, value, child) => TextField(
                  obscureText: context.read<LoginProv>().isObscure,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                      color: kBlackColor.withOpacity(.8), letterSpacing: .8),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.password_outlined,
                          color: kBlackColor.withOpacity(.7)),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                          color: kBlackColor.withOpacity(.5), fontSize: 16),
                      suffixIcon: IconButton(
                        onPressed: () {
                          context.read<LoginProv>().passwordHide();
                        },
                        icon: Icon(context.read<LoginProv>().isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                      )),
                ),
              ),
            ),
            ksizedbox60,
            SizedBox(
      width: double.infinity,
      child: MaterialButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Text(
            'Sign Up',
            style: TextStyle(
                color: kwhiteColor, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        color: defaultColor,
      ),
    ),


          ],
        ),
      ),
    );
  }
}
