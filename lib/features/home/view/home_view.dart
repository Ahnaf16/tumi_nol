import 'package:flutter/material.dart';
import 'package:tumi_nol/features/home/controller/yt_ctrl.dart';
import 'package:tumi_nol/features/home/view/video_list_view.dart';
import 'package:tumi_nol/features/video_view/video_view.dart';
import 'package:tumi_nol/main.export.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final txtCtrl = useTextEditingController();
    final ctrl = useCallback(() => ref.read(yTCtrlProvider.notifier));

    final loading = useState(false);
    return Scaffold(
      appBar: AppBar(title: const Text('Tumi Nol')),
      body: Padding(
        padding: context.layout.pagePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ShadInput(
                  controller: txtCtrl,
                  placeholder: const Text('Enter video/playlist url'),
                  trailing: ShadButton(
                    leading: loading.value
                        ? const SizedBox.square(
                            dimension: 18,
                            child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                          )
                        : null,
                    onPressed: () async {
                      loading.toggle();
                      final data = await ctrl().submitUrl(txtCtrl.text);
                      loading.toggle();
                      if (data == null) return;
                      if (!context.mounted) return;
                      final YTData(:playlist, :videos) = data;

                      if (playlist != null) {
                        final route = YTPlayListView(videos: data.videos, playlist: playlist);
                        await context.push(route);
                      } else {
                        final first = data.videos.firstOrNull;
                        if (first == null) return Toast.showErr('No video found');
                        final route = YTVideoView(video: first);
                        await context.push(route);
                      }
                    },
                    child: const Icon(LuIcons.arrowRight),
                  ),
                ),
              ],
            ),

            // Row(
            //   children: [
            //     ShadButton.link(
            //       child: const Text('video'),
            //       onPressed: () => txtCtrl.text = 'https://www.youtube.com/watch?v=vK1CzLBEAkA',
            //     ),
            //     ShadButton.link(
            //       child: const Text('playlist'),
            //       onPressed: () =>
            //           txtCtrl.text = 'https://www.youtube.com/playlist?list=PL2KpGf-puYLbOTmqaDE9vKHnTDz77BVIs',
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
