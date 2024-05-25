import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/screens/screen.dart';
import 'package:flutter_application_2/widgets/widgets.dart';



class WelcomePage extends StatelessWidget{
  const WelcomePage({super.key, });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children:[Flexible(
          child: Column(
            children: [ Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width*0.8,
                child: const Image(image: AssetImage('assets/images/iot.jpg'),
              ),
            ),
          ),
          const SizedBox(height:15),
          const Text("SIJI's IOT Project \n Multilingual Smart Irrigation Application",
          style: kHeadline,
          textAlign: TextAlign.center,
          ),
          const SizedBox(height:10),
          SizedBox(
          width: MediaQuery.of(context).size.width*0.8,
          child: const Text("Supervisor: DR O.K Ogidan",
          style: kBodyText,
          textAlign: TextAlign.center,
          ),)
        
            ],
         ),
        ),
        Container(height: 50, decoration: BoxDecoration(color: Colors.grey[850], borderRadius: BorderRadius.circular(18),),
        child: Row( 
          children:[ 
            Expanded(child: 
            MyTextButton(
              bgColor: Colors.white,
              buttonName: 'Register',
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context)=>const RegisterPage())
            );},
              textColor: Colors.black87, onTap: () {  },
            ),),
            Expanded(child: 
            MyTextButton(
              bgColor: Colors.transparent,
              buttonName: 'Sign in',
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context)=>   const SignInPage(),
                )); 
              },
              textColor: Colors.white, onTap: () {  },
            ),)
            ],),),
            
      ],),),),);
  }
}
