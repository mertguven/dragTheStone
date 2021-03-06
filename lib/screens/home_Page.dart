import 'package:dragTheStone/screens/aboutPage.dart';
import 'package:dragTheStone/screens/gameSettingsPage.dart';
import 'package:dragTheStone/screens/howToPlayPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Lottie.asset("assets/home_page_background_animation.json",
                width: double.infinity),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    onPressed: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => GameSettingsPage())),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 10,
                    color: Color(0xFF062161),
                    child: Text(
                      "Start",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => HowToPlayPage())),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 10,
                    color: Color(0xFF062161),
                    child: Text(
                      "How to play?",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => AboutPage())),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 10,
                    color: Color(0xFF062161),
                    child: Text(
                      "Contact Us",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
