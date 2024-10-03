// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal_app/view/screens/mainloginScreen.dart';
import 'package:meal_app/view/screens/signupScreen.dart';
import 'package:meal_app/view/screens/splashScreen.dart';
import 'package:meal_app/view/widgets/bottomNavigation.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Meal Mnkey App',
      theme: ThemeData(
         scaffoldBackgroundColor: Color(0xffbFFFFFF),
       fontFamily: 'Metropolis'
      ),
      home: SplashScreen(),
    );
  }
}
