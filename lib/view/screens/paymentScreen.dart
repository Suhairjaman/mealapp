// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:meal_app/common/colors.dart';
import 'package:meal_app/view/screens/addDebitcard.dart';
import 'package:meal_app/view/screens/homeScreen.dart';
import 'package:meal_app/view/widgets/bottomNavigation.dart';
import 'package:meal_app/view/widgets/roundButton.dart';

class PayementScreen extends StatelessWidget {
  const PayementScreen({super.key});

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
              ' Payment Details',
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 24),
            child: Text(
              'Customise your Payment method',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
            child: SizedBox(
              width: 450,
              child: Divider(),
            ),
          ),
          Container(
            height: 200,
            width: double.infinity,
            color: Color.fromARGB(255, 238, 236, 236),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 34, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cash/Card on delivery',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                      Icon(
                        Icons.check,
                        color: maincolor,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 34),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/img/NoPath - Copy (12).png',
                        scale: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text('  ****'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text('  ****'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text('  9199'),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Container(
                        height: 35,
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: maincolor, // Border color
                              width: 2, // Border width
                            ),
                            borderRadius: BorderRadius.circular(18)),
                        child: Center(
                          child: Text(
                            'Delete Card',
                            style: TextStyle(
                                color: maincolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 24),
                  child: Text(
                    'Other Methods',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
              child: RoundButton(
            text: ' + Add Another Debit/Credit Card',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DebitCardScreen()));
            },
            fontsize: 16,
            fontweight: FontWeight.w600,
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
          backgroundColor: Colors.grey,
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
