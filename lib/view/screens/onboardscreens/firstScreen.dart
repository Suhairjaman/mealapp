// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors
import 'package:flutter/material.dart';
import 'package:meal_app/view/screens/homeScreen.dart';
import 'package:meal_app/view/widgets/roundButton.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboardfirst extends StatefulWidget {
  const Onboardfirst({super.key});

  @override
  State<Onboardfirst> createState() => _OnboardfirstState();
}

class _OnboardfirstState extends State<Onboardfirst> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                buildPage(
                  context,
                  'assets/img/Find food you love vector.png',
                  'Find Food You Love',
                  '   Discover the best foods from over 1,000\nrestaurants and fast delivery to your doorsteps',
                ),
                buildPage(
                  context,
                  'assets/img/Delivery vector.png',
                  'Fast Delivery',
                  '  Fast fod delivery to your home,office\nwhereever you are',
                ),
                buildPage(
                  context,
                  'assets/img/Live tracking vector.png',
                  'Live Tracking',
                  '   Real time tracking of your food on the app\n once you placed the order',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 120),
            child: RoundButton(
              fontweight: FontWeight.w500,
              text: 'Next',
              onPressed: () {
                if (_pageController.page! < 2) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  // Navigate to next screen if last page
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                }
              },
              fontsize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage(
      BuildContext context, String imagePath, String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 120),
        Image.asset(
          imagePath,
          scale: 2,
        ),
        SizedBox(height: 30),
        SmoothPageIndicator(
          controller: _pageController, // PageController
          count: 3, // Number of pages
          effect: ExpandingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            expansionFactor: 1.1,
            activeDotColor: Color(0xffFC6011),
            dotColor: Colors.grey,
          ),
        ),
        SizedBox(height: 30),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ),
      ],
    );
  }
}
