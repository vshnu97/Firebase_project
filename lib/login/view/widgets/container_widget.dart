import 'package:flutter/material.dart';

class ContainerIconWidget extends StatelessWidget {
  String title;
  String imagePath;
  Color containerColor;
  Color textcolor;
 
  ContainerIconWidget(
      {Key? key,
      required this.containerColor,
      required this.imagePath,
      required this.title,
      required this.textcolor,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: containerColor,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
          child: Row(
            children: [
              Image.asset(
                imagePath,
                height: 18,
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    letterSpacing: .7,
                    color: textcolor),
              ),
            ],
          ),
        ));
  }
}
