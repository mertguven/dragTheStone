import 'dart:async';
import 'package:dragTheStone/screens/gamePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GameSettingsPage extends StatefulWidget {
  @override
  _GameSettingsPageState createState() => _GameSettingsPageState();
}

class _GameSettingsPageState extends State<GameSettingsPage> {
  var player;
  var mainStone;
  var wall1;
  var wall2;
  var wall3;
  var wallIndex = 0;
  var playerIndex = 0;
  var counter = 0;
  int homeIconCounter = 1;
  int playerIconCounter = 1;
  int wallIconCounter = 3;
  bool isItClicked = false;
  Timer timer;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<Icon> icon = List(81);
  static int numberInRow = 9;
  int numberOfSquares = numberInRow * 9;

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
                            builder: (context) => GamePage(
                                  sizeOfField: 7,
                                ))),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 10,
                    color: Color(0xFF062161),
                    child: Text(
                      "7 X 7",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => GamePage(
                                  sizeOfField: 8,
                                ))),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 10,
                    color: Color(0xFF062161),
                    child: Text(
                      "8 X 8",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => GamePage(
                                  sizeOfField: 9,
                                ))),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 10,
                    color: Color(0xFF062161),
                    child: Text(
                      "9 X 9",
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
