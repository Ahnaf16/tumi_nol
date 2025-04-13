import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tumi_nol/_core/extensions/extra_ex.dart';
import 'package:tumi_nol/main.export.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Player extends HookWidget {
  const Player({
    super.key,
    required this.videoCtrl,
    this.onWidthChange,
    this.onPrevious,
    this.onNext,
    this.ctrlBuilder,
  });

  final YoutubePlayerController videoCtrl;
  final Function()? onPrevious;
  final Function()? onNext;
  final Function(double width)? onWidthChange;
  final Widget Function(YoutubePlayerController videoCtrl, YoutubePlayerValue value)? ctrlBuilder;

  @override
  Widget build(BuildContext context) {
    final showingCtrls = useState(false);
    final width = useState(context.breakpoint < context.theme.breakpoints.md ? context.width : context.width * .7);

    useValueChanged(width, (_, _) => onWidthChange?.call(width.value));

    useEffect(() {
      onWidthChange?.call(width.value);
      return;
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
              if (v.playerState.isEnded)
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: HostedImage(
                    NetImg(YoutubePlayer.getThumbnail(videoId: videoCtrl.metadata.videoId)),
                    width: 300,
                  ),
                )
              else
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
                  child:
                      ctrlBuilder?.call(videoCtrl, v) ??
                      _FullPlayerCtrl(onPrevious: onPrevious, videoCtrl: videoCtrl, onNext: onNext),
                )
              else
                Positioned.fill(child: DecoContainer(color: Colors.black.op((.01)))),

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

class _FullPlayerCtrl extends HookWidget {
  const _FullPlayerCtrl({required this.onPrevious, required this.videoCtrl, required this.onNext});

  final YoutubePlayerController videoCtrl;
  final Function()? onPrevious;
  final Function()? onNext;

  @override
  Widget build(BuildContext context) {
    final volCtrl = useMemoized(() => ShadSliderController(initialValue: 100));

    final sml = context.breakpoint < context.theme.breakpoints.md;

    return ValueListenableBuilder(
      valueListenable: videoCtrl,
      builder: (context, v, _) {
        return DecoContainer(
          color: Colors.black.op2,
          padding: Pads.sm('lr'),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ShadCard(
                padding: sml ? Pads.xs() : Pads.sm(),
                backgroundColor: context.colors.background.op8,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //! PRE ---
                    if (onPrevious != null)
                      ShadButton.ghost(onPressed: onPrevious, child: const Icon(LuIcons.skipBack)),

                    //! PLAY ---
                    ShadButton(
                      height: sml ? 35 : 50,
                      width: sml ? 35 : 50,
                      padding: Pads.xs(),
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
                    if (onNext != null) ShadButton.ghost(onPressed: onNext, child: const Icon(LuIcons.skipForward)),
                    if (onNext == null) const Gap(Insets.sm),

                    //! VOL ---
                    Icon(LuIcons.volume2, color: context.colors.primary),

                    const Gap(Insets.sm),
                    SizedBox(
                      width: sml ? 65 : 80,
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
              VideoProgressCtrl(videoCtrl: videoCtrl, videoDuration: v.metaData.duration),
              const Gap(Insets.sm),
            ],
          ),
        );
      },
    );
  }
}

class VideoProgressCtrl extends HookWidget {
  const VideoProgressCtrl({
    super.key,
    required this.videoCtrl,
    required this.videoDuration,
    this.hidePositionText = false,
  });

  final YoutubePlayerController videoCtrl;
  final Duration videoDuration;
  final bool hidePositionText;

  @override
  Widget build(BuildContext context) {
    final progressCtrl = useMemoized(() => ShadSliderController(initialValue: 0));

    listener() {
      progressCtrl.value = max(0, videoCtrl.value.position.inSeconds.toDouble());
    }

    useEffect(() {
      videoCtrl.addListener(listener);
      return () => videoCtrl.removeListener(listener);
    }, const []);
    final slider = ShadSlider(
      controller: progressCtrl,
      max: videoDuration.inSeconds.toDouble() + 1,
      onChanged: (value) => videoCtrl.seekTo(value.toInt().seconds),
      thumbRadius: 4,
      trackHeight: 4,
    );
    if (hidePositionText) {
      return slider;
    }

    return Row(spacing: Insets.sm, children: [CurrentPosition(controller: videoCtrl), Expanded(child: slider)]);
  }
}
