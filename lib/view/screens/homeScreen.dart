// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:meal_app/common/colors.dart';
import 'package:meal_app/view/widgets/bottomNavigation.dart';
import 'package:meal_app/view/widgets/menuList.dart';
import 'package:meal_app/view/widgets/recentItems.dart';
import 'package:meal_app/view/widgets/smallImages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? dropdwnvalue;
  var places = ['Kochi', 'Trivandrum', 'Calicut', 'Vypin', 'Trissur'];

  @override
  Widget build(BuildContext context) {
    var mywidth = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        // backgroundColor: Color.fromARGB(255, 231, 231, 231),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ' Good morning Alana!',
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 20,
              ),
            ),
            Icon(Icons.shopping_cart)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text('Delivering to'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: DropdownButton<String>(
                  value: dropdwnvalue,
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                    ),
                  ),
                  iconEnabledColor: Color(0xffbFC6011),
                  hint: Text('Current Location',
                      style: TextStyle(fontWeight: FontWeight.w700)),
                  items: places.map((String place) {
                    return DropdownMenuItem(value: place, child: Text(place));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdwnvalue = newValue!;
                    });
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            searchBox(mywidth),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(24),
              child: Row(
                children: [
                  SmallImages(
                      itemname: 'Offers', imagepath: 'assets/img/burg.png'),
                  SizedBox(
                    width: 15,
                  ),
                  SmallImages(
                      itemname: 'Sri Lankan', imagepath: 'assets/img/sri.png'),
                  SizedBox(
                    width: 15,
                  ),
                  SmallImages(
                      itemname: 'Italian', imagepath: 'assets/img/ital.png'),
                  SizedBox(
                    width: 15,
                  ),
                  SmallImages(
                      itemname: 'Indian', imagepath: 'assets/img/india.png'),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Popular Restuarants',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: Text(
                    'View all',
                    style: TextStyle(
                        color: maincolor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            MenuList(
                itemname: 'Minute by tuk-tuk',
                itempath:
                    'assets/img/aurelien-lemasson-theobald-x00CzBt4Dfk-unsplash.png',
                icon: Icons.star),
            SizedBox(
              height: 25,
            ),
            MenuList(
                itemname: 'Cafe de Noir',
                itempath: 'assets/img/heather-ford-teuvnOXOGVo-unsplash.png',
                icon: Icons.star),
            SizedBox(
              height: 25,
            ),
            MenuList(
                itemname: 'Bakes by Tella',
                itempath: 'assets/img/prakash-meghani-07bBNmiV7ag-unsplash.png',
                icon: Icons.star),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Recent Items',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: Text(
                    'View all',
                    style: TextStyle(
                        color: maincolor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            RecentItems(
                itemtitle: 'Mulberry Pizza by Josh',
                itemsubtitle: 'cafe-wetern fod',
                itemimagepath:
                    'assets/img/chad-montano-MqT0asuoIcU-unsplash.png'),
            SizedBox(
              height: 15,
            ),
            RecentItems(
                itemtitle: 'Barita',
                itemsubtitle: 'cafe-wetern fod',
                itemimagepath:
                    'assets/img/clem-onojeghuo-9AEh9i-WPhI-unsplash.png'),
            SizedBox(
              height: 15,
            ),
            RecentItems(
                itemtitle: 'Piza Rush Hour',
                itemsubtitle: 'cafe-wetern fod',
                itemimagepath:
                    'assets/img/masimo-grabar-NzHRSLhc6Cs-unsplash.png'),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(
        
      ),
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
            color: Colors.white,size: 26,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Padding searchBox(Size mywidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        width: mywidth.width * 0.92,
        height: 55,
        decoration: BoxDecoration(
            color: Color(0xffbF2F2F2), borderRadius: BorderRadius.circular(34)),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align elements to the start
          crossAxisAlignment:
              CrossAxisAlignment.center, // Center the icon and text vertically
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
