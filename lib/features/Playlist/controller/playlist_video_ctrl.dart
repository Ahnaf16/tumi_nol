import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tumi_nol/features/Playlist/repository/playlist_repo.dart';
import 'package:tumi_nol/main.export.dart';

part 'playlist_video_ctrl.g.dart';

@riverpod
class PlayListVideoCtrl extends _$PlayListVideoCtrl {
  final _repo = locate<PlayListRepo>();
  @override
  FutureOr<VideoData> build(String id) {
    return Future.error('UnimplementedError');
  }
}
