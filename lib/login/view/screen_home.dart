import 'package:firebase_project/login/view/widgets/container_widget.dart';
import 'package:firebase_project/routes/navigator.dart';
import 'package:firebase_project/sign_up/view/screen_sign_up.dart';
import 'package:firebase_project/utitis/colors/colors.dart';
import 'package:firebase_project/utitis/sizedbox/sizedbox.dart';
import 'package:flutter/material.dart';
import '../../utitis/fonts/fonts.dart';
import 'widgets/button_widget.dart';
import 'widgets/textfield_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create Account',
              style: primaryFont(fsize: 36, fweight: FontWeight.w800),
            ),
            ksizedbox30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ContainerIconWidget(
                    containerColor: const Color(0xff1DA1F2),
                    imagePath: 'assets/images/twitter.jpg',
                    title: 'Twitter',
                    textcolor: kwhiteColor,
                  ),
                ),
                Expanded(
                  child: ContainerIconWidget(
                    containerColor: kGreyColor.withOpacity(.3),
                    imagePath: 'assets/images/g.png',
                    title: 'Gmail',
                    textcolor: kBlackColor,
                  ),
                ),
                Expanded(
                  child: ContainerIconWidget(
                    containerColor: const Color(0xff0d7fc5),
                    imagePath: 'assets/images/f.jpg',
                    title: 'Facebook',
                    textcolor: kwhiteColor,
                  ),
                )
              ],
            ),
            ksizedBox40,
            Row(
              children: [
                DividerWidget(size: _size),
                Text(
                  "Or",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: kBlackColor.withOpacity(.6)),
                ),
                DividerWidget(size: _size),
              ],
            ),
            ksizedBox40,
            Container(
              height: size.width / 7,
              width: size.width / 1,
              alignment: Alignment.center,
              padding: EdgeInsets.only(right: size.width / 30),
              decoration: BoxDecoration(
                  color: kBlackColor.withOpacity(.08),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                    color: kBlackColor.withOpacity(.8), letterSpacing: .8),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.email_outlined,
                      color: kBlackColor.withOpacity(.7)),
                  hintText: 'Email',
                  hintStyle: TextStyle(
                      color: kBlackColor.withOpacity(.5), fontSize: 16),
                ),
              ),
            ),
            ksizedbox30,
            TextfieldWidgetPassword(
              hinttext: 'Password',
              inputType: TextInputType.visiblePassword,
              prefixIcon: Icons.password_outlined,
            ),
            ksizedBox20,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Text('forgot password?',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: kBlackColor.withOpacity(.6))),
                )
              ],
            ),
            ksizedbox60,
            const ButtonWidget(),
            ksizedBox50,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Create a new account?",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: kBlackColor.withOpacity(.4))),
                wsizedBox20,
                GestureDetector(
                  onTap: () {
                    Routes.pushScreen(screen: const ScreenSignUp());
                  },
                  child: const Text(
                    "Sign Up",
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
    );
  }
}

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    Key? key,
    required double size,
  })  : _size = size,
        super(key: key);

  final double _size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (_size / 2) - 18,
      child: const Divider(),
    );
  }
}
