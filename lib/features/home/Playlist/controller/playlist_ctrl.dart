import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tumi_nol/features/home/Playlist/repository/playlist_repo.dart';
import 'package:tumi_nol/features/home/repository/yt_repo.dart';
import 'package:tumi_nol/main.export.dart';

part 'playlist_ctrl.g.dart';

@riverpod
class PlayListCtrl extends _$PlayListCtrl {
  final _repo = locate<PlayListRepo>();
  final _yt = locate<YtRepo>();

  @override
  FutureOr<List<PlaylistData>> build() {
    return _repo.playList();
  }

  Future<void> saveToPlayList(String id, String videoId) async {
    final pl = await _yt.getPlaylist(id);
    await _repo.saveToPlayList(pl, videoId);
    Toast.show('Playlist saved');
    ref.invalidateSelf();
  }

  Future<void> deletePlayList(String id) async {
    await _repo.deletePlayList(id);
    Toast.show('Playlist deleted');
    ref.invalidateSelf();
  }
}
