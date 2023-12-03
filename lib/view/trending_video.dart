import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:video_player_app/App_Constant/app_constant.dart';
import 'package:video_player_app/BLoC/TrendingVideoBLoC/trending_video_bloc.dart';
import 'package:intl/intl.dart';
import 'package:video_player_app/view/video_play.dart';

class TrendingVideos extends StatefulWidget {
  const TrendingVideos({super.key});

  @override
  State<TrendingVideos> createState() => _TrendingVideosState();
}

class _TrendingVideosState extends State<TrendingVideos> {
  final TrendingVideoBloc trendingVideoBloc = TrendingVideoBloc();

  @override
  void initState() {
    trendingVideoBloc.add(TrendingVideosInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: BlocConsumer<TrendingVideoBloc, TrendingVideoState>(
        listenWhen: (previous, current) => current is TrendingVideoActionState,
        buildWhen: (previous, current) => current is! TrendingVideoActionState,
        bloc: trendingVideoBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case TrendingVideoSuccessState:
              final successState = state as TrendingVideoSuccessState;
              return Padding(
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
                            itemCount: successState.trendingVideos.length,
                            itemBuilder: (context, index) {
                              // parse data & time to format

                              DateTime dateTime = DateTime.parse(successState
                                  .trendingVideos[index].createdAt as String);
                              String formattedString =
                                  DateFormat("MMM d, yyyy").format(dateTime);
                              return GestureDetector(
                                onTap: () {
                                  navigator!.push(MaterialPageRoute(
                                      builder: (_) => VideoPlay(
                                            videoList: successState
                                                .trendingVideos[index],
                                          )));
                                },
                                child: Container(
                                  margin:
                                      EdgeInsets.only(top: Get.height * .018),
                                  padding: EdgeInsets.only(
                                      bottom: Get.height * .016),
                                  width: Get.width,
                                  child: Column(
                                    children: [
                                      // thumbnail image set
                                      Container(
                                        height: Get.height * .220,
                                        width: Get.width,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(successState
                                                    .trendingVideos[index]
                                                    .thumbnail as String),
                                                fit: BoxFit.fill)),
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            margin: EdgeInsets.all(
                                                Get.height * .008),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: Get.height * .004),
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Text(
                                              successState.trendingVideos[index]
                                                  .duration as String,
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
                                                  child: CircleAvatar(
                                                    backgroundImage:
                                                        NetworkImage(successState
                                                                .trendingVideos[
                                                                    index]
                                                                .channelImage
                                                            as String),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Get.height * .012,
                                                ),
                                                SizedBox(
                                                  // height: Get.height * .04,
                                                  width: Get.width * .66,
                                                  child: Text(
                                                    successState
                                                        .trendingVideos[index]
                                                        .title as String,
                                                    style: titleStyle,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Icon(
                                              Icons.more_vert_sharp,
                                              size: 24,
                                              color: greyColor,
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
                                              "${successState.trendingVideos[index].viewers as String} views",
                                              style: subtitleStyle,
                                            ),
                                            SizedBox(
                                              width: Get.width * .070,
                                            ),
                                            Text(
                                              formattedString,
                                              style: subtitleStyle,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }))
                  ],
                ),
              );

            default:
              return const SizedBox();
          }
        },
      )),
    );
  }
}
