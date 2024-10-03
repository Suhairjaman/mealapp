// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SmallImages extends StatelessWidget {
  final String itemname;
  final String imagepath;
  const SmallImages({
    super.key,
    required this.itemname,
    required this.imagepath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100,width: 100,
          child: Image.asset(imagepath)),
        Text(
          itemname,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
