// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_video_ctrl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PlayListVideoCtrl)
const playListVideoCtrlProvider = PlayListVideoCtrlFamily._();

final class PlayListVideoCtrlProvider
    extends $AsyncNotifierProvider<PlayListVideoCtrl, VideoData> {
  const PlayListVideoCtrlProvider._({
    required PlayListVideoCtrlFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'playListVideoCtrlProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$playListVideoCtrlHash();

  @override
  String toString() {
    return r'playListVideoCtrlProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PlayListVideoCtrl create() => PlayListVideoCtrl();

  @override
  bool operator ==(Object other) {
    return other is PlayListVideoCtrlProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$playListVideoCtrlHash() => r'f9e596a01da74fa0f261e506c76458e49755dacc';

final class PlayListVideoCtrlFamily extends $Family
    with
        $ClassFamilyOverride<
          PlayListVideoCtrl,
          AsyncValue<VideoData>,
          VideoData,
          FutureOr<VideoData>,
          String
        > {
  const PlayListVideoCtrlFamily._()
    : super(
        retry: null,
        name: r'playListVideoCtrlProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PlayListVideoCtrlProvider call(String id) =>
      PlayListVideoCtrlProvider._(argument: id, from: this);

  @override
  String toString() => r'playListVideoCtrlProvider';
}

abstract class _$PlayListVideoCtrl extends $AsyncNotifier<VideoData> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  FutureOr<VideoData> build(String id);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<VideoData>, VideoData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<VideoData>, VideoData>,
              AsyncValue<VideoData>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
