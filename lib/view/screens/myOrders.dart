// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:meal_app/common/colors.dart';
import 'package:meal_app/view/screens/checkOutScreen.dart';
import 'package:meal_app/view/screens/homeScreen.dart';
import 'package:meal_app/view/widgets/bottomNavigation.dart';
import 'package:meal_app/view/widgets/roundButton.dart';

class MyordersScreen extends StatelessWidget {
  const MyordersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ' My Orders',
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 20,
              ),
            ),
            Icon(Icons.shopping_cart),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/img/ilya-mashkov-_qxbJUr9RqI-unsplash.png',
                    scale: 2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 6),
                        child: Text(
                          'King Burgers',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Icon(
                              Icons.star,
                              color: maincolor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text('(4.7 Rating)'),
                          )
                        ],
                      ),
                      Text(
                        '    Burger western Food',
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(66, 222, 221, 221),
              ),
              child: Column(
                children: [
                  myForm('Beef Burger x1', '\$17'),
                  Divider(
                    thickness: 0.3,
                  ),
                  myForm('Classic Burger x1', '\$999'),
                  Divider(
                    thickness: 0.3,
                  ),
                  myForm('Cheese Chicken Burger x1', '\$86'),
                  Divider(
                    thickness: 0.3,
                  ),
                  myForm('French Frise Large x9', '\$344'),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Calculation('Delivery Instruction', '+ Add Notes'),
            SizedBox(
              height: 24,
            ),
            Calculation('Sub Total', '\$77'),
            Calculation('Delivery Cost', '\$55'),
            Divider(
              thickness: 0.7,
            ),
            Calculation('Total', '\$777'),
            SizedBox(
              height: 14,
            ),
            Center(
                child: RoundButton(
                    text: 'Checkout',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CheckoutScreen()));
                    },
                    fontsize: 16))
          ],
        ),
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

Widget myForm(String name, String value) {
  return Padding(
    padding: const EdgeInsets.only(left: 24, right: 24, top: 14, bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ],
    ),
  );
}

Widget Calculation(String name, String value) {
  return Padding(
    padding: const EdgeInsets.only(left: 14, top: 14, right: 14),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: maincolor,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    ),
  );
}
