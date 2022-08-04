import 'package:firebase_project/utitis/colors/colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
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
}
