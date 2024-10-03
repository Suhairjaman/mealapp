// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:meal_app/common/colors.dart';
import 'package:meal_app/view/screens/menuScreen.dart';
import 'package:meal_app/view/screens/moreScreen.dart';
import 'package:meal_app/view/screens/offerScreen.dart';
import 'package:meal_app/view/screens/profileScreen.dart';

class BottomNav extends StatefulWidget {
  BottomNav({
    Key? key,
  }) : super(key: key);
  @override
  _BottomNav createState() => _BottomNav();
}

class _BottomNav extends State<BottomNav> {
  int _selectedIndex=0;  // Track the selected tab index

    // List of screens for each tab
  List<Widget>myscreens =[
    MenuScreen(),
    OfferScreen(),
    ProfileScreen(),
    Morescreen(),
  ];
    // Method to handle tapping on the icons
   void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update selected index when tapped
    });
  }
  @override
  Widget build(BuildContext context) {
    return 
    BottomAppBar(
      
      height: 80,
      color: Colors.white,
      shape: CircularNotchedRectangle(), // Creates the notch for FAB
      notchMargin: 28.0,
      elevation: 4,
      padding: EdgeInsets.only(top: 20, left: 15),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: InkWell(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuScreen()));
                  } ,
                  child: Row(
                    children: [
                      SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset('assets/img/Group 6847.png')),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: Text(
                      'Menu',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ],
          ),
         
           SizedBox(
            width: 50,
          ),
         
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: InkWell(
                   onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OfferScreen()));
                  },
                  child: Row(
                    children: [
                      SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset('assets/img/002-shopping-bag.png')),
                    ],
                  ),
                ),
              ),
            
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: Text(
                      'Offers',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: 100,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: InkWell(
                   onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfileScreen()));
                  },
                  child: Row(
                    children: [
                      SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset('assets/img/man-user.png')),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: Text(
                      'Profile',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(width: 40,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: InkWell(
                   onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Morescreen()));
                  },
                  child: Row(
                    children: [
                      SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset('assets/img/Group 6814.png')),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: Text(
                      'More',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
