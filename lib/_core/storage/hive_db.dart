import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:tumi_nol/_core/storage/hive_registrar.g.dart';
import 'package:tumi_nol/main.export.dart';

part 'hive_db.g.dart';

@GenerateAdapters([AdapterSpec<VideoData>(), AdapterSpec<PlaylistData>()])
class HiveDb {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapters();
    await Hive.openBox<PlaylistData>(playList);
  }

  static const playList = 'playlist';
  static playListVideos(String id) => 'playlist_$id';
}
