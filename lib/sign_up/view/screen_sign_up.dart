import 'dart:convert';

import 'package:firebase_project/main_page/view/screen_main.dart';
import 'package:firebase_project/routes/navigator.dart';
import 'package:firebase_project/sign_up/view/widget/signup_textfield.dart';
import 'package:firebase_project/sign_up/view_model/auth_provider.dart';
import 'package:firebase_project/sign_up/view_model/image_prov.dart';
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
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: ListView(
            children: [
              Text(
                'Sign Up',
                style:
                    primaryFont(fsize: 38, fweight: FontWeight.w900, hght: 1.5),
              ),
              ksizedBox10,
              const ImagePicWidget(),
              ksizedBox20,
              SignupTextField(
                contoller: context.read<SignUpAuthPro>().signUpnameController,
                hintText: 'Name',
                iconprefix: Icons.person, inputType: TextInputType.text,
              ),
              ksizedBox20,
              SignupTextField(
                contoller: context.read<SignUpAuthPro>().signUpTextController,
                hintText: 'Email',
                iconprefix: Icons.email_outlined, inputType:  TextInputType.emailAddress,
              ),
              ksizedBox20,
              SignupTextField(
                maxlength: 10,
                contoller: context.read<SignUpAuthPro>().signUpPhoneNumControler,
                hintText: 'Phone Number',
                iconprefix: Icons.phone_android, inputType:  TextInputType.number,
              ),
              ksizedBox20,
              SignUpPassTextFieldWidget(size: size),
              ksizedBox20,
              ConfirmPasswTextField(size: size),
              ksizedBox40,
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () async {
                    final msg =
                        await context.read<SignUpAuthPro>().signUp(context);
                    if (msg == '') {
                      await context.read<SignUpAuthPro>().addDataBAse(context);
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
              ksizedBox20,
              const SignUpButton(),
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

class ImagePicWidget extends StatelessWidget {
  const ImagePicWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<PicImageProv>(
        builder: (__, value, _) => SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            children: [
              value.imageAvtr.trim().isEmpty
                  ? const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/avatar.jpg'),
                      radius: 60,
                    )
                  : CircleAvatar(
                      backgroundImage: MemoryImage(
                          const Base64Decoder()
                              .convert(value.imageAvtr)),
                      radius: 60,
                    ),
              Positioned(
                  bottom: 0,
                  right: -25,
                  child: RawMaterialButton(
                    onPressed: () {
                      value.pickIAge();
                    },
                    elevation: 4.0,
                    fillColor: kwhiteColor,
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: kBlackColor,
                    ),
                    padding: const EdgeInsets.all(8.0),
                    shape: const CircleBorder(),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
                color: defaultColor, fontSize: 18, fontWeight: FontWeight.w800),
          ),
        )
      ],
    );
  }
}

class SignUpPassTextFieldWidget extends StatelessWidget {
  const SignUpPassTextFieldWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.width / 7,
      width: size.width / 1,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
          color: kBlackColor.withOpacity(.08),
          borderRadius: BorderRadius.circular(10)),
      child: Consumer<SignUpProv>(
        builder: (context, value, child) => TextFormField(
          controller: context.read<SignUpAuthPro>().signUppasswrdController,
          obscureText: context.read<SignUpProv>().isObscure,
          keyboardType: TextInputType.text,
          style:
              TextStyle(color: kBlackColor.withOpacity(.8), letterSpacing: .8),
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.password_outlined,
                  color: kBlackColor.withOpacity(.7)),
              hintText: 'Password',
              hintStyle:
                  TextStyle(color: kBlackColor.withOpacity(.5), fontSize: 16),
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
    );
  }
}

class ConfirmPasswTextField extends StatelessWidget {
  const ConfirmPasswTextField({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.width / 7,
      width: size.width / 1,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
          color: kBlackColor.withOpacity(.08),
          borderRadius: BorderRadius.circular(10)),
      child: Consumer<SignUpProv>(
        builder: (context, value, child) => TextFormField(
          controller: context.read<SignUpAuthPro>().signUpConfrmController,
          obscureText: context.read<SignUpProv>().isobscureConfirm,
          keyboardType: TextInputType.text,
          style:
              TextStyle(color: kBlackColor.withOpacity(.8), letterSpacing: .8),
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.password_outlined,
                  color: kBlackColor.withOpacity(.7)),
              hintText: 'Confirm Password',
              hintStyle:
                  TextStyle(color: kBlackColor.withOpacity(.5), fontSize: 16),
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
    );
  }
}
