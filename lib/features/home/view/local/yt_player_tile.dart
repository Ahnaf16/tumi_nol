import 'package:flutter/material.dart';
import 'package:tumi_nol/features/home/controller/yt_ctrl.dart';
import 'package:tumi_nol/features/home/repository/yt_downloader.dart';
import 'package:tumi_nol/features/home/view/local/player.dart';
import 'package:tumi_nol/main.export.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YTPlayerTile extends HookConsumerWidget {
  const YTPlayerTile({super.key, required this.video});
  final Video video;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoCtrl = useMemoized(
      () => YoutubePlayerController(
        initialVideoId: video.id.value,
        flags: const YoutubePlayerFlags(enableCaption: false, hideControls: true, autoPlay: false),
      ),
    );

    final listCtrl = useCallback(() => ref.read(yTCtrlProvider.notifier));

    return ShadCard(
      backgroundColor: context.colors.background,
      child: Flex(
        direction: context.isTn ? Axis.vertical : Axis.horizontal,
        spacing: Insets.sm,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 300,
            child: Player(
              videoCtrl: videoCtrl,
              ctrlBuilder: (videoCtrl, v) {
                return Center(
                  child: Stack(
                    children: [
                      Center(
                        child: ShadButton(
                          height: 50,
                          width: 50,
                          backgroundColor: context.colors.primary.op8,
                          decoration: ShadDecoration(border: ShadBorder.all(radius: Corners.circleBorder)),
                          onPressed: () {
                            final s = v.playerState;
                            if (s.isPlaying || s.isBuffering) videoCtrl.pause();
                            if (s.isPaused) videoCtrl.play();
                            if (s.isUnknown || s.isCued || s.isUnStarted) videoCtrl.play();
                            if (s.isEnded) videoCtrl.load(v.metaData.videoId);
                          },
                          child: Icon(v.playerState.icon()),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 5,
                        right: 5,
                        child: VideoProgressCtrl(
                          videoCtrl: videoCtrl,
                          videoDuration: v.metaData.duration,
                          hidePositionText: true,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          ValueListenableBuilder(
            valueListenable: videoCtrl,
            builder: (context, v, _) {
              return Column(
                spacing: Insets.xs,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(video.title, style: context.text.small),
                  Text(video.author, style: context.text.muted.size(12)),
                  if (video.publishDate != null) Text(video.publishDate!.timeAgo(), style: context.text.muted.size(12)),
                  Text((video.duration ?? v.metaData.duration).format(), style: context.text.muted.size(12)),
                  const Gap(Insets.xs),
                  Row(
                    spacing: Insets.med,
                    children: [
                      ShadButton(
                        child: const Icon(LuIcons.download),
                        onPressed: () => YtDownloader.instance.download(video.id.value),
                      ),
                      ShadButton(child: const Icon(LuIcons.trash2), onPressed: () => listCtrl().remove(video.id.value)),
                    ],
                  ),
                ],
              ).conditionalFlexible(!context.isTn);
            },
          ),
        ],
      ),
    );
  }
}
