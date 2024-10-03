// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/view/screens/otpScreen.dart';
import 'package:meal_app/view/widgets/roundButton.dart';

class ResetPwd extends StatefulWidget {
  ResetPwd({
    super.key,
  });

  @override
  State<ResetPwd> createState() => _ResetPwdState();
}

class _ResetPwdState extends State<ResetPwd> {
  TextEditingController phonecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var mywidth = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  '  Please Enter Your mobile number to recieve a\n      link to create a new password via otp',
                  style: TextStyle(
                      fontFamily: 'Metropolis', fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 72,
                ),
                otpRecieveform(mywidth),
                SizedBox(
                  height: 34,
                ),
                RoundButton(
                    text: 'Send',
                    onPressed: () async {
                    // Validate the form before sending the OTP
                    if (_formKey.currentState!.validate()) {
                       String phoneNumber = phonecontroller.text.trim();

                        // Ensure the phone number is in E.164 format
                        if (!phoneNumber.startsWith('+')) {
                          // Add country code if not provided (e.g., +91 for India)
                          phoneNumber = '+91$phoneNumber';
                        }
                      try {
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: phonecontroller.text.trim(),
                          verificationCompleted:
                              (PhoneAuthCredential credential) {
                            // Handle automatic verification (optional)
                          },
                          verificationFailed: (FirebaseAuthException ex) {
                            // Show error in case of verification failure
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Verification failed: ${ex.message}')),
                            );
                          },
                          codeSent: (String verificationid, int? resendtoken) {
                            // Navigate to OTP screen after OTP is sent
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OtpScreen(
                                  verificationid: verificationid,
                                ),
                              ),
                            );
                          },
                          codeAutoRetrievalTimeout: (String verificationid) {
                            // Handle timeout (optional)
                          },
                        );
                      } catch (e) {
                        // Show error in case something goes wrong
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('An error occurred. Please try again.')),
                        );
                      }
                    }
                  },
                    fontsize: 18)
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox otpRecieveform(Size mywidth) {
    return SizedBox(
      width: mywidth.width * 0.83,
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: phonecontroller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter mobile number';
          }
           if (!RegExp(r'^\+[1-9]\d{1,14}$').hasMatch(value)) {
        // Show error message for invalid format
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter a valid mobile number in the format +[CountryCode][Number]')),
        );}
          
          return null;
        },
        decoration: InputDecoration(
          labelText: 'Mobile Number',
          contentPadding: EdgeInsets.only(left: 24, top: 18, bottom: 18),
          labelStyle: TextStyle(
            color: Color.fromARGB(249, 126, 129, 129),
            fontWeight: FontWeight.w400,
          ),
          filled: true, // Enables filling color
          fillColor: Color(
              0xffbF2F2F2), // S,ets the background color of the TextFormField
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
