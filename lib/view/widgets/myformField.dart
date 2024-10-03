// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyFormfield extends StatelessWidget {
  final String labeltext;
  final TextEditingController controller;
   final String? Function(String?) validator; 
  const MyFormfield({super.key,  required this.labeltext, required this.controller, required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labeltext,
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
    );
  }
}
