import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/login/view/screen_home.dart';
import 'package:firebase_project/login/viewmodel/auth_prov.dart';
import 'package:firebase_project/main_page/viewmodel/main_prov.dart';
import 'package:firebase_project/utitis/colors/colors.dart';
import 'package:firebase_project/utitis/sizedbox/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenMain extends StatelessWidget {
  const ScreenMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: context.watch<AuthenticationProv>().stream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const ScreenHome();
          }
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Home'),
                actions: [
                  IconButton(
                    onPressed: () {
                      context.read<AuthenticationProv>().signOut();
                    },
                    icon: const Icon(Icons.logout_outlined),
                    splashRadius: 20,
                  )
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 60,
                    ),
                    ksizedBox50,
                    MainScreenTextFieldWidget(
                      controllerMain:
                          context.read<MainScreenProv>().nameTextController,
                      iconMain: Icons.person,
                      hintTextMain: 'Name',
                      keyboardType: TextInputType.text,
                    ),
                    ksizedBox20,
                    MainScreenTextFieldWidget(
                      controllerMain:
                          context.read<MainScreenProv>().phoneTextController,
                      iconMain: Icons.phone_android,
                      hintTextMain: 'Phone Number',
                      keyboardType: TextInputType.number,
                    ),
                    ksizedBox20,
                     MainScreenTextFieldWidget(
                      controllerMain:
                          context.read<MainScreenProv>().phoneTextController,
                      iconMain: Icons.email_outlined,
                      hintTextMain: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class MainScreenTextFieldWidget extends StatelessWidget {
  TextEditingController controllerMain;
  String hintTextMain;
  IconData iconMain;
  TextInputType keyboardType;
  MainScreenTextFieldWidget(
      {Key? key,
      required this.controllerMain,
      required this.hintTextMain,
      required this.keyboardType,
      required this.iconMain})
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
      child: TextField(
        controller: controllerMain,
        keyboardType: keyboardType,
        style: TextStyle(color: kBlackColor.withOpacity(.8), letterSpacing: .8),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(iconMain, color: kBlackColor.withOpacity(.7)),
          hintText: hintTextMain,
          hintStyle:
              TextStyle(color: kBlackColor.withOpacity(.5), fontSize: 16),
        ),
      ),
    );
  }
}
