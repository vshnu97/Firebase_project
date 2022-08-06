import 'package:firebase_project/login/viewmodel/auth_prov.dart';
import 'package:firebase_project/utitis/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        onPressed: () async {
          final msg = await context.read<AuthenticationProv>().logIn();
          if (msg == '') return;
          pop(context, msg);
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
    );
  }

  void pop(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        duration:  const Duration(milliseconds: 1500),
       // animation: const Animation<double>(.5),
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color.fromARGB(255, 215, 6, 6),
        margin: const EdgeInsets.all(20),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 9),
          child: Text(
            msg,
            style: const TextStyle(letterSpacing: 2,fontWeight: FontWeight.w500),
          ),
        )));
  }
}
