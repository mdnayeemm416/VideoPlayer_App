// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'trending_video_bloc.dart';

@immutable
sealed class TrendingVideoState {}

sealed class TrendingVideoActionState extends TrendingVideoState{}

final class TrendingVideoInitial extends TrendingVideoState {}

class TrendingVideoSuccessState extends TrendingVideoState {
  final List<TrendingVideoModel> trendingVideos;
  TrendingVideoSuccessState({
    required this.trendingVideos,
  });
}
