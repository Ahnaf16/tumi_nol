import 'package:flutter/material.dart';
import 'package:tumi_nol/_core/extensions/extra_ex.dart';
import 'package:tumi_nol/main.export.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Player extends StatelessWidget {
  const Player({super.key, required this.videoCtrl, required this.thumbnailUrl});

  final YoutubePlayerController videoCtrl;
  final String thumbnailUrl;

  @override
  Widget build(BuildContext context) {
    final double width = switch (context.breakpoint) {
      ShadBreakpointSM() => 200,
      _ => 300,
    };
    return ResponsiveWidthBox(
      maxWidth: width,
      child: ValueListenableBuilder(
        valueListenable: videoCtrl,
        builder: (context, v, _) {
          final duration = v.metaData.duration;
          return Column(
            children: [
              ShadDecorator(
                decoration: ShadDecoration(
                  border: ShadBorder.all(color: context.colors.border, width: 3, radius: context.theme.radius),
                ),

                child: ClipRRect(
                  borderRadius: context.theme.radius,
                  child:
                      v.playerState.isEnded
                          ? HostedImage(width: width, NetImg(thumbnailUrl))
                          : YoutubePlayer(controller: videoCtrl),
                ),
              ),
              SizedBox(width: width - 50, child: ShadProgress(minHeight: 6, value: v.position.progressOf(duration))),
            ],
          );
        },
      ),
    );
  }
}
