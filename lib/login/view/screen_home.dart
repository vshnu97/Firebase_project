import 'package:firebase_project/login/view/widgets/container_widget.dart';
import 'package:firebase_project/login/viewmodel/auth_prov.dart';
import 'package:firebase_project/main_page/screen_main.dart';
import 'package:firebase_project/routes/navigator.dart';
import 'package:firebase_project/sign_up/view/screen_sign_up.dart';
import 'package:firebase_project/utitis/colors/colors.dart';
import 'package:firebase_project/utitis/sizedbox/sizedbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utitis/fonts/fonts.dart';
import 'widgets/textfield_widget.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  // @override
  // void dispose() {
  //    super.dispose();
  //   context.read<AuthenticationProv>().emialcntrllr.dispose();
  //   context.read<AuthenticationProv>().passwrdcntrllr.dispose();

  // }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                controller: context
                    .read<AuthenticationProv>()
                    .emailTextEditingController,
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
              controller: context
                  .read<AuthenticationProv>()
                  .passwordTextEditingController,
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
            Consumer<AuthenticationProv>(
              builder: (context, value, child) => Column(
                children: [
                  value.activityIndicator
                      ? const SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 11.5),
                            child: Center(
                                child: CupertinoActivityIndicator(
                              radius: 16,
                            )),
                          ))
                      : 
                     
                       SizedBox(
      width: double.infinity,
      child: MaterialButton(
        onPressed: () async {
          final msg = await context.read<AuthenticationProv>().logIn();
          if (msg == '') {
            Routes.pushReplacementScreen(screen: const ScreenMain());
          } else {
            pop(context, msg);
          }
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Text(
            'Login',
            style: TextStyle(
                color: kwhiteColor, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        color: defaultColor,
      ),
    )
                ],
              ),
            ),
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
   void pop(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        duration: const Duration(milliseconds: 1500),
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
      width: (_size / 2) - 25,
      child: const Divider(),
    );
  }
   
}
