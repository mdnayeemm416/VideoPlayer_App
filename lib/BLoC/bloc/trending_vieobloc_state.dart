// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'trending_vieobloc_bloc.dart';

@immutable
sealed class TrendingVieoblocState {}

sealed class TrendingVieoActionState extends TrendingVieoblocState{}

final class TrendingVieoblocInitial extends TrendingVieoblocState {}

class TrendingVideoSuccessState extends TrendingVieoblocState {
  final List<TrendingVideoModel> trendingVideos;
  TrendingVideoSuccessState({
    required this.trendingVideos,
  });
}
