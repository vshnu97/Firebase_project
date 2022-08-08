import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
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
          padding: const EdgeInsets.all(18.0),
          child: StreamBuilder(
              stream: context.read<MainScreenProv>().emailModel.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  final dataQ = snapshot.data!.docs.first;
                  return Column(
                    children: [
                      ksizedBox50,
                      ImageWidget(dataQ: dataQ),
                      RawMaterialButton(
                        onPressed: () {},
                        elevation: 4.0,
                        fillColor: Colors.green,
                        child: const Text(
                          'Update',
                          style: TextStyle(
                              color: kBlackColor, fontWeight: FontWeight.bold),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        shape: const RoundedRectangleBorder(),
                      ),
                      ksizedBox50,
                      MainScreenTextFieldWidget(
                        controllerMain:
                            context.read<MainScreenProv>().nameTextController,
                        iconMain: Icons.person,
                        hintTextMain: dataQ['name'],
                        keyboardType: TextInputType.text,
                      ),
                      ksizedBox20,
                      MainScreenTextFieldWidget(
                        controllerMain:
                            context.read<MainScreenProv>().phoneTextController,
                        iconMain: Icons.phone_android,
                        hintTextMain: dataQ['phone'],
                        keyboardType: TextInputType.number,
                      ),
                      ksizedBox20,
                      MainScreenTextFieldWidget(
                        controllerMain:
                            context.read<MainScreenProv>().phoneTextController,
                        iconMain: Icons.email_outlined,
                        hintTextMain: dataQ['email'],
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.dataQ,
  }) : super(key: key);

  final QueryDocumentSnapshot<Object?> dataQ;

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenProv>(
      builder: (context, value, child) => Center(
        child: SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: MemoryImage(
                  const Base64Decoder().convert(value.imageAvtr.trim().isEmpty?    dataQ['image']:value.imageAvtr),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: -25,
                  child: RawMaterialButton(
                    onPressed: () {
                      context.read<MainScreenProv>().pickImage();
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
