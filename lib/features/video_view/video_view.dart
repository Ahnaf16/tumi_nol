import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tumi_nol/_core/extensions/extra_ex.dart';
import 'package:tumi_nol/_styled_widgets/count_separator.dart';
import 'package:tumi_nol/_styled_widgets/deco_container.dart';
import 'package:tumi_nol/features/home/controller/yt_ctrl.dart';
import 'package:tumi_nol/main.export.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YTVideoView extends HookConsumerWidget {
  const YTVideoView({super.key, required this.video, this.playlistId});

  final Video video;
  final String? playlistId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerWidth = useState(context.width);

    final channelData = ref.watch(channelDetailsProvider(video.channelId.value));
    final videoCtrl = useMemoized(
      () => YoutubePlayerController(
        initialVideoId: video.id.value,
        flags: const YoutubePlayerFlags(enableCaption: false, hideControls: true, autoPlay: false),
      ),
    );

    useEffect(() {
      return () => videoCtrl.dispose();
    }, const []);

    final channel = channelData.when(data: (channel) => channel, error: (err, s) => null, loading: () => null);

    return Scaffold(
      appBar: AppBar(
        title: Text(video.title),
        leadingWidth: 50,
        leading: UnconstrainedBox(
          child: ShadButton.ghost(
            height: 30,
            width: 30,
            padding: Pads.zero,
            onPressed: () => context.pop(),
            child: const Icon(LuIcons.chevronLeft, size: 23),
          ),
        ),
      ),
      floatingActionButton: ShadButton(
        decoration: ShadDecoration(border: ShadBorder.all(radius: Corners.circleBorder)),
        height: 45,
        width: 45,
        padding: Pads.xs(),
        onPressed: () {},
        child: const Icon(LuIcons.download),
      ),
      body: Row(
        children: [
          SizedBox(
            width: playlistId == null ? context.width : playerWidth.value,
            child: SingleChildScrollView(
              physics: kScrollPhysics,
              padding: context.layout.pagePadding.copyWith(top: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ShadDecorator(
                      decoration: context.decoBorder,
                      child: ClipRRect(
                        borderRadius: context.theme.radius,
                        child: _Player(videoCtrl: videoCtrl, onWidthChange: playerWidth.set),
                      ),
                    ),
                  ),
                  const Gap(Insets.med),
                  Text(video.title),
                  const Gap(Insets.sm),
                  Row(
                    spacing: Insets.sm,
                    children: [
                      if (channel != null) ShadAvatar(channel.logoUrl, size: const Size.square(30)),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(video.author, style: context.text.muted),
                            if (channel?.subscribersCount != null)
                              Text(
                                NumberFormat.compact().format(channel?.subscribersCount ?? 0),
                                style: context.text.muted.size(10),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(Insets.sm),
                  Wrap(
                    runSpacing: Insets.xs,
                    spacing: Insets.xs,
                    children: [
                      CountSeparator(title: 'Views', count: video.engagement.viewCount),
                      CountSeparator(title: 'Likes', count: video.engagement.likeCount ?? 0),
                      if (video.publishDate != null)
                        ShadBadge.outline(
                          child: Text(video.publishDate!.timeAgo(), style: context.text.muted.size(10)),
                        ),
                    ],
                  ),
                  const Gap(Insets.sm),
                  ShadAccordion<String>(
                    children: [
                      ShadAccordionItem(
                        padding: Pads.sm('tb'),
                        title: const Text('Description'),
                        value: 'description',
                        separator: const SizedBox.shrink(),
                        child: Text(video.description, style: context.text.muted.size(12)),
                      ),
                      ShadAccordionItem(
                        padding: Pads.sm('tb'),
                        title: const Text('Related videos'),
                        value: 'related',
                        separator: const SizedBox.shrink(),
                        child: Text('TODO', style: context.text.muted.size(12)),
                      ),
                    ],
                  ),

                  const Gap(Insets.offset),
                ],
              ),
            ),
          ),
          if (playlistId != null)
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return const Text('data');
                },
              ),
            ),
        ],
      ),
    );
  }
}

class _Player extends HookWidget {
  const _Player({required this.videoCtrl, this.onWidthChange, this.onPrevious, this.onNext});

  final YoutubePlayerController videoCtrl;
  final Function()? onPrevious;
  final Function()? onNext;
  final Function(double width)? onWidthChange;

  @override
  Widget build(BuildContext context) {
    final progressCtrl = useMemoized(() => ShadSliderController(initialValue: 0));
    final volCtrl = useMemoized(() => ShadSliderController(initialValue: 100));
    final showingCtrls = useState(false);
    final width = useState(context.width * .7);

    listener() {
      progressCtrl.value = max(0, videoCtrl.value.position.inSeconds.toDouble());
    }

    useValueChanged(width, (_, _) => onWidthChange?.call(width.value));

    useEffect(() {
      onWidthChange?.call(width.value);
      videoCtrl.addListener(listener);
      return () => videoCtrl.removeListener(listener);
    }, const []);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        showingCtrls.toggle();
      },
      child: ValueListenableBuilder(
        valueListenable: videoCtrl,
        builder: (context, v, _) {
          final duration = v.metaData.duration;

          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              IgnorePointer(
                child: YoutubePlayer(
                  onReady: () => showingCtrls.value = true,
                  width: width.value,
                  controller: videoCtrl,
                  bufferIndicator: const CircularProgressIndicator(),
                ),
              ),
              if (showingCtrls.value)
                Positioned.fill(
                  child: DecoContainer(
                    color: Colors.black.op2,
                    padding: Pads.sm('lr'),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ShadCard(
                          padding: Pads.sm(),
                          backgroundColor: context.colors.background.op8,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              //! PRE ---
                              if (onPrevious != null)
                                ShadButton.ghost(onPressed: onPrevious, child: const Icon(LuIcons.skipBack)),

                              //! PLAY ---
                              ShadButton(
                                height: 50,
                                width: 50,
                                backgroundColor: context.colors.primary.op6,
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

                              //! NEXT ---
                              if (onNext != null)
                                ShadButton.ghost(onPressed: onNext, child: const Icon(LuIcons.skipForward)),
                              if (onNext == null) const Gap(Insets.sm),

                              //! VOL ---
                              Icon(LuIcons.volume2, color: context.colors.primary),
                              const Gap(Insets.sm),
                              SizedBox(
                                width: 80,
                                child: ShadSlider(
                                  controller: volCtrl,
                                  max: 100,
                                  thumbRadius: 3,
                                  trackHeight: 1,
                                  onChanged: (v) => videoCtrl.setVolume(v.toInt()),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Gap(Insets.sm),
                        //! progress ---
                        Row(
                          spacing: Insets.sm,
                          children: [
                            CurrentPosition(controller: videoCtrl),
                            Expanded(
                              child: ShadSlider(
                                controller: progressCtrl,
                                max: duration.inSeconds.toDouble(),
                                onChanged: (value) => videoCtrl.seekTo(value.toInt().seconds),
                                thumbRadius: 4,
                                trackHeight: 4,
                              ),
                            ),
                          ],
                        ),
                        const Gap(Insets.sm),
                      ],
                    ),
                  ),
                ),

              if (!showingCtrls.value && v.isReady)
                SizedBox(width: width.value, child: ShadProgress(minHeight: 1, value: v.position.progressOf(duration))),
              if (v.playerState.isBuffering) const Positioned.fill(child: Center(child: CircularProgressIndicator())),
            ],
          );
        },
      ),
    );
  }
}
