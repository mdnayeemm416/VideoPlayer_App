import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_app/App_Constant/app_constant.dart';

class TrendingVideos extends StatefulWidget {
  const TrendingVideos({super.key});

  @override
  State<TrendingVideos> createState() => _TrendingVideosState();
}

class _TrendingVideosState extends State<TrendingVideos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Get.height * .018),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Trending Videos",
              style: headingStyle,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (comtext, index) {
                      return Container(
                        margin: EdgeInsets.only(top: Get.height * .018),
                        padding: EdgeInsets.only(bottom: Get.height * .016),
                        width: Get.width,
                        child: Column(
                          children: [
                            Container(
                              height: Get.height * .192,
                              width: Get.width,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/thamnail.jpg"),
                                      fit: BoxFit.fill)),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  margin: EdgeInsets.all(Get.height * .008),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Get.height * .004),
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "3:40",
                                    style: timeStyle,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Get.height * .017,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Get.height * .017),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: Get.height * .04,
                                        child: const CircleAvatar(
                                          backgroundImage: AssetImage(
                                              "assets/channelImage.jpg"),
                                        ),
                                      ),
                                      SizedBox(
                                        width: Get.height * .012,
                                      ),
                                      SizedBox(
                                        // height: Get.height * .04,
                                        width: 250,
                                        child: Text(
                                          "চোখের-বদ-নজর-থেকে-বাচার-উপায়-__-আবু-ত্বহা-মুহাম্মদ-আদনান-__-বাংলা-ওয়াজ-_-Abu-Taha-Muhammed-adnan-waz",
                                          style: titleStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.more_vert_sharp,
                                    size: 24,
                                    color: greycolor,
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: Get.width * .165,
                                  top: Get.height * .008),
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
                            )
                          ],
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
