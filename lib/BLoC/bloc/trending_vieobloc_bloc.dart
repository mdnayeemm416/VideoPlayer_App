import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:video_player_app/Models/trending_video_model.dart';
part 'trending_vieobloc_event.dart';
part 'trending_vieobloc_state.dart';

class TrendingVieoblocBloc
    extends Bloc<TrendingVieoblocEvent, TrendingVieoblocState> {
  TrendingVieoblocBloc() : super(TrendingVieoblocInitial()) {
    on<TreningVideosInitialFetchEvent>(treningVideosInitialFetchEvent);
  }

  Future<FutureOr<void>> treningVideosInitialFetchEvent(
      TreningVideosInitialFetchEvent event,
      Emitter<TrendingVieoblocState> emit) async {
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
}
