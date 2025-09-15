// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_video_ctrl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playListVideoCtrlHash() => r'f9e596a01da74fa0f261e506c76458e49755dacc';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$PlayListVideoCtrl
    extends BuildlessAutoDisposeAsyncNotifier<VideoData> {
  late final String id;

  FutureOr<VideoData> build(String id);
}

/// See also [PlayListVideoCtrl].
@ProviderFor(PlayListVideoCtrl)
const playListVideoCtrlProvider = PlayListVideoCtrlFamily();

/// See also [PlayListVideoCtrl].
class PlayListVideoCtrlFamily extends Family<AsyncValue<VideoData>> {
  /// See also [PlayListVideoCtrl].
  const PlayListVideoCtrlFamily();

  /// See also [PlayListVideoCtrl].
  PlayListVideoCtrlProvider call(String id) {
    return PlayListVideoCtrlProvider(id);
  }

  @override
  PlayListVideoCtrlProvider getProviderOverride(
    covariant PlayListVideoCtrlProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'playListVideoCtrlProvider';
}

/// See also [PlayListVideoCtrl].
class PlayListVideoCtrlProvider
    extends AutoDisposeAsyncNotifierProviderImpl<PlayListVideoCtrl, VideoData> {
  /// See also [PlayListVideoCtrl].
  PlayListVideoCtrlProvider(String id)
    : this._internal(
        () => PlayListVideoCtrl()..id = id,
        from: playListVideoCtrlProvider,
        name: r'playListVideoCtrlProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$playListVideoCtrlHash,
        dependencies: PlayListVideoCtrlFamily._dependencies,
        allTransitiveDependencies:
            PlayListVideoCtrlFamily._allTransitiveDependencies,
        id: id,
      );

  PlayListVideoCtrlProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  FutureOr<VideoData> runNotifierBuild(covariant PlayListVideoCtrl notifier) {
    return notifier.build(id);
  }

  @override
  Override overrideWith(PlayListVideoCtrl Function() create) {
    return ProviderOverride(
      origin: this,
      override: PlayListVideoCtrlProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<PlayListVideoCtrl, VideoData>
  createElement() {
    return _PlayListVideoCtrlProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlayListVideoCtrlProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PlayListVideoCtrlRef on AutoDisposeAsyncNotifierProviderRef<VideoData> {
  /// The parameter `id` of this provider.
  String get id;
}

class _PlayListVideoCtrlProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<PlayListVideoCtrl, VideoData>
    with PlayListVideoCtrlRef {
  _PlayListVideoCtrlProviderElement(super.provider);

  @override
  String get id => (origin as PlayListVideoCtrlProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
