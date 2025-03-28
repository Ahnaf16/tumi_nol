import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tumi_nol/main.export.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'yt_ctrl.g.dart';

@riverpod
class YTCtrl extends _$YTCtrl {
  String? submitUrl(String url) {
    if (!url.startsWith('https://www.youtube.com')) return 'Not youtube url';
    final videoId = url.split('/watch?v=').elementAtOrNull(1);
    if (videoId == null) return 'Not valid youtube url';
    if (state.contains(videoId)) return 'Already added';
    state = [videoId];
    return null;
  }

  void remove(String id) {
    state = state.where((e) => e != id).toList();
  }

  @override
  List<String> build() {
    return [];
  }
}

@riverpod
class YTMetaCtrl extends _$YTMetaCtrl {
  final _yt = YoutubeExplode();

  @override
  FutureOr<Video> build(String id) async {
    final video = await _yt.videos.get('https://youtube.com/watch?v=$id');

    return video;
  }
}

extension PlayerStateEx on PlayerState {
  bool get isPlaying => this == PlayerState.playing;
  bool get isPaused => this == PlayerState.paused;
  bool get isEnded => this == PlayerState.ended;
  bool get isUnStarted => this == PlayerState.unStarted;
  bool get isBuffering => this == PlayerState.buffering;
  bool get isCued => this == PlayerState.cued;
  bool get isUnknown => this == PlayerState.unknown;

  IconData icon() {
    return switch (this) {
      PlayerState.playing => LuIcons.pause,
      PlayerState.paused => LuIcons.play,
      PlayerState.ended => LuIcons.repeat,
      PlayerState.unStarted => LuIcons.play,
      PlayerState.buffering => LuIcons.pause,
      PlayerState.cued => LuIcons.play,
      PlayerState.unknown => LuIcons.play,
    };
  }
}
