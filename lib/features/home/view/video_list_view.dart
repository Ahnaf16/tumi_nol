import 'package:flutter/material.dart';
import 'package:super_sliver_list/super_sliver_list.dart';
import 'package:tumi_nol/features/Playlist/controller/playlist_ctrl.dart';
import 'package:tumi_nol/features/home/view/local/yt_player_tile.dart';
import 'package:tumi_nol/main.export.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YTPlayListView extends HookConsumerWidget {
  const YTPlayListView({super.key, required this.videos, required this.playlist});

  final List<Video> videos;
  final Playlist playlist;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = useState(false);
    return Scaffold(
      appBar: AppBar(title: Text(playlist.title)),
      floatingActionButton: ShadButton(
        height: 45,
        padding: Pads.xs(),
        onPressed: () async {
          loading.toggle();
          final ctrl = ref.read(playListCtrlProvider.notifier);
          await ctrl.saveToPlayList(playlist.id.value, videos.first.id.value);
          loading.toggle();
        },
        leading: loading.value ? const Loading() : const Icon(LuIcons.plus),
        child: const Text('Add to playlist'),
      ),
      body: Padding(
        padding: context.layout.pagePadding,
        child: SuperListView.separated(
          padding: context.layout.pagePadding,
          itemCount: videos.length,
          separatorBuilder: (_, _) => const Gap(Insets.sm),
          itemBuilder: (context, index) {
            final video = videos[index];
            return YTPlayerTile(video: video);
          },
        ),
      ),
    );
  }
}
