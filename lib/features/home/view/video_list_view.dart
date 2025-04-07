import 'package:flutter/material.dart';
import 'package:super_sliver_list/super_sliver_list.dart';
import 'package:tumi_nol/features/home/view/local/y_t_player_tile.dart';
import 'package:tumi_nol/main.export.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YTPlayListView extends HookConsumerWidget {
  const YTPlayListView({super.key, required this.videos, this.playlist});

  final List<Video> videos;
  final Playlist? playlist;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(playlist?.title ?? 'Tumi Nol')),
      body: Padding(
        padding: context.layout.pagePadding,
        child: CustomScrollView(
          slivers: [
            SuperSliverList.separated(
              itemCount: videos.length,
              separatorBuilder: (_, _) => const Gap(Insets.sm),
              itemBuilder: (context, index) {
                final video = videos[index];
                return YTPlayerTile(video: video);
              },
            ),
          ],
        ),
      ),
    );
  }
}
