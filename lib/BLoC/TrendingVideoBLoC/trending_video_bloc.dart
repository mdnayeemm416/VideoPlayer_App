import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:video_player_app/Models/trending_video_model.dart';
part 'trending_video_event.dart';
part 'trending_video_state.dart';

class TrendingVideoBloc extends Bloc<TrendingVideoEvent, TrendingVideoState> {
  TrendingVideoBloc() : super(TrendingVideoInitial()) {
    on<TrendingVideosInitialFetchEvent>(trendingVideosInitialFetchEvent);
    on<TrendingVideoTitleClickEvent>(trendingVideoTitleClickEvent);
  }

  Future<FutureOr<void>> trendingVideosInitialFetchEvent(
      TrendingVideosInitialFetchEvent event,
      Emitter<TrendingVideoState> emit) async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse('https://test-ximit.mahfil.net/api/trending-video/1?page=1'),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        List<dynamic> results = jsonResponse['results'];
        List<TrendingVideoModel> trendingVideos = results
            .map((videoJson) => TrendingVideoModel.fromJson(videoJson))
            .toList();

        emit(TrendingVideoSuccessState(trendingVideos: trendingVideos));
      } else {
        print('Failed to load videos. Status code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      client.close();
    }
  }

  FutureOr<void> trendingVideoTitleClickEvent(
      TrendingVideoTitleClickEvent event, Emitter<TrendingVideoState> emit) {}
}
