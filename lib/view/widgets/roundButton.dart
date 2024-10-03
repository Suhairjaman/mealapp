// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final double fontsize;
  final VoidCallback onPressed;
  final FontWeight fontweight;

   const RoundButton({
    super.key,
    required this.text,
    required this.onPressed, required this.fontsize,  this.fontweight=FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return MaterialButton(
        height: 60,
      minWidth: media.width * 0.83,
      onPressed: onPressed,
     
      color: Color(0xffbFC6011),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30), // Circular border
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: fontweight,
          color: Colors.white,
          fontSize: fontsize,
        ),
      ),
    );
  }
}
