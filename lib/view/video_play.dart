import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:video_player_app/App_Constant/app_constant.dart';
import 'package:video_player_app/Models/trending_video_model.dart';
import 'package:video_player_app/Widgets/icon_channel_ui.dart';
import 'package:video_player_app/view/comments.dart';

class VideoPlay extends StatefulWidget {
  final TrendingVideoModel videoList;
  const VideoPlay({super.key, required this.videoList});

  @override
  State<VideoPlay> createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  @override
  void initState() {
    initializeVideo();
    super.initState();
  }

  CustomVideoPlayerController? _customVideoPlayerController;

  void disposeOldController() {
    if (_customVideoPlayerController != null) {
      _customVideoPlayerController!.dispose();
      _customVideoPlayerController = null;
    }
  }

  void initializeVideo() {
    disposeOldController();
    VideoPlayerController videoPlayerController;
    videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(widget.videoList.manifest as String))
      ..initialize().then((value) {
        if (mounted) {
          setState(() {});
        }
      });
    _customVideoPlayerController = CustomVideoPlayerController(
        context: context, videoPlayerController: videoPlayerController);
  }

  @override
  void dispose() {
    _customVideoPlayerController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TrendingVideoModel videoList = widget.videoList;
    final controller = _customVideoPlayerController;
    DateTime dateTime = DateTime.parse(videoList.createdAt as String);
    String formattedString = DateFormat("MMM d, yyyy").format(dateTime);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              if (controller != null &&
                  controller.videoPlayerController.value.isInitialized)
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: CustomVideoPlayer(
                    customVideoPlayerController: controller,
                  ),
                )
              else
                Container(
                  height: Get.height * .250,
                  width: Get.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(videoList.thumbnail as String),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          vertical: Get.height * .008,
                          horizontal: Get.height * .015,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: Get.height * .004,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(113, 128, 150, .40),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          size: 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              Container(
                padding: EdgeInsets.only(
                  top: Get.height * .020,
                  left: Get.height * .020,
                  right: Get.height * .030,
                ),
                width: Get.width,
                child: Text(videoList.title as String),
              ),

              IconChannelUI(
                  videolist: videoList, formattedString: formattedString),
              const Divider(),

              //Comment Section
              GestureDetector(
                onTap: () {
                  Get.to(const CommentsWidget());
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.height * .020,
                    vertical: Get.height * .020,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Comments  75K"),
                          Column(
                            children: [
                              Icon(
                                Icons.keyboard_arrow_up,
                                size: Get.height * .016,
                              ),
                              Icon(Icons.keyboard_arrow_down,
                                  size: Get.height * .016),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: Get.height * .010),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Add Comment",
                            hintStyle: subtitleStyle,
                            suffixIcon: const Icon(
                              Icons.send,
                              color: greyColor,
                            ),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
