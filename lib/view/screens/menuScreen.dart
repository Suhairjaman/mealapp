// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meal_app/view/screens/homeScreen.dart';
import 'package:meal_app/view/widgets/bottomNavigation.dart';
import 'package:meal_app/view/widgets/searchBox.dart';

import '../../common/colors.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<String> mytitles = ['Food', 'Beverages', 'Desserts', 'Promotions'];

  final List<String> mysubtitles=['111 Items','12 Items','777 Items','31 Items','543 Items'];
  final List<String> imagepath =[
    'assets/img/davide-cantelli-jpkfc5_d-DI-unsplash.png',
    'assets/img/allison-griffith-VCXk_bO97VQ-unsplash.png',
    'assets/img/Group 6844.png',
    'assets/img/Mask Group 2189.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ' Menu',
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
     
        children: [
          SearchBox(),
          SizedBox(
            height: 45,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return  SizedBox(height: 25,);
                  },
                  itemCount: mytitles.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 70,width: 100,
                      decoration:
                      
                          BoxDecoration(
                             border: Border.all(
                            color: const Color.fromARGB(255, 234, 233, 233), // Border color
                            width: 2.0, // Border width
                          ),
                            borderRadius: BorderRadius.circular(23)),
                      child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                            subtitle: Text(mysubtitles[index]),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              mytitles[index],
                              style: TextStyle(fontWeight: FontWeight.w600),
                              
                              
                            ),
                            Image.asset('assets/img/Group 6838.png',scale: 2,)
                         
                          ],
                        ),
                        leading: ClipRRect(
                          child: Image.asset(imagepath[index]),
                          
                        ),
                        
                      ),
                    );
                  }),
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
