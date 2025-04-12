import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:tumi_nol/main.export.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class PlaylistData {
  const PlaylistData({
    required this.id,
    required this.title,
    required this.titleOriginal,
    required this.author,
    required this.videoCount,
    required this.thumbnailUrl,
    required this.thumbnailFile,
    required this.created,
  });

  final String id;
  final String title;
  final String titleOriginal;
  final String author;
  final int videoCount;
  final String thumbnailUrl;
  final String? thumbnailFile;
  final DateTime created;

  Img get thumbnail {
    final netImg = NetImg(thumbnailUrl);
    if (thumbnailFile == null) return netImg;
    if (!File(thumbnailFile!).existsSync()) return netImg;
    return FileImg(thumbnailFile!);
  }

  static PlaylistData fromPlayList(Playlist pl, String videoId) {
    return PlaylistData(
      id: pl.id.value,
      title: pl.title,
      titleOriginal: pl.title,
      author: pl.author,
      videoCount: pl.videoCount ?? 0,
      thumbnailUrl: ThumbnailSet(videoId).mediumResUrl,
      thumbnailFile: null,
      created: dateNow.run(),
    );
  }
}
