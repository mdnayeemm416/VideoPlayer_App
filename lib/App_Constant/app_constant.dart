import 'package:flutter/material.dart';
import 'package:get/get.dart';

const blackColor = Color(0xFF1A202C);
const greyColor = Color(0xFF718096);
const blueColor = Color(0xFF3898FC);

final headingStyle = TextStyle(
  fontSize: Get.height * .020,
  color: blackColor,
  fontWeight: FontWeight.w700,
);
final titleStyle = TextStyle(
  fontSize: Get.height * .015,
  color: blackColor,
  fontWeight: FontWeight.w600,
  fontFamilyFallback: const ['Mukta', 'Roboto'],
);
final subtitleStyle = TextStyle(
  fontSize: Get.height * .013,
  color: greyColor,
  fontWeight: FontWeight.w400,
);
final channelStyle = TextStyle(
  fontSize: Get.height * .014,
  color: blackColor,
  fontWeight: FontWeight.w500,
);
final timeStyle = TextStyle(
  fontSize: Get.height * .012,
  color: Colors.white,
  fontWeight: FontWeight.w500,
);
final subscribeStyle = TextStyle(
  fontSize: Get.height * .015,
  color: Colors.white,
  fontWeight: FontWeight.w500,
);
