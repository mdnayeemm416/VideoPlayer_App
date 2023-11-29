import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_app/App_Constant/app_constant.dart';

class Iconwidget extends StatelessWidget {
  final IconData icon;
  final String text;
  const Iconwidget({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Get.height * .008),
      height: Get.height * .05,
      decoration: BoxDecoration(
          border: Border.all(color: greycolor),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Icon(
            icon,
            size: Get.height * .024,
            color: greycolor,
          ),
          Text(
            text,
            style: subtitleStyle,
          )
        ],
      ),
    );
  }
}
