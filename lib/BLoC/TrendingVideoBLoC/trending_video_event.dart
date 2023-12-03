part of 'trending_video_bloc.dart';

@immutable
sealed class TrendingVideoEvent {}

class TrendingVideosInitialFetchEvent extends TrendingVideoEvent{}

class TrendingVideoTitleClickEvent extends TrendingVideoEvent{}
