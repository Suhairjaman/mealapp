// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:meal_app/view/screens/mainloginScreen.dart';
import 'package:meal_app/view/screens/signupScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                'assets/img/Shaped subtraction.png',
                width: media.width,
              ),
              Image.asset(
                'assets/img/logo.png',
                height: 80,
                width: 120,
              ),
              SizedBox(
                height: 13,
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            '   Discover the best foods from over 1,000\nrestaurants and fast delivery to your doorstep',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 120,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MainLogin()));
            },
            height: 60,
            minWidth: media.width * 0.83,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Circular border
            ),
            child: Text(
              'Login',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            color: Color(0xffbFC6011),
          ),SizedBox(height: 24,),
          Container( decoration: BoxDecoration(
            border: Border.all(color: Color(0xffbFC6011), width: 1),
             borderRadius: BorderRadius.circular(30)),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupScreen()));
              },
              height: 60,
              minWidth: media.width * 0.83,
             
              child: Text(
                'Create an Account',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xffbFC6011),
                  fontSize: 16,
                ),
              ),
             
            ),
          ),
        ],
      ),
    );
  }
}
