import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GameSettingsPage extends StatefulWidget {
  @override
  _GameSettingsPageState createState() => _GameSettingsPageState();
}

class _GameSettingsPageState extends State<GameSettingsPage> {
  Icon _icon;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Score: 0"),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: 5 * 5,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 6),
                      itemBuilder: (BuildContext context, int index) {
                        print(_icon == null ? "boş len mq" : "");
                        return DragTarget<Icon>(
                          builder: (BuildContext context,
                              List<Object> candidateData,
                              List<dynamic> rejectedData) {
                            return Container(
                              color: _icon == null ? Colors.blue : Colors.red,
                            );
                          },
                          onLeave: (data) {},
                          onAccept: (data) {
                            print(data.color);
                            setState(() {
                              _icon = data;
                            });
                          },
                          onWillAccept: (data) => data == Icon(Icons.home),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Draggable<Icon>(
                      feedback: Icon(Icons.home),
                      child: Icon(Icons.home),
                      data: Icon(Icons.home),
                      childWhenDragging: Container(),
                    ),
                    Draggable<Icon>(
                      feedback: Icon(Icons.circle),
                      child: Icon(Icons.circle),
                      data: Icon(Icons.circle),
                      childWhenDragging: Container(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
