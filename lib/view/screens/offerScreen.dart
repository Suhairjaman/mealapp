// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meal_app/common/colors.dart';
import 'package:meal_app/view/screens/homeScreen.dart';
import 'package:meal_app/view/widgets/bottomNavigation.dart';
import 'package:meal_app/view/widgets/searchBox.dart';

class OfferScreen extends StatelessWidget {
  OfferScreen({super.key});
  List<String> imagename = ['Cafe De Noires', 'Isso', 'Cafe Beans'];
  List<String> imagenames = [
    'assets/img/k.png',
    'assets/img/d.png',
    'assets/img/nathan-dumlao-zUNs99PGDg0-unsplash.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color.fromARGB(255, 231, 231, 231),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ' Latest Offers',
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 20,
              ),
            ),
            Icon(Icons.shopping_cart)
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 18),
            child: Text('Find Discounts,Offer Special'),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Container(
              height: 30,
              width: 170,
              decoration: BoxDecoration(
                  color: maincolor, borderRadius: BorderRadius.circular(28)),
              child: Center(
                  child: Text(
                'Check Offers',
                style: TextStyle(color: Colors.white, fontSize: 12),
              )),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(imagenames[index]),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      imagename[index],
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Icon(Icons.star,color: maincolor,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          '4.7',
                          style: TextStyle(fontSize: 16, color: maincolor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          '(124 ratings)Cafe Western Food',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: fontcolor,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15,),
                ],
              );
            },
            itemCount: imagenames.length,
          ))
        ],
      ),
      bottomNavigationBar: BottomNav(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          backgroundColor: maincolor,
          shape: CircleBorder(),
          child: Icon(
            Icons.home,
            color: Colors.white,
            size: 26,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
