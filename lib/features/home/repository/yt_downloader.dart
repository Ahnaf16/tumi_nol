import 'package:tumi_nol/_core/logging/cat.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YtDownloader {
  YtDownloader._();
  static YtDownloader get _instance => YtDownloader._();
  static YtDownloader get instance => _instance;

  final _yt = YoutubeExplode();

  Future<void> download(String videoId) async {
    try {
      // final dir = await getDirectoryPath();
      final video = await _yt.videos.get(videoId);
      final manifest = await _yt.videos.streams.getManifest(videoId);
      // final streamInfo = manifest.muxed.withHighestBitrate();

      cat(manifest);

      // final stream = _yt.videos.streamsClient.get(streamInfo);
      // final path = join(dir, '${video.title}.mp4');
      // final file = File(path);
      // final output = file.openWrite();
      // await stream.pipe(output);
      // await output.flush();
      // await output.close();
    } catch (e, s) {
      catErr('download error : $videoId', e, s);
    }
  }
}
