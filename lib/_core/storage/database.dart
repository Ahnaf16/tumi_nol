import 'package:drift/drift.dart';
// ignore: depend_on_referenced_packages
import 'package:drift_dev/api/migrations_native.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tumi_nol/main.export.dart';

part 'database.g.dart';

@DriftDatabase(tables: [VideoDatas, PlaylistDatas])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: '${kAppName}_db',
      native: const DriftNativeOptions(databaseDirectory: getApplicationSupportDirectory),
    );
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
      if (details.wasCreated) {}
      if (kDebugMode) {
        await VerifySelf(this).validateDatabaseSchema();
      }
    },
    onUpgrade: (m, from, to) async {},
  );
}
