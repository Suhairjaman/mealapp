// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/view/screens/mainloginScreen.dart';
import 'package:meal_app/view/widgets/roundButton.dart';

class OtpScreen extends StatefulWidget {
  String verificationid;
  OtpScreen({super.key, required this.verificationid});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Text(
                      'We have sent an OTP to\n            your email',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    '      Please check Your email\n continue to reset your password',
                    style: TextStyle(
                        fontFamily: 'Metropolis', fontWeight: FontWeight.w400),
                  ),
                  RoundButton(
                      text: 'Next',
                      onPressed: () async {
                        try {
                          PhoneAuthCredential credential =
                              await PhoneAuthProvider.credential(
                                  verificationId: widget.verificationid,
                                  smsCode: otpcontroller.text.toString());
                                  FirebaseAuth.instance.signInWithCredential(credential).then((value) =>    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainLogin())));
                        } catch (e) {
                          // Handle any other exceptions
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('An unexpected error occurred')));
                        }
                      },
                      fontsize: 18),
                ],
              )),
        ),
      ),
    );
  }
}
