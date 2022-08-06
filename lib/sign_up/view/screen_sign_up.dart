import 'package:firebase_project/main_page/screen_main.dart';
import 'package:firebase_project/routes/navigator.dart';
import 'package:firebase_project/sign_up/view/widget/signup_textfield.dart';
import 'package:firebase_project/sign_up/view_model/auth_provider.dart';
import 'package:firebase_project/sign_up/view_model/sign_up.dart';
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                'Sign Up',
                style: primaryFont(fsize: 36, fweight: FontWeight.w900),
              ),
              ksizedbox60,
              SignupTextField(
                hintText: 'Name',
                iconprefix: Icons.person,
              ),
              ksizedBox20,
              SignupTextField(
                contoller: context.read<SignUpAuthPro>().signUpTextController,
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
                child: Consumer<SignUpProv>(
                  builder: (context, value, child) => TextFormField(
                    //    validator: (value){
                    //   if(value==null||value.isEmpty){
                    //     return 'Enter the password';
                    //   }else{
                    //      return null ;
                    //   }
                    // },

                    controller:
                        context.read<SignUpAuthPro>().signUppasswrdController,
                    obscureText: context.read<SignUpProv>().isObscure,
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
                            context.read<SignUpProv>().passwordHide();
                          },
                          icon: Icon(context.read<SignUpProv>().isObscure
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
                child: Consumer<SignUpProv>(
                  builder: (context, value, child) => TextFormField(
                    controller:
                        context.read<SignUpAuthPro>().signUpConfrmController,
                    //  validator: (value){
                    //   if(value==null||value.isEmpty){
                    //     return 'Enter the password';
                    //   }else if(context.read<SignUpAuthPro>().signUppasswrdController!=context.read<SignUpAuthPro>().signUpConfrmController){
                    //     return "Password does not match";
                    //   }
                    //   else{
                    //      return null ;
                    //   }
                    // },

                    obscureText: context.read<SignUpProv>().isobscureConfirm,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        color: kBlackColor.withOpacity(.8), letterSpacing: .8),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.password_outlined,
                            color: kBlackColor.withOpacity(.7)),
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(
                            color: kBlackColor.withOpacity(.5), fontSize: 16),
                        suffixIcon: IconButton(
                          onPressed: () {
                            context.read<SignUpProv>().passwordHideConfirm();
                          },
                          icon: Icon(context.read<SignUpProv>().isobscureConfirm
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
                  onPressed: () async {
                    final msg =
                        await context.read<SignUpAuthPro>().signUp(context);
                    if (msg == '') {
                      Routes.pushReplacementScreen(screen: const ScreenMain());
                    } else {
                      pop(context, msg);
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: kwhiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  color: defaultColor,
                ),
              ),
              ksizedBox50,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have acoount?",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: kBlackColor.withOpacity(.4))),
                  wsizedBox20,
                  GestureDetector(
                    onTap: () {
                      Routes.popScreen();
                    },
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                          color: defaultColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w800),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void pop(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        duration: const Duration(milliseconds: 1500),
        // animation: const Animation<double>(.5),
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color.fromARGB(255, 215, 6, 6),
        margin: const EdgeInsets.all(20),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 9),
          child: Text(
            msg,
            style:
                const TextStyle(letterSpacing: 2, fontWeight: FontWeight.w500),
          ),
        )));
  }
}
