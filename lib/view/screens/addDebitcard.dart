// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:meal_app/common/colors.dart';
import 'package:meal_app/view/widgets/roundButton.dart';

class DebitCardScreen extends StatelessWidget {
  const DebitCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 216, 215, 215),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 216, 215, 215),
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
            width: double.infinity,
            height: 591,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32), topRight: Radius.circular(32)),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24, top: 38),
                      child: Text(
                        'Add Credit/Debit Card',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: Icon(
                        Icons.cancel,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                cardForm(),
                expiryForm(),
                securityForm(),
                firstName(),
                lastName(),
                SizedBox(
                  height: 24,
                ),
                Center(
                  child: RoundButton(
                    text: ' + Add Cart',
                    onPressed: () {},
                    fontsize: 18,
                    fontweight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding lastName() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: '   Last Name',
          hintStyle: TextStyle(
            color: fontcolor,
          ),
          fillColor: Color.fromARGB(255, 235, 235, 235),
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(24)),
        ),
      ),
    );
  }

  Padding firstName() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: '   First Name',
          hintStyle: TextStyle(
            color: fontcolor,
          ),
          fillColor: Color.fromARGB(255, 235, 235, 235),
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(24)),
        ),
      ),
    );
  }

  Padding securityForm() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: '   Security Code',
          hintStyle: TextStyle(
            color: fontcolor,
          ),
          fillColor: Color.fromARGB(255, 235, 235, 235),
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(24)),
        ),
      ),
    );
  }

  Padding expiryForm() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 34,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Expiry',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            width: 90,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Color.fromARGB(255, 235, 235, 235),
            ),
            child: Center(
                child: Text(
              'MM',
              style: TextStyle(color: fontcolor),
            )),
          ),
          Container(
            width: 90,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Color.fromARGB(255, 235, 235, 235),
            ),
            child: Center(
                child: Text(
              'YY',
              style: TextStyle(color: fontcolor),
            )),
          ),
        ],
      ),
    );
  }

  Padding cardForm() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: '   Card Number',
          hintStyle: TextStyle(
            color: fontcolor,
          ),
          fillColor: Color.fromARGB(255, 235, 235, 235),
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(24)),
        ),
      ),
    );
  }
}
