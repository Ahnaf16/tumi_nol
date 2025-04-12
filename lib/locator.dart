import 'package:get_it/get_it.dart';
import 'package:tumi_nol/_core/_core.dart';
import 'package:tumi_nol/features/home/Playlist/repository/playlist_repo.dart';
import 'package:tumi_nol/features/home/repository/yt_repo.dart';

final locate = GetIt.instance;

FVoid setupLocator() async {
  locate.registerSingletonIfAbsent(() => YtRepo());
  locate.registerSingletonIfAbsent(() => PlayListRepo());
}
