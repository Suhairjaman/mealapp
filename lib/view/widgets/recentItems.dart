// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:meal_app/common/colors.dart';

class RecentItems extends StatelessWidget {
  final String itemtitle;
  final String itemsubtitle;
  final String itemimagepath;

  const RecentItems({super.key, required this.itemtitle, required this.itemsubtitle, required this.itemimagepath});

  @override
  Widget build(BuildContext context) {
    return Card(color: Colors.white,
      child: ListTile(
        
        leading: Image.asset(itemimagepath,fit: BoxFit.cover,),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            
            Text(itemtitle,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
            Text(itemsubtitle),
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 24,
                  color: maincolor,
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
                  child: Text(
                    '(124 ratings)',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: fontcolor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 3,
            ),
            
          ],
        ),
       
      ),
    );
  }
}