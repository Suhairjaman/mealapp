// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meal_app/common/colors.dart';

class MenuList extends StatelessWidget {
  final String itemname;
  final String itempath;
  final IconData icon;
  MenuList({
    super.key,
    required this.itemname,
    required this.itempath,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: Image.asset(
            itempath,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24,top: 14),
          child: Text(
            itemname,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Icon(
                icon,
                size: 24,
                color: maincolor,
              ),
            ),
            SizedBox(
              width: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                '4.7',
                style: TextStyle(fontSize: 16, color: maincolor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text('(124 ratings)Cafe Western Food',style: TextStyle(
                fontWeight: FontWeight.w600,
                color: fontcolor,
              ),),
            )
          ],
        ),
      ],
    );
  }
}
