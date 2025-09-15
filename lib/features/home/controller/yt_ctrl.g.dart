// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yt_ctrl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(YTCtrl)
const yTCtrlProvider = YTCtrlProvider._();

final class YTCtrlProvider extends $NotifierProvider<YTCtrl, YTData> {
  const YTCtrlProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'yTCtrlProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$yTCtrlHash();

  @$internal
  @override
  YTCtrl create() => YTCtrl();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(YTData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<YTData>(value),
    );
  }
}

String _$yTCtrlHash() => r'b8ef0a796035309aaeec2135e05a2c95138708d9';

abstract class _$YTCtrl extends $Notifier<YTData> {
  YTData build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<YTData, YTData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<YTData, YTData>,
              YTData,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(channelDetails)
const channelDetailsProvider = ChannelDetailsFamily._();

final class ChannelDetailsProvider
    extends $FunctionalProvider<AsyncValue<Channel>, Channel, FutureOr<Channel>>
    with $FutureModifier<Channel>, $FutureProvider<Channel> {
  const ChannelDetailsProvider._({
    required ChannelDetailsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'channelDetailsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$channelDetailsHash();

  @override
  String toString() {
    return r'channelDetailsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Channel> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Channel> create(Ref ref) {
    final argument = this.argument as String;
    return channelDetails(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ChannelDetailsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$channelDetailsHash() => r'31ded5dc430344effc8f12c70277aea059ab714e';

final class ChannelDetailsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Channel>, String> {
  const ChannelDetailsFamily._()
    : super(
        retry: null,
        name: r'channelDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ChannelDetailsProvider call(String channelId) =>
      ChannelDetailsProvider._(argument: channelId, from: this);

  @override
  String toString() => r'channelDetailsProvider';
}
