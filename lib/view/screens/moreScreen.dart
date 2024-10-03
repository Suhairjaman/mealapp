// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:meal_app/common/colors.dart';
import 'package:meal_app/view/screens/homeScreen.dart';
import 'package:meal_app/view/screens/myOrders.dart';
import 'package:meal_app/view/screens/paymentScreen.dart';
import 'package:meal_app/view/widgets/bottomNavigation.dart';

class Morescreen extends StatelessWidget {
  Morescreen({super.key});
  List<String> names = [
    'Payement Details',
    'My Orders',
    'Notifications',
    'Inbox',
    'About Us'
  ];
  List<String> imagepath = [
    'assets/img/002-income.png',
    'assets/img/002-shopping-bag.png',
    'assets/img/Group 8081.png',
    'assets/img/004-inbox-mail.png',
    'assets/img/005-info.png',
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
                ' More',
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 20,
                ),
              ),
              Icon(Icons.shopping_cart),
            ],
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      if (index == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PayementScreen()),
                        );
                      } else if (index == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyordersScreen()),
                      );
                    }
                    } ,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        height: 70,
                        width: 100,
                        decoration: BoxDecoration(
                            color:Color.fromARGB(255, 235, 234, 234),
                            borderRadius: BorderRadius.circular(7)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(backgroundColor:Color.fromARGB(255, 201, 199, 199), 
                                
                                child: Image.asset(imagepath[index],scale: 2,),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 17),
                              child: Text(names[index],style: TextStyle(fontWeight: FontWeight.w700),),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: imagepath.length,
              ),
            ),
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
