// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_ctrl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PlayListCtrl)
const playListCtrlProvider = PlayListCtrlProvider._();

final class PlayListCtrlProvider
    extends $AsyncNotifierProvider<PlayListCtrl, List<PlaylistData>> {
  const PlayListCtrlProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playListCtrlProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playListCtrlHash();

  @$internal
  @override
  PlayListCtrl create() => PlayListCtrl();
}

String _$playListCtrlHash() => r'ada2ba1972ec49c5ad6a23cb9bac3b108388721e';

abstract class _$PlayListCtrl extends $AsyncNotifier<List<PlaylistData>> {
  FutureOr<List<PlaylistData>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<PlaylistData>>, List<PlaylistData>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<PlaylistData>>, List<PlaylistData>>,
              AsyncValue<List<PlaylistData>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
