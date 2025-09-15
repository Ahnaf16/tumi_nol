// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yt_ctrl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$channelDetailsHash() => r'31ded5dc430344effc8f12c70277aea059ab714e';

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

/// See also [channelDetails].
@ProviderFor(channelDetails)
const channelDetailsProvider = ChannelDetailsFamily();

/// See also [channelDetails].
class ChannelDetailsFamily extends Family<AsyncValue<Channel>> {
  /// See also [channelDetails].
  const ChannelDetailsFamily();

  /// See also [channelDetails].
  ChannelDetailsProvider call(String channelId) {
    return ChannelDetailsProvider(channelId);
  }

  @override
  ChannelDetailsProvider getProviderOverride(
    covariant ChannelDetailsProvider provider,
  ) {
    return call(provider.channelId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'channelDetailsProvider';
}

/// See also [channelDetails].
class ChannelDetailsProvider extends AutoDisposeFutureProvider<Channel> {
  /// See also [channelDetails].
  ChannelDetailsProvider(String channelId)
    : this._internal(
        (ref) => channelDetails(ref as ChannelDetailsRef, channelId),
        from: channelDetailsProvider,
        name: r'channelDetailsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$channelDetailsHash,
        dependencies: ChannelDetailsFamily._dependencies,
        allTransitiveDependencies:
            ChannelDetailsFamily._allTransitiveDependencies,
        channelId: channelId,
      );

  ChannelDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.channelId,
  }) : super.internal();

  final String channelId;

  @override
  Override overrideWith(
    FutureOr<Channel> Function(ChannelDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChannelDetailsProvider._internal(
        (ref) => create(ref as ChannelDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        channelId: channelId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Channel> createElement() {
    return _ChannelDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChannelDetailsProvider && other.channelId == channelId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, channelId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ChannelDetailsRef on AutoDisposeFutureProviderRef<Channel> {
  /// The parameter `channelId` of this provider.
  String get channelId;
}

class _ChannelDetailsProviderElement
    extends AutoDisposeFutureProviderElement<Channel>
    with ChannelDetailsRef {
  _ChannelDetailsProviderElement(super.provider);

  @override
  String get channelId => (origin as ChannelDetailsProvider).channelId;
}

String _$yTCtrlHash() => r'b8ef0a796035309aaeec2135e05a2c95138708d9';

/// See also [YTCtrl].
@ProviderFor(YTCtrl)
final yTCtrlProvider = AutoDisposeNotifierProvider<YTCtrl, YTData>.internal(
  YTCtrl.new,
  name: r'yTCtrlProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$yTCtrlHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$YTCtrl = AutoDisposeNotifier<YTData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
