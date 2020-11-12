import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Lottie.asset(
            "assets/home_page_background_animation.json",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height / 1.5,
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
                  Text(
                    "Mert Güven",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "+905073791004",
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: Icon(
                      Icons.phone,
                      color: Colors.lightGreen,
                    ),
                    onTap: () => launch('tel: +905073791004'),
                  ),
                  ListTile(
                    title: Text(
                      "mertguven789@gmail.com",
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: Icon(
                      Icons.mail_sharp,
                      color: Color(0xFF062161),
                    ),
                    onTap: () => _launchMail("mertguven789@gmail.com"),
                  ),
                  ListTile(
                    title: Text("LinkedIn Profile"),
                    trailing: FaIcon(
                      FontAwesomeIcons.linkedinIn,
                      color: Color(0xFF062161),
                    ),
                    onTap: () => launch(
                        "https://www.linkedin.com/in/mert-güven-8a0006177/"),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Doğukan Yolcuoğlu",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  ListTile(
                    title: Text("+905347496916"),
                    trailing: Icon(
                      Icons.phone,
                      color: Colors.lightGreen,
                    ),
                    onTap: () => launch('tel: +905347496916'),
                  ),
                  ListTile(
                    title: Text(
                      "dodo.bjk.98@hotmail.com",
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: Icon(
                      Icons.mail_sharp,
                      color: Color(0xFF062161),
                    ),
                    onTap: () => _launchMail('dodo.bjk.98@hotmail.com'),
                  ),
                  ListTile(
                    title: Text("LinkedIn Profile"),
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
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
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
          ),
        ],
      ),
    );
  }

  _launchMail(String mail) async {
    final Uri _emailLaunchUri =
        Uri(scheme: 'mailto', path: mail, queryParameters: {'subject': ''});

    launch(_emailLaunchUri.toString());
  }
}
