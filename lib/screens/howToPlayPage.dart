import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class HowToPlayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Lottie.asset(
              "assets/home_page_background_animation.json",
              width: double.infinity,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 200),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white54,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF062161),
                      blurRadius: 0.5,
                      offset: Offset(0.5, 0.5),
                      spreadRadius: 0.5,
                    ),
                  ]),
              child: Text(
                "The house icon and the human icon are placed in the field and if desired, the flame icon is placed in the field and the start button is clicked. If we want to pause, click the pause button, if we want to continue, click the continue button.",
                style: TextStyle(
                  color: Color(0xFF062161),
                  fontSize: 22,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 26),
              child: ListTile(
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
