import 'package:flutter/material.dart';
import 'package:tumi_nol/main.export.dart';

extension StringEx on String {
  int get asInt => isEmpty ? 0 : int.tryParse(this) ?? 0;

  double get asDouble => double.tryParse(this) ?? 0.0;

  String showUntil(int end, [int start = 0]) {
    return length >= end ? '${substring(start, end)}...' : this;
  }

  String ifEmpty([String onEmpty = 'EMPTY']) {
    return isEmpty ? onEmpty : this;
  }

  /// Gracefully handles null values, and skips the suffix when null
  String safeGet([String? suffix]) {
    return this + (isNotEmpty ? (suffix ?? '') : '');
  }

  bool get isValidEmail {
    final reg = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return reg.hasMatch(this);
  }

  String get low => toLowerCase();
  String get up => toUpperCase();
}

extension ValueEx on ValueNotifier<bool> {
  void toggle() => value = !value;
}

extension ValueTEx<T> on ValueNotifier<T> {
  void set(T value) => this.value = value;
}

extension NumEx on num {
  String readableByte([int? decimals]) => Parser.formatBytes(toInt(), decimals ?? 2);

  String twoDigits([String padWith = '0']) => toString().padLeft(2, padWith);
}
