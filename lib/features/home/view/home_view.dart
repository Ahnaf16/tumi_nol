import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tumi_nol/_widgets/hosted_image.dart';
import 'package:tumi_nol/features/home/controller/yt_ctrl.dart';
import 'package:tumi_nol/main.export.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videos = ref.watch(yTCtrlProvider);
    final ctrl = useCallback(() => ref.read(yTCtrlProvider.notifier));
    final txtCtrl = useTextEditingController(text: 'https://www.youtube.com/watch?v=9DO79KC_qoE');
    final inputError = useState<String?>(null);
    return Scaffold(
      appBar: AppBar(title: const Text('Tumi Nol')),
      body: Padding(
        padding: context.layout.pagePadding,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ShadInput(
                controller: txtCtrl,
                placeholder: const Text('Enter video url/Id'),
                trailing: ShadButton(
                  child: const Icon(LuIcons.arrowRight),
                  onPressed: () => inputError.value = ctrl().submitUrl(txtCtrl.text),
                ),
              ),
            ),

            if (inputError.value != null) ...[
              const SliverGap(Insets.sm),
              SliverToBoxAdapter(
                child: Text(inputError.value!, style: context.text.small.textColor(context.colors.destructive)),
              ),
            ],
            const SliverGap(Insets.sm),
            if (videos.isNotEmpty) SliverToBoxAdapter(child: Text('Videos', style: context.text.large)),
            const SliverGap(Insets.xs),
            SliverList.separated(
              itemCount: videos.length,
              separatorBuilder: (_, _) => const Gap(Insets.sm),
              itemBuilder: (context, index) {
                final video = videos[index];
                return YTPlayer(videoId: video);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class YTPlayer extends HookConsumerWidget {
  const YTPlayer({super.key, required this.videoId});
  final String videoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoCtrl = useMemoized(
      () => YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          hideControls: true,
          enableCaption: false,
          disableDragSeek: true,
          autoPlay: false,
        ),
      ),
    );

    final playerState = useState<YoutubePlayerValue>(YoutubePlayerValue());
    final sliderCtrl = useMemoized(() => ShadSliderController(initialValue: 0));

    void listener() {
      playerState.value = videoCtrl.value;
      sliderCtrl.value = max(0, videoCtrl.value.position.inSeconds.toDouble());
    }

    useEffect(() {
      videoCtrl.addListener(listener);
      return () {
        videoCtrl.removeListener(listener);
        videoCtrl.dispose();
      };
    }, const []);

    final videoData = ref.watch(yTMetaCtrlProvider(videoId));
    final listCtrl = useCallback(() => ref.read(yTCtrlProvider.notifier));

    return ShadCard(
      padding: Pads.padding(padding: Insets.sm),
      backgroundColor: context.colors.background,
      child: videoData.when(
        error: (e, _) => Text(e.toString()),
        loading: () => const Center(child: SizedBox(width: 200, child: ShadProgress(minHeight: 6))),
        data: (video) {
          final duration = playerState.value.metaData.duration;

          return Row(
            spacing: Insets.sm,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  ShadDecorator(
                    decoration: ShadDecoration(
                      border: ShadBorder.all(color: context.colors.border, width: 3, radius: context.theme.radius),
                    ),

                    child: ClipRRect(
                      borderRadius: context.theme.radius,
                      child:
                          playerState.value.playerState.isEnded
                              ? HostedImage(width: 300, NetImg(video.thumbnails.mediumResUrl))
                              : YoutubePlayer(width: 300, controller: videoCtrl),
                    ),
                  ),
                  Row(
                    spacing: Insets.sm,
                    children: [
                      Text(playerState.value.position.remaining(duration).format(), style: context.text.muted.size(10)),
                      ShadSlider(
                        enabled: playerState.value.isReady,
                        max: duration.inSeconds.toDouble(),
                        controller: sliderCtrl,
                        thumbRadius: 0,
                        trackHeight: 3,
                        onChanged: (value) => videoCtrl.seekTo(value.toInt().seconds),
                      ),
                    ],
                  ),
                ],
              ),
              Flexible(
                child: Column(
                  spacing: Insets.xs,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(video.title, style: context.text.small),
                    Text(video.author, style: context.text.muted.size(12)),
                    if (video.publishDate != null)
                      Text(video.publishDate!.timeAgo(), style: context.text.muted.size(12)),
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
                            // if (v.isEnded) videoCtrl.reload();
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
                        ShadButton(child: const Icon(LuIcons.trash2), onPressed: () => listCtrl().remove(videoId)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
