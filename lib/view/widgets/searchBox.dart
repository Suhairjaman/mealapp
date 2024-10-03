


// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
            color: Color(0xffbF2F2F2), borderRadius: BorderRadius.circular(34)),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align elements to the start
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 10),
              child: Icon(
                Icons.search, // Add search icon
                color: Colors.grey, // Icon color
                size: 30, // Icon size
              ),
            ),
            SizedBox(width: 10), // Space between icon and text
            Text(
              'Search food', // Your text
              style: TextStyle(
                color: Colors.black54, // Text color
                fontSize: 16, // Text size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
