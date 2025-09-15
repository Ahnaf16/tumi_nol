import 'package:tumi_nol/main.export.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class PlayListRepo with Repo {
  Future<List<PlaylistData>> playList() async {
    return [];
    // final box = await _getBox;
    // return box.values.toList();
  }

  Future<void> saveToPlayList(Playlist pl, String videoId) async {
    return;
    // final box = await _getBox;
    // final plData = PlaylistData.fromPlayList(pl, videoId);

    // await box.put(plData.id, plData);
  }

  Future<void> deletePlayList(String id) async {
    return;
    // final box = await _getBox;
    // await box.delete(id);
  }
}
