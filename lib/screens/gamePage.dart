import 'dart:async';

import 'package:dragTheStone/screens/gameSettingsPage.dart';
import 'package:dragTheStone/screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class GamePage extends StatefulWidget {
  int sizeOfField;

  GamePage({this.sizeOfField});
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
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
  List<Icon> icon = List();
  int numberInRow;
  int numberOfSquares;

  @override
  void initState() {
    icon = List(widget.sizeOfField * widget.sizeOfField);
    numberInRow = widget.sizeOfField;
    numberOfSquares = widget.sizeOfField * widget.sizeOfField;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
            Lottie.asset(
              "assets/home_page_background_animation.json",
              width: double.infinity,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: numberOfSquares,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: numberInRow),
                      itemBuilder: (BuildContext context, int index) {
                        return DragTarget(
                          builder: (context, candidateData, rejectedData) {
                            return Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.cyan,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: player == index
                                    ? Icon(Icons.accessibility_new)
                                    : mainStone == index
                                        ? Icon(Icons.home)
                                        : wall1 == index ||
                                                wall2 == index ||
                                                wall3 == index
                                            ? Icon(
                                                Icons.whatshot,
                                                color: Colors.red,
                                              )
                                            : Container(),
                              ),
                            );
                          },
                          onAccept: (Icon data) {
                            setState(() {
                              if (data.color == Colors.blue) {
                                player = index;
                                if (playerIconCounter != 0) {
                                  playerIconCounter--;
                                }
                              } else if (data.color == Colors.black) {
                                mainStone = index;
                                if (homeIconCounter != 0) {
                                  homeIconCounter--;
                                }
                                print(
                                    "Ana taşın indexi:" + mainStone.toString());
                              } else if (data.color == Colors.red) {
                                if (wallIndex == 0) {
                                  wall1 = index;
                                  if (wallIconCounter != 0) {
                                    wallIconCounter--;
                                  }
                                  wallIndex++;
                                } else if (wallIndex == 1) {
                                  wall2 = index;
                                  if (wallIconCounter != 0) {
                                    wallIconCounter--;
                                  }
                                  wallIndex++;
                                } else if (wallIndex == 2) {
                                  wall3 = index;
                                  if (wallIconCounter != 0) {
                                    wallIconCounter--;
                                  }
                                }
                              }
                              icon[index] = data;
                            });
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Draggable<Icon>(
                                    feedback: homeIconCounter != 0
                                        ? Icon(Icons.home)
                                        : Container(),
                                    child: homeIconCounter == 0
                                        ? Container()
                                        : Icon(Icons.home),
                                    data: Icon(
                                      Icons.home,
                                      color: Colors.black,
                                    ),
                                    childWhenDragging: Icon(Icons.home),
                                  ),
                                  Text(homeIconCounter.toString()),
                                ],
                              ),
                              Column(
                                children: [
                                  Draggable<Icon>(
                                    feedback: playerIconCounter != 0
                                        ? Icon(Icons.accessibility_new)
                                        : Container(),
                                    child: playerIconCounter == 0
                                        ? Container()
                                        : Icon(Icons.accessibility_new),
                                    data: Icon(
                                      Icons.accessibility_new,
                                      color: Colors.blue,
                                    ),
                                    childWhenDragging:
                                        Icon(Icons.accessibility_new),
                                  ),
                                  Text(playerIconCounter.toString()),
                                ],
                              ),
                              Column(
                                children: [
                                  Draggable<Icon>(
                                    feedback: wallIconCounter != 0
                                        ? Icon(
                                            Icons.whatshot,
                                            color: Colors.red,
                                          )
                                        : Container(),
                                    child: wallIconCounter == 0
                                        ? Container()
                                        : Icon(
                                            Icons.whatshot,
                                            color: Colors.red,
                                          ),
                                    data: Icon(
                                      Icons.whatshot,
                                      color: Colors.red,
                                    ),
                                    childWhenDragging: Icon(
                                      Icons.whatshot,
                                      color: Colors.red,
                                    ),
                                  ),
                                  Text(wallIconCounter.toString()),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        color: Colors.cyan,
        child: isItClicked
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    onPressed: () {
                      if (homeIconCounter == 0 && playerIconCounter == 0) {
                        startGame();
                      } else {
                        showCustomAlertDialog(context, "error");
                      }
                    },
                    child: Text(
                      "Resume",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      timer.cancel();
                    },
                    child: Text(
                      "Pause",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ],
              )
            : FlatButton(
                onPressed: () {
                  if (homeIconCounter == 0 && playerIconCounter == 0) {
                    startGame();
                  } else {
                    showCustomAlertDialog(context, "error");
                  }
                },
                child: Text(
                  "Start",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
      ),
    );
  }

  showCustomAlertDialog(BuildContext context, String which) {
    if (counter == 1 || which == "error") {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    which == "victory" ? "Victory!" : "Error!",
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    which == "victory"
                        ? "Score: $counter"
                        : "Please make sure you put\n the main stone and the regular\n stone on the playing field.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              actions: [
                which == "victory"
                    ? Row(
                        children: [
                          FlatButton(
                            onPressed: () => Navigator.pushAndRemoveUntil(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => HomePage()),
                                (route) => false),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              decoration: BoxDecoration(
                                color: Color(0xFF062161),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "Return to homepage",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () => Navigator.pushAndRemoveUntil(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => GameSettingsPage()),
                                (route) => false),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              decoration: BoxDecoration(
                                color: Color(0xFF062161),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "Play again",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )
                    : FlatButton(
                        onPressed: () => Navigator.pop(context),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Color(0xFF062161),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Okay",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
              ],
            );
          });
    }
  }

  startGame() {
    setState(() {
      isItClicked = true;
    });
    Direction direction = Direction();
    timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      direction.moveRight(player, mainStone, wall1, wall2, wall3, numberInRow);
      direction.moveLeft(player, mainStone, wall1, wall2, wall3, numberInRow);
      direction.moveUp(player, mainStone, wall1, wall2, wall3, numberInRow);
      direction.moveDown(player, mainStone, wall1, wall2, wall3, numberInRow);
      print(direction.yon);
      if (direction.yon == "right") {
        setState(() {
          player = player + 1;
          if (mainStone == player) {
            player = -9999;
            counter++;

            showCustomAlertDialog(context, "victory");
            timer.cancel();
          }
        });
      } else if (direction.yon == "left") {
        setState(() {
          player = player - 1;
          if (mainStone == player) {
            player = -9999;
            counter++;

            showCustomAlertDialog(context, "victory");
            timer.cancel();
          }
        });
      } else if (direction.yon == "up") {
        setState(() {
          player = player - numberInRow;
          if (mainStone == player) {
            player = -9999;
            counter++;

            showCustomAlertDialog(context, "victory");
            timer.cancel();
          }
        });
      } else if (direction.yon == "down") {
        setState(() {
          player = player + numberInRow;
          if (mainStone == player) {
            player = -9999;
            counter++;
            showCustomAlertDialog(context, "victory");
            timer.cancel();
          }
        });
      }
    });
  }
}

class Direction {
  int rightWay = 81;
  String yon;

  moveRight(
      int player, int mainStone, int wall1, int wall2, int wall3, int nir) {
    player = player + 1;
    if ((mainStone - player).abs() < rightWay &&
        player != wall1 &&
        player != wall2 &&
        player != wall3) {
      rightWay = (mainStone - player).abs();
      yon = "right";
    }
  }

  moveLeft(
      int player, int mainStone, int wall1, int wall2, int wall3, int nir) {
    player = player - 1;
    if ((mainStone - player).abs() < rightWay &&
        player != wall1 &&
        player != wall2 &&
        player != wall3) {
      rightWay = (mainStone - player).abs();
      yon = "left";
    }
  }

  moveUp(int player, int mainStone, int wall1, int wall2, int wall3, int nir) {
    player = player - nir;
    if ((mainStone - player).abs() < rightWay &&
        player != wall1 &&
        player != wall2 &&
        player != wall3) {
      rightWay = (mainStone - player).abs();
      yon = "up";
    }
  }

  moveDown(
      int player, int mainStone, int wall1, int wall2, int wall3, int nir) {
    player = player + nir;
    if ((mainStone - player).abs() < rightWay &&
        player != wall1 &&
        player != wall2 &&
        player != wall3) {
      rightWay = (mainStone - player).abs();
      yon = "down";
    }
  }
}
