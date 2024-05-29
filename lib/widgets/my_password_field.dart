
import 'package:flutter/material.dart';
import 'package:flutter_application_2/classes/language_constants.dart';

import '../constants.dart';

class MyPasswordField extends StatefulWidget {
  const MyPasswordField({
    super.key,
    required this.textEditingController, required bool isPasswordVisible, required Null Function() onTap,
  });

  final TextEditingController textEditingController;

  @override
  // ignore: library_private_types_in_public_api
  _MyPasswordFieldState createState() => _MyPasswordFieldState();
}

class _MyPasswordFieldState extends State<MyPasswordField> {
  bool isPasswordVisible = false;

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: widget.textEditingController,
        style: kBodyText.copyWith(
          color: Colors.white,
        ),
        obscureText: !isPasswordVisible,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: togglePasswordVisibility,
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.all(20),
          hintText: translation(context).password,
          hintStyle: kBodyText,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
