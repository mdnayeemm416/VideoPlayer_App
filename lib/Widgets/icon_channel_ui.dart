import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_app/App_Constant/app_constant.dart';
import 'package:video_player_app/Models/trending_video_model.dart';
import 'package:video_player_app/Widgets/icon_widget.dart';
import 'package:video_player_app/view/Channel.dart';

class IconChannelUI extends StatelessWidget {
  final TrendingVideoModel videolist;
  final String formattedString;
  const IconChannelUI(
      {super.key, required this.videolist, required this.formattedString});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Get.height * .010,
        horizontal: Get.height * .020,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "${videolist.viewers} views",
                style: subtitleStyle,
              ),
              SizedBox(
                width: Get.width * .070,
              ),
              Text(
                formattedString,
                style: subtitleStyle,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: Get.height * .020),
            child: const Row(
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
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(const ChennelWidget());
            },
            child: Padding(
              padding: EdgeInsets.only(top: Get.height * .020),
              child: Row(
                children: [
                  SizedBox(
                    height: Get.height * .04,
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage(videolist.channelImage as String),
                    ),
                  ),
                  SizedBox(
                    width: Get.height * .012,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        videolist.channelName as String,
                        style: channelStyle,
                      ),
                      Text(
                        "${videolist.channelSubscriber} Subscribers",
                        style: subtitleStyle,
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Get.height * .014,
                      vertical: Get.height * .008,
                    ),
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.circular(
                        Get.height * .005,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 16,
                        ),
                        Text(
                          "Subscribers",
                          style: subscribeStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
