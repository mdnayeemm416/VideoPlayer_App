import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_app/App_Constant/app_constant.dart';
import 'package:video_player_app/Widgets/icon_widget.dart';

class VideoPlay extends StatefulWidget {
  const VideoPlay({super.key});

  @override
  State<VideoPlay> createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: Get.height * .211,
          width: Get.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/thamnail.jpg"), fit: BoxFit.fill)),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: Get.height * .008, horizontal: Get.height * .015),
                padding: EdgeInsets.symmetric(horizontal: Get.height * .004),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(113, 128, 150, .40),
                    borderRadius: BorderRadius.circular(5)),
                child: const Icon(
                  Icons.arrow_back,
                  size: 32,
                  color: Colors.white,
                )),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
              top: Get.height * .020,
              left: Get.height * .020,
              right: Get.height * .030,
              bottom: Get.height * .010),
          width: Get.width,
          child: Text(
              "চোখের-বদ-নজর-থেকে-বাচার-উপায়-__-আবু-ত্বহা-মুহাম্মদ-আদনান-__-বাংলা-ওয়াজ-_-Abu-Taha-Muhammed-adnan-waz"),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Text(
                "53,245 views",
                style: subtitleStyle,
              ),
              SizedBox(
                width: Get.width * .070,
              ),
              Text(
                "Feb 21, 2021",
                style: subtitleStyle,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(Get.height * .020),
          child: const Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Iconwidget(
                  icon: Icons.favorite_border,
                  text: "MASH ALLAH (12K)",
                ),
                Iconwidget(
                  icon: Icons.thumb_up_off_alt_outlined,
                  text: "LIKE (12K)",
                ),
                Iconwidget(
                  icon: Icons.favorite_border,
                  text: "SHARE",
                ),
                Iconwidget(
                  icon: Icons.favorite_border,
                  text: "REPORT",
                )
              ],
            )
          ]),
        )
      ]),
    );
  }
}
