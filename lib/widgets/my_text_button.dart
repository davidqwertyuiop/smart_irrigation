
import 'package:flutter/material.dart';
import 'package:flutter_application_5/constants.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({super.key, 
     required this.buttonName, required this.onPressed, required this.bgColor, required this.textColor, required Null Function() onTap,
  });
  final String buttonName;
  final void Function()? onPressed;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
    height: 60,
    width: double.infinity,
    decoration: BoxDecoration(color: bgColor,
    borderRadius: BorderRadius.circular(18),),
    child: TextButton(
      style: ButtonStyle(overlayColor: MaterialStateProperty.resolveWith((states) => Colors.black12),),
      onPressed: onPressed,
      child:
      Text(buttonName, style: kButtonText.copyWith(color:textColor),),));
  }
}
