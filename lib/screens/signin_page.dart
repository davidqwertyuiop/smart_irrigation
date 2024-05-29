
// ignore_for_file: library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_application_2/widgets/my_password_field.dart';
import 'package:flutter_application_2/widgets/my_text_Field.dart';
import 'package:flutter_application_2/widgets/my_text_button.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';
import '../screens/screen.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({super.key,  });

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isPasswordVisible = true;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          // ignore: deprecated_member_use
          icon: SvgPicture.asset('assets/images/back_arrow.svg', width:24, color: Colors.white,)
        ),
      ),
      body: SafeArea(
        //to make page scrollable
        child: CustomScrollView(
          reverse: true,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                            AppLocalizations.of(context)!.welcomebackuser,
                            style: kHeadline,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            AppLocalizations.of(context)!.youveBeenMissedDearUser,
                            style: kBodyText2,
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                           MyTextField(
                            textEditingController:_email,
                            hintText: AppLocalizations.of(context)!.emailHint,
                            inputType: TextInputType.emailAddress,
                          ),
                          MyPasswordField(
                             textEditingController: _password,
                            isPasswordVisible: isPasswordVisible,
                            onTap: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.donthaveanaccount,
                          style: kBodyText,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const RegisterPage(),
                              ),
                            );
                          },
                          child: Text(
                            AppLocalizations.of(context)!.register,
                            style: kBodyText.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextButton(
                      buttonName: AppLocalizations.of(context)!.signin,
                      onTap: () {},
                      bgColor: Colors.white,
                      textColor: Colors.black87, onPressed: () {
                        FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.text,
                        password: _password.text).then((value) {
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => const HomeScreen())));

                        });
                        
                       },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}