import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tumi_nol/main.export.dart';

Value<T> identityValue<T>(T a) => Value<T>(a);

mixin AutoIncrementId on Table {
  // Primary key column
  late final id = integer().autoIncrement()();

  // Column for created at timestamp
  late final createdAt = dateTime().withDefault(currentDateAndTime)();
}

/// ---- TypeConverters ----

class JsonbConverter<T> extends TypeConverter<List<T>, String> {
  const JsonbConverter(this.fromJson, this.toJson);

  final T Function(Map<String, dynamic>) fromJson;
  final Map<String, dynamic> Function(T) toJson;

  @override
  List<T> fromSql(String fromDb) {
    final List<dynamic> decoded = jsonDecode(fromDb);
    return decoded.map((e) => fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  String toSql(List<T> value) {
    final list = value.map((e) => toJson(e)).toList();
    return jsonEncode(list);
  }
}

/// For simple list of strings
class StringListConverter extends TypeConverter<List<String>, String> {
  const StringListConverter();

  @override
  List<String> fromSql(String fromDb) => (jsonDecode(fromDb) as List).map((e) => e.toString()).toList();

  @override
  String toSql(List<String> value) => jsonEncode(value);
}

mixin Repo {
  Database get db => locate<Database>();

  $DatabaseManager get managers => db.managers;

  FutureReport<T> handler<T>(Future<T> Function() fn) async {
    try {
      final res = await fn();

      return right(res);
    } on Failure catch (e, s) {
      catErr('REPO ${e.runtimeType}', e, s);
      return left(e.copyWith(stackTrace: s));
    } catch (e, s) {
      catErr('REPO ${e.runtimeType}', e, s);
      return failure('$e', e: e, s: s);
    }
  }
}
