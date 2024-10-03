// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/common/colors.dart';
import 'package:meal_app/view/screens/loginScreen.dart';
import 'package:meal_app/view/screens/mainloginScreen.dart';
import 'package:meal_app/view/widgets/myformField.dart';
import 'package:meal_app/view/widgets/roundButton.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = "";
  String email = "";
  String password = "";
  String mobile = "";
  final TextEditingController nameContrller = TextEditingController();
  final TextEditingController emailContrller = TextEditingController();
  final TextEditingController mobileContrller = TextEditingController();
  final TextEditingController PasswordContrller = TextEditingController();
  final TextEditingController ConfirmPasswordContrller =
      TextEditingController();
  Future<void> _registerUser() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Register the user with Firebase Auth
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orange,
            content: Text(
              "Registered successfully",
              style: TextStyle(
                fontSize: 18,
                color: Colors.green,
              ),
            )));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainLogin()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Email is already in use.')));
        } else if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Password is too weak.')));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Failed to register.')));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var mywidth = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffb4A4B4D)),
                ),
              )),
              Text('Add your details to sign up',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                  )),
              SizedBox(
                height: 30,
              ),
              nameField(mywidth),
              SizedBox(height: 23),
              emailField(mywidth),
              SizedBox(height: 23),
              mobileField(mywidth),
              SizedBox(height: 23),
              passwordField(mywidth),
              SizedBox(height: 23),
              confrmPasswordField(mywidth),
              SizedBox(height: 23),
              RoundButton(
                text: 'Sign Up',
                onPressed: () {
                  if (nameContrller.text != "" &&
                      emailContrller.text != "" &&
                      mobileContrller.text != "" &&
                      PasswordContrller.text != "" &&
                      ConfirmPasswordContrller.text != "") {
                    setState(() {
                      name = nameContrller.text;
                      email = emailContrller.text;
                      mobile = mobileContrller.text;
                      password = PasswordContrller.text;
                    });
                  }
                  _registerUser();
                },
                fontsize: 16,
                fontweight: FontWeight.w500,
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an Account?'),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainLogin()));
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: maincolor),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox confrmPasswordField(Size mywidth) {
    return SizedBox(
      width: mywidth.width * 0.83,
      child: TextFormField(
        obscureText: true,
        controller: ConfirmPasswordContrller,
        decoration: InputDecoration(
          labelText: 'Confirm Password',
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Enter a valid password';
          }
          if (!RegExp(
                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
              .hasMatch(value)) {
            return 'Password should contain upper,lower,digit and Special character';
          }
          if (value != PasswordContrller.text) {
            return 'password miss match';
          }
        },
      ),
    );
  }

  SizedBox passwordField(Size mywidth) {
    return SizedBox(
      width: mywidth.width * 0.83,
      child: TextFormField(
        obscureText: true,
        controller: PasswordContrller,
        decoration: InputDecoration(
          labelText: 'Password',
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Enter a valid password';
          }
          if (!RegExp(
                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
              .hasMatch(value)) {
            return 'Password should contain upper,lower,digit and Special character';
          }
        },
      ),
    );
  }

  SizedBox mobileField(Size mywidth) {
    return SizedBox(
      width: mywidth.width * 0.83,
      child: TextFormField(
        controller: mobileContrller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Mobile No.',
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter mobile number';
          }
          if (!RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(value)) {
            return 'invalid mobile number';
          }
          if (value.length != 10) {
            return 'Mobile number must be 10 digits';
          }
        },
      ),
    );
  }

  SizedBox emailField(Size mywidth) {
    return SizedBox(
      width: mywidth.width * 0.83,
      child: TextFormField(
        controller: emailContrller,
        decoration: InputDecoration(
          labelText: 'Email',
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter email';
          }
          if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[com]{3}$')
              .hasMatch(value)) {
            return 'Enter valid email ';
          }
        },
      ),
    );
  }

  SizedBox nameField(Size mywidth) {
    return SizedBox(
        width: mywidth.width * 0.83,
        child: TextFormField(
          controller: nameContrller,
          decoration: InputDecoration(
            labelText: 'Name',
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
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter name';
            }
            if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
              return 'Name can only contain letters and spaces';
            }
            return null;
          },
        ));
  }
}
