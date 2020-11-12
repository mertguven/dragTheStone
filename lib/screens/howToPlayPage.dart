import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class HowToPlayPage extends StatelessWidget {
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
          Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 120),
            height: MediaQuery.of(context).size.height,
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
              "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. Beşyüz yıl boyunca varlığını sürdürmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sıçramıştır. 1960'larda Lorem Ipsum pasajları da içeren Letraset yapraklarının yayınlanması ile ve yakın zamanda Aldus PageMaker gibi Lorem Ipsum sürümleri içeren masaüstü yayıncılık yazılımları ile popüler olmuştur.",
              style: TextStyle(
                color: Color(0xFF062161),
                fontSize: 16,
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
    );
  }
}
