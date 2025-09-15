import 'dart:io';

import 'package:tumi_nol/main.export.dart';

extension PlaylistDataExt on PlaylistData {
  Img get thumbnail {
    final netImg = NetImg(thumbnailUrl);
    if (thumbnailFile == null) return netImg;

    if (!File(thumbnailFile!).existsSync()) return netImg;
    return FileImg(thumbnailFile!);
  }
}
