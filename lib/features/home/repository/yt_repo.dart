import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YtRepo {
  final _yt = YoutubeExplode();

  Future<Channel> getChannel(String channelId) async {
    return _yt.channels.get(channelId);
  }

  Future<Playlist> getPlaylist(String playlistId) async {
    return _yt.playlists.get(playlistId);
  }

  Future<Video> getVideo(String videoId) async {
    return _yt.videos.get(videoId);
  }

  Future<CommentsList?> getComments(Video v) async {
    return _yt.videos.comments.getComments(v);
  }

  Stream<Video> getPlaylistVideos(String playlistId) async* {
    yield* _yt.playlists.getVideos(playlistId);
  }
}
