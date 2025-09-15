import 'package:flutter/material.dart';
import 'package:tumi_nol/features/Playlist/controller/playlist_ctrl.dart';
import 'package:tumi_nol/main.export.dart';

class PlaylistView extends HookConsumerWidget {
  const PlaylistView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playlistData = ref.watch(playListCtrlProvider);
    final ctrl = useCallback(() => ref.read(playListCtrlProvider.notifier));
    final sml = context.breakpoint < context.theme.breakpoints.md;

    return Scaffold(
      appBar: AppBar(title: const Text('Playlist')),
      body: Padding(
        padding: context.layout.pagePadding,
        child: playlistData.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, s) => Center(child: Text(err.toString())),
          data: (playlists) {
            if (playlists.isEmpty) {
              return const Center(
                child: SizedBox(
                  width: 500,
                  child: ShadAlert.destructive(
                    iconData: LuIcons.triangleAlert,
                    title: Text('No playlist found'),
                    description: Text('Create a playlist and add a new one'),
                  ),
                ),
              );
            }
            return ListView.builder(
              itemCount: playlists.length,
              itemBuilder: (context, index) {
                final pl = playlists[index];
                return ShadCard(
                  child: Flex(
                    direction: sml ? Axis.vertical : Axis.horizontal,
                    spacing: Insets.med,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HostedImage(pl.thumbnail, width: sml ? context.width : 300),
                      Column(
                        spacing: Insets.sm,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(pl.title, style: context.text.large),
                          Row(
                            spacing: Insets.sm,
                            children: [
                              Text(pl.author),
                              ShadCard(
                                height: 8,
                                width: 8,
                                padding: Pads.zero,
                                backgroundColor: context.colors.foreground.op5,
                              ),
                              Text(pl.createdAt.timeAgo()),
                            ],
                          ),
                          Text('${pl.videoCount} videos'),
                          Row(
                            spacing: Insets.sm,
                            children: [
                              ShadButton.outline(child: const Icon(LuIcons.play), onPressed: () {}),
                              ShadButton.outline(child: const Icon(LuIcons.shuffle), onPressed: () {}),
                              ShadButton.outline(
                                child: const Icon(LuIcons.trash),
                                onPressed: () => ctrl().deletePlayList(pl.id),
                              ),
                            ],
                          ),
                        ],
                      ).conditionalExpanded(!sml),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
