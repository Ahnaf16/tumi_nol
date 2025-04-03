import 'package:flutter/material.dart';
import 'package:tumi_nol/_core/extensions/extra_ex.dart';
import 'package:tumi_nol/features/home/controller/yt_ctrl.dart';
import 'package:tumi_nol/features/home/repository/yt_downloader.dart';
import 'package:tumi_nol/features/home/view/player.dart';
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
        flags: const YoutubePlayerFlags(
          hideControls: true,
          enableCaption: false,
          disableDragSeek: true,
          autoPlay: false,
        ),
      ),
    );

    final playerState = useState<YoutubePlayerValue>(YoutubePlayerValue());
    // final sliderCtrl = useMemoized(() => ShadSliderController(initialValue: 0));

    void listener() {
      playerState.value = videoCtrl.value;
      // sliderCtrl.value = max(0, videoCtrl.value.position.inSeconds.toDouble());
    }

    useEffect(() {
      videoCtrl.addListener(listener);
      return () {
        videoCtrl.removeListener(listener);
        videoCtrl.dispose();
      };
    }, const []);

    final listCtrl = useCallback(() => ref.read(yTCtrlProvider.notifier));

    return ShadCard(
      padding: Pads.padding(padding: Insets.sm),
      backgroundColor: context.colors.background,
      child: Flex(
        direction: context.isTn ? Axis.vertical : Axis.horizontal,
        spacing: Insets.sm,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Player(videoCtrl: videoCtrl, thumbnailUrl: video.thumbnails.mediumResUrl),
          Column(
            spacing: Insets.xs,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(video.title, style: context.text.small),
              Text(video.author, style: context.text.muted.size(12)),
              if (video.publishDate != null) Text(video.publishDate!.timeAgo(), style: context.text.muted.size(12)),
              Text(playerState.value.playerState.name, style: context.text.muted.size(12)),

              Row(
                children: [
                  ShadButton(
                    enabled: playerState.value.isReady,
                    child: Icon(playerState.value.playerState.icon()),
                    onPressed: () {
                      final v = playerState.value.playerState;
                      if (v.isPlaying) videoCtrl.pause();
                      if (v.isPaused || v.isUnknown || v.isCued || v.isUnStarted) videoCtrl.play();
                      if (v.isEnded) videoCtrl.load(video.id.value);
                    },
                  ),
                  ShadButton(
                    enabled: playerState.value.isReady,
                    child: const Icon(LuIcons.square),
                    onPressed: () {
                      videoCtrl.seekTo(0.seconds);
                      videoCtrl.pause();
                    },
                  ),

                  ShadButton(
                    child: const Icon(LuIcons.trash2),
                    onPressed: () {
                      listCtrl().remove(video.id.value);
                    },
                  ),
                  ShadButton(
                    child: const Icon(LuIcons.download),
                    onPressed: () {
                      YtDownloader.instance.download(video.id.value);
                    },
                  ),
                ],
              ),
            ],
          ).conditionalFlexible(!context.isTn),
        ],
      ),
    );
  }
}
