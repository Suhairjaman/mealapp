// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_full_hex_values_for_flutter_colors, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/common/colors.dart';
import 'package:meal_app/view/screens/homeScreen.dart';
import 'package:meal_app/view/screens/onboardscreens/firstScreen.dart';

import 'package:meal_app/view/screens/resetPassword.dart';
import 'package:meal_app/view/screens/signupScreen.dart';
import 'package:meal_app/view/widgets/myformField.dart';
import 'package:meal_app/view/widgets/roundButton.dart';

class MainLogin extends StatefulWidget {
  const MainLogin({super.key});

  @override
  State<MainLogin> createState() => _MainLoginState();
}

class _MainLoginState extends State<MainLogin> {
  String email = "", password = "";
  final TextEditingController PasswordContrller = TextEditingController();
  final TextEditingController emailContrller = TextEditingController();

  Future<void> userlogin() async {
    // Get the text from the controllers
    String email = emailContrller.text.trim();
    String password = PasswordContrller.text.trim();
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Onboardfirst()));
    } on FirebaseAuthException catch (e) {
      String message;

      if (e.code == 'user-not-found') {
        message = 'No user found for that email';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided';
      } else if (e.code == 'invalid-email') {
        message = 'The email address is invalid';
      } else {
        message = 'An error occurred: ${e.message}';
      }

      // Show the snackbar with the error message
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    } catch (e) {
      // Handle any other exceptions
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An unexpected error occurred')));
    }
  }

  @override
  Widget build(BuildContext context) {
    var mywidth = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Text(
                'Login',
                style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffb4A4B4D)),
              ),
            )),
            Text('Add your details to login',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                )),
            SizedBox(
              height: 60,
            ),
            SizedBox(
              width: mywidth.width * 0.83,
              child: TextFormField(
                controller: emailContrller,
                decoration: InputDecoration(
                  labelText: 'Email',
                  contentPadding:
                      EdgeInsets.only(left: 24, top: 18, bottom: 18),
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
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: mywidth.width * 0.83,
              child: TextFormField(
                obscureText: true,
                controller: PasswordContrller,
                decoration: InputDecoration(
                  labelText: 'Password',
                  contentPadding:
                      EdgeInsets.only(left: 24, top: 18, bottom: 18),
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
            ),
            SizedBox(
              height: 25,
            ),
            RoundButton(
              text: 'Login',
              onPressed: () async {
                if (emailContrller.text.isNotEmpty &&
                    PasswordContrller.text.isNotEmpty) {
                  setState(() {
                    email = emailContrller.text;
                    password = PasswordContrller.text;
                  });
                  await userlogin();
                } else {
                  // Show error if fields are empty
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          'Please enter both email and password',
                        )),
                  );
                }
              },
              fontsize: 16,
              fontweight: FontWeight.w500,
            ),
            SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ResetPwd())),
              child: Text(
                'Forgot your password?',
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'or Login With ',
              style: TextStyle(
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: mywidth.width * 0.83,
              child: MaterialButton(
                height: 60,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () {},
                color: bluecolor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/img/facebook-letter-logo.png',
                      scale: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Login with facebook',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            SizedBox(
              width: mywidth.width * 0.83,
              child: MaterialButton(
                height: 60,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () {},
                color: googlecolor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/img/google-plus-logo.png',
                      scale: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Login with Google',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an Account?"),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignupScreen()));
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      color: maincolor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
