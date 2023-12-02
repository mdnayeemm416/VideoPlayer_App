import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:video_player_app/App_Constant/app_constant.dart';
import 'package:video_player_app/BLoC/bloc/trending_vieobloc_bloc.dart';

class TrendingVideos extends StatefulWidget {
  const TrendingVideos({super.key});

  @override
  State<TrendingVideos> createState() => _TrendingVideosState();
}

class _TrendingVideosState extends State<TrendingVideos> {
  final TrendingVieoblocBloc trendingVieoblocBloc = TrendingVieoblocBloc();

  @override
  void initState() {
    trendingVieoblocBloc.add(TreningVideosInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BlocConsumer<TrendingVieoblocBloc, TrendingVieoblocState>(
        listenWhen: (previuos,current)=>current is TrendingVieoActionState,
        buildWhen: (previuos,current)=> current is !TrendingVieoActionState,
        bloc: trendingVieoblocBloc,
        listener: (context, state) {
        
        },
        builder: (context, state) {
          
        },
      )
    );
  }
}
