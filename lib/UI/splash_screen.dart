import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app/shared/shared.dart';
class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home-page');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white, // Navy dark background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image at the top
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/food/logos.png')
                ),
              ),
            ),
            SizedBox(height: 5), // Spacing between the image and text

            // Main Title - "Gemuani"
            Text(
              "WAROENG KU",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: mainColor
              ),
            ),
            // Spacing between the title and subtitle
            // Subtitle - "Powered by Gemini"
            Text(
              "Woreng ku, cepet nggolek, cepet nyampe!",
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
                color: Colors.black, // Light text with opacity
              ),
            ),
          ],
        ),
      ),
    );
  }
}