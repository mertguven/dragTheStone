import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
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
              margin: EdgeInsets.only(top: 200, left: 30, right: 30),
              padding: EdgeInsets.only(top: 20, bottom: 20),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Contact Us",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "draggablestone@gmail.com",
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: Icon(
                      Icons.mail_sharp,
                      color: Color(0xFF062161),
                    ),
                    onTap: () => _launchMail("draggablestone@gmail.com"),
                  ),
                  ListTile(
                    title: Text("Mert Güven LinkedIn"),
                    trailing: FaIcon(
                      FontAwesomeIcons.linkedinIn,
                      color: Color(0xFF062161),
                    ),
                    onTap: () => launch(
                        "https://www.linkedin.com/in/mert-güven-8a0006177/"),
                  ),
                  ListTile(
                    title: Text("Doğukan Yolcuoğlu LikedIn"),
                    trailing: FaIcon(
                      FontAwesomeIcons.linkedinIn,
                      color: Color(0xFF062161),
                    ),
                    onTap: () => launch(
                        "https://www.linkedin.com/in/doğukan-yolcuoğlu-3510701a4/"),
                  )
                ],
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

  _launchMail(String mail) async {
    final Uri _emailLaunchUri =
        Uri(scheme: 'mailto', path: mail, queryParameters: {'subject': ''});

    launch(_emailLaunchUri.toString());
  }
}
