// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:meal_app/common/colors.dart';
import 'package:meal_app/view/screens/homeScreen.dart';
import 'package:meal_app/view/widgets/bottomNavigation.dart';
import 'package:meal_app/view/widgets/roundButton.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

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
              ' Checkout',
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            Text(
              'Delivery Address',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color.fromARGB(255, 181, 178, 178)),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              '653 Norway',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Broklyn,NY 789',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black),
                ),
                Text(
                  'Change',
                  style:
                      TextStyle(color: maincolor, fontWeight: FontWeight.w600),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(thickness: 1),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payment method',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: const Color.fromARGB(255, 186, 185, 185)),
                ),
                Text(
                  '+ Add Card',
                  style:
                      TextStyle(color: maincolor, fontWeight: FontWeight.w600),
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextFormField(
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.circle_outlined,
                      color: maincolor,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    labelText: '   Cash on Delivery',
                    fillColor: Color.fromARGB(255, 245, 245, 245),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                      borderSide: BorderSide.none,
                    )),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            TextFormField(
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.circle_outlined,
                  color: maincolor,
                ),
                prefixIcon: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Image.asset(
                      'assets/img/NoPath - Copy (12).png',
                      scale: 2,
                    ),
                  ),
                  Text(' **** **** *5567'),
                ]),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 15,
                ),
                fillColor: Color.fromARGB(255, 245, 245, 245),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextFormField(
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.circle_outlined,
                      color: maincolor,
                    ),
                    prefixIcon: Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: Image.asset(
                          'assets/img/NoPath - Copy (2).png',
                          scale: 2,
                        ),
                      ),
                      Text('georgekutty@gmail.com'),
                    ]),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    fillColor: Color.fromARGB(255, 245, 245, 245),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                      borderSide: BorderSide.none,
                    )),
              ),
            ),
            Divider(),
            Calculationsec('Sub Total', '\$67'),
            SizedBox(
              height: 7,
            ),
            Calculationsec('Delivery cost', '\$7'),
            SizedBox(
              height: 7,
            ),
            Calculationsec('Discount', '\$44'),
            SizedBox(
              height: 7,
            ),
            Calculationsec('Total', '\$322'),
            Divider(),
            RoundButton(text: 'Send Order', onPressed: (){}, fontsize: 18)
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

Widget Calculationsec(String name, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(name),
      Text(
        value,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      
    ],
  );
}
