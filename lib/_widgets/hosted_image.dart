import 'package:flutter/material.dart';
import 'package:tumi_nol/main.export.dart';

class HostedImage extends StatelessWidget {
  const HostedImage(
    this.img, {
    super.key,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.onImgTap,
    this.errorIcon,
    this.tag,
  });

  const HostedImage.square(
    this.img, {
    super.key,
    double? dimension,
    this.fit = BoxFit.cover,
    this.onImgTap,
    this.errorIcon,
    this.tag,
  }) : height = dimension,
       width = dimension;

  final void Function()? onImgTap;

  final IconData? errorIcon;
  final BoxFit fit;
  final double? height;
  final double? width;
  final String? tag;

  /// [AssetImg], [FileImg], [NetImg], [IconImg]
  final Img img;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onImgTap,
      child: UniversalImage(
        img.path,
        height: height,
        width: width,
        heroTag: tag ?? img.toString(),
        fit: fit,
        errorPlaceholder: Icon(errorIcon ?? Icons.error, color: Colors.redAccent),
        placeholder: const Center(child: SizedBox.square(dimension: 20, child: CircularProgressIndicator())),
      ),
    );
  }
}

sealed class Img {
  const Img(this.path);
  final dynamic path;
}

class AssetImg extends Img {
  AssetImg(String super.path) : assert(path.startsWith('assets'), 'path must start with `assets`');
}

class FileImg extends Img {
  FileImg(String super.path);
}

class NetImg extends Img {
  NetImg(String super.url) : assert(url.startsWith(_rx), 'url must start with `http` or `https`');

  static final _rx = RegExp('(http(s)://.)');
}

class IconImg extends Img {
  IconImg(IconData super.icon);
}
