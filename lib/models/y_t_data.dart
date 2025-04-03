import 'package:flutter/widgets.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YTData {
  final Playlist? playlist;
  final List<Video> videos;

  YTData({this.playlist, this.videos = const []});

  YTData copyWith({ValueGetter<Playlist?>? playlist, List<Video>? videos}) {
    return YTData(playlist: playlist != null ? playlist() : this.playlist, videos: videos ?? this.videos);
  }

  YTData addVideo(Video video) {
    return copyWith(videos: [...videos, video]);
  }

  YTData removeVideo(String id) {
    return copyWith(videos: videos.where((e) => e.id.value != id).toList());
  }

  bool get isPlaylist => playlist != null;

  bool get isNotEmpty => videos.isNotEmpty;
  int get length => videos.length;
}
