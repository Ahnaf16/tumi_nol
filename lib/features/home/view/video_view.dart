import 'package:flutter/material.dart';
import 'package:tumi_nol/_styled_widgets/deco_container.dart';
import 'package:tumi_nol/features/home/controller/yt_ctrl.dart';
import 'package:tumi_nol/main.export.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YTVideoView extends HookConsumerWidget {
  const YTVideoView({super.key, required this.video});

  final Video video;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final channelData = ref.watch(channelDetailsProvider(video.channelId.value));
    final videoCtrl = useMemoized(
      () => YoutubePlayerController(
        initialVideoId: video.id.value,
        flags: const YoutubePlayerFlags(enableCaption: false, autoPlay: false),
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
      body: CustomScrollView(
        physics: kScrollPhysics,
        slivers: [
          SliverFloatingHeader(
            child: ShadDecorator(
              decoration: ShadDecoration(
                border: ShadBorder.all(color: context.colors.border, width: 1, radius: context.theme.radius),
              ),
              child: ClipRRect(
                borderRadius: context.theme.radius,
                child: YoutubePlayer(controller: videoCtrl, bufferIndicator: const CircularProgressIndicator()),
              ),
            ),
          ),
          SliverPadding(
            padding: context.layout.pagePadding,
            sliver: SliverList(
              delegate: SliverChildListDelegate([
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
                      ShadBadge.outline(child: Text(video.publishDate!.timeAgo(), style: context.text.muted.size(10))),
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
              ]),
            ),
          ),
          const SliverGap(Insets.offset),
        ],
      ),
    );
  }
}

class CountSeparator extends StatelessWidget {
  const CountSeparator({super.key, required this.title, required this.count});

  final String title;
  final num count;

  @override
  Widget build(BuildContext context) {
    return ShadBadge.outline(
      child: Text.rich(
        TextSpan(
          style: context.text.muted.size(10),
          children: [
            TextSpan(text: '$title '),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: DecoContainer(width: 4, height: 4, borderRadius: Corners.circle, color: context.colors.border),
            ),
            TextSpan(text: ' ${NumberFormat.compact().format(count)}'),
          ],
        ),
      ),
    );
  }
}
