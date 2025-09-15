import 'package:drift/drift.dart';
import 'package:tumi_nol/main.export.dart';

export 'package:drift/drift.dart' show Value;

class Videos extends Table with AutoIncrementId {
  late final title = text()();
  late final description = text()();
  late final author = text()();
  late final playlistId = text()();
  late final thumbnail = blob().nullable()();
  late final downloadedPath = text().nullable()();
}
