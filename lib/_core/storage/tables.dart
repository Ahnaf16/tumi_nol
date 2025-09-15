import 'package:drift/drift.dart';

export 'package:drift/drift.dart' show Value;

class VideoDatas extends Table {
  late final id = text()();
  late final title = text()();
  late final description = text()();
  late final author = text()();
  late final playlistId = text()();
  late final thumbnail = text().nullable()();
  late final downloadedPath = text().nullable()();
  late final createdAt = dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

class PlaylistDatas extends Table {
  late final id = text()();
  late final title = text()();
  late final titleOriginal = text()();
  late final author = text()();
  late final videoCount = integer()();
  late final thumbnailUrl = text()();
  late final thumbnailFile = text().nullable()();
  late final createdAt = dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

//  final String id;
//   final String title;
//   final String titleOriginal;
//   final String author;
//   final int videoCount;
//   final String thumbnailUrl;
//   final String? thumbnailFile;
//   final DateTime created;
