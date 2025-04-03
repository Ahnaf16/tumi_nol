import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tumi_nol/features/home/repository/yt_repo.dart';
import 'package:tumi_nol/main.export.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

part 'yt_ctrl.g.dart';

@riverpod
class YTCtrl extends _$YTCtrl {
  final _repo = locate<YtRepo>();

  Future<YTData?> submitUrl(String url) async {
    if (!url.startsWith('https://www.youtube.com')) {
      Toast.showErr('Not youtube url');
      return null;
    }

    final extract = _extractYouTubeId(url);
    if (extract == null) {
      Toast.showErr('Not a valid youtube url');
      return null;
    }

    if (extract.isPlaylist) {
      final playlist = await _repo.getPlaylist(extract.id);

      state = state.copyWith(playlist: () => playlist);

      await for (var video in _repo.getPlaylistVideos(playlist.id.value)) {
        state = state.addVideo(video);
      }
    } else {
      final video = await _repo.getVideo(extract.id);
      state = YTData(videos: [video]);
    }

    return state;
  }

  ({bool isPlaylist, String id})? _extractYouTubeId(String url) {
    final regExp = RegExp(r'(?:youtu\.be/|youtube\.com/(?:.*v=|.*\/|playlist\?list=))([a-zA-Z0-9_-]{11,})');

    final match = regExp.firstMatch(url);
    if (match == null) return null;

    final id = match.group(1)!;
    final isPlaylist = url.contains('playlist?list=');

    return (isPlaylist: isPlaylist, id: id);
  }

  void remove(String id) {
    state = state.removeVideo(id);
  }

  @override
  YTData build() {
    return YTData();
  }
}

@riverpod
FutureOr<Channel> channelDetails(Ref ref, String channelId) async {
  final repo = locate<YtRepo>();
  return repo.getChannel(channelId);
}
