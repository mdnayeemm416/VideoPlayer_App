class TrendingVideoModel {
  final String? thumbnail;
  final int? id;
  final String? title;
  final String? dateAndTime;
  final String? slug;
  final String? createdAt;
  final String? manifest;
  final int? liveStatus;
  final dynamic liveManifest;
  final bool? isLive;
  final String? channelImage;
  final String? channelName;
  final dynamic channelUsername;
  final bool? isVerified;
  final String? channelSlug;
  final String? channelSubscriber;
  final int? channelId;
  final String? type;
  final String? viewers;
  final String? duration;

  TrendingVideoModel({
    this.thumbnail,
    this.id,
    this.title,
    this.dateAndTime,
    this.slug,
    this.createdAt,
    this.manifest,
    this.liveStatus,
    this.liveManifest,
    this.isLive,
    this.channelImage,
    this.channelName,
    this.channelUsername,
    this.isVerified,
    this.channelSlug,
    this.channelSubscriber,
    this.channelId,
    this.type,
    this.viewers,
    this.duration,
  });

  factory TrendingVideoModel.fromJson(Map<String, dynamic> json) {
    return TrendingVideoModel(
      thumbnail: json['thumbnail'],
      id: json['id'],
      title: json['title'],
      dateAndTime: json['date_and_time'],
      slug: json['slug'],
      createdAt: json['created_at'],
      manifest: json['manifest'],
      liveStatus: json['live_status'],
      liveManifest: json['live_manifest'],
      isLive: json['is_live'],
      channelImage: json['channel_image'],
      channelName: json['channel_name'],
      channelUsername: json['channel_username'],
      isVerified: json['is_verified'],
      channelSlug: json['channel_slug'],
      channelSubscriber: json['channel_subscriber'],
      channelId: json['channel_id'],
      type: json['type'],
      viewers: json['viewers'],
      duration: json['duration'],
    );
  }
}

class VideoList {
  final Map<String, dynamic> links;
  final int total;
  final int page;
  final int pageSize;
  final List<TrendingVideoModel> results;

  VideoList({
    required this.links,
    required this.total,
    required this.page,
    required this.pageSize,
    required this.results,
  });

  factory VideoList.fromJson(Map<String, dynamic> json) {
    return VideoList(
      links: json['links'],
      total: json['total'],
      page: json['page'],
      pageSize: json['page_size'],
      results: List<TrendingVideoModel>.from(
        json['results'].map(
          (videoJson) => TrendingVideoModel.fromJson(videoJson),
        ),
      ),
    );
  }
}
