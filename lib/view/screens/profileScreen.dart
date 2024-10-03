// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meal_app/common/colors.dart';
import 'package:meal_app/view/screens/homeScreen.dart';
import 'package:meal_app/view/widgets/bottomNavigation.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});
List<String>label=[
  'Alana','Alana@gmail.com','8363778336','**********','*********'
];
List<String>hintname= [
  'Name','Email','Mobile No.','Password','Confirm Password',
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
              ' Profiles',
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
         mainAxisAlignment:
            MainAxisAlignment.start, // Align children vertically to center
        crossAxisAlignment: CrossAxisAlignment.center, 
        
        children: [
          
          Center(child: Image.asset('assets/img/NoPath - Copy (14).png',scale: 2,)),
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.edit,color: maincolor,size: 10,),
              Text(' Edit Profile',style: TextStyle(color: maincolor,fontWeight: FontWeight.w400),),
            ],
          ),
          SizedBox(height: 10,),
          Text('Hi there Alana!',style: TextStyle(fontWeight: FontWeight.w500,
          fontSize: 16),),
          SizedBox(
            height: 2,
          ),
          Text('Sign out',style: TextStyle(fontWeight: FontWeight.w300),),
          Expanded(child: ListView.builder(itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
              child: TextFormField(
                
                decoration: InputDecoration(
                  labelText: label[index],hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  hintText: hintname[index],
                  fillColor: Color.fromARGB(255, 236, 236, 236),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(24),
                  )
                ),
              ),
            );
            
          },
          
          itemCount: 5,)),
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