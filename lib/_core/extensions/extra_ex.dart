import 'package:flutter/widgets.dart';
import 'package:tumi_nol/main.export.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
