// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yt_ctrl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$yTCtrlHash() => r'f078706bf786b6fffd7ab1d7a9200b6370b7c477';

/// See also [YTCtrl].
@ProviderFor(YTCtrl)
final yTCtrlProvider =
    AutoDisposeNotifierProvider<YTCtrl, List<String>>.internal(
      YTCtrl.new,
      name: r'yTCtrlProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product') ? null : _$yTCtrlHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$YTCtrl = AutoDisposeNotifier<List<String>>;
String _$yTMetaCtrlHash() => r'f7231ad4a0c4f220cb9a570950b2cb35acbc38d5';

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

abstract class _$YTMetaCtrl extends BuildlessAutoDisposeAsyncNotifier<Video> {
  late final String id;

  FutureOr<Video> build(String id);
}

/// See also [YTMetaCtrl].
@ProviderFor(YTMetaCtrl)
const yTMetaCtrlProvider = YTMetaCtrlFamily();

/// See also [YTMetaCtrl].
class YTMetaCtrlFamily extends Family<AsyncValue<Video>> {
  /// See also [YTMetaCtrl].
  const YTMetaCtrlFamily();

  /// See also [YTMetaCtrl].
  YTMetaCtrlProvider call(String id) {
    return YTMetaCtrlProvider(id);
  }

  @override
  YTMetaCtrlProvider getProviderOverride(
    covariant YTMetaCtrlProvider provider,
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
  String? get name => r'yTMetaCtrlProvider';
}

/// See also [YTMetaCtrl].
class YTMetaCtrlProvider
    extends AutoDisposeAsyncNotifierProviderImpl<YTMetaCtrl, Video> {
  /// See also [YTMetaCtrl].
  YTMetaCtrlProvider(String id)
    : this._internal(
        () => YTMetaCtrl()..id = id,
        from: yTMetaCtrlProvider,
        name: r'yTMetaCtrlProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$yTMetaCtrlHash,
        dependencies: YTMetaCtrlFamily._dependencies,
        allTransitiveDependencies: YTMetaCtrlFamily._allTransitiveDependencies,
        id: id,
      );

  YTMetaCtrlProvider._internal(
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
  FutureOr<Video> runNotifierBuild(covariant YTMetaCtrl notifier) {
    return notifier.build(id);
  }

  @override
  Override overrideWith(YTMetaCtrl Function() create) {
    return ProviderOverride(
      origin: this,
      override: YTMetaCtrlProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<YTMetaCtrl, Video> createElement() {
    return _YTMetaCtrlProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is YTMetaCtrlProvider && other.id == id;
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
mixin YTMetaCtrlRef on AutoDisposeAsyncNotifierProviderRef<Video> {
  /// The parameter `id` of this provider.
  String get id;
}

class _YTMetaCtrlProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<YTMetaCtrl, Video>
    with YTMetaCtrlRef {
  _YTMetaCtrlProviderElement(super.provider);

  @override
  String get id => (origin as YTMetaCtrlProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
