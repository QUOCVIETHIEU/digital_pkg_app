import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../data/database/models/converters.dart';

import '../../../common/models/app_info_model.dart';
import '../../../common/models/listview_config_model.dart';

part 'app_database.g.dart';

class ListViewConfigs extends Table {
  TextColumn get name => text()();
  TextColumn get config => text().map(const ListViewConfigConverter())();
  @override
  Set<Column<Object>>? get primaryKey => {name};
}

@DriftDatabase(tables: [ListViewConfigs])
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => int.tryParse(AppInfoModel.instance.buildNumber) ?? 1;
  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (migrator, from, to) async {
      if (from < to) {
        await delete(listViewConfigs).go();
      }
    },
  );

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'syrup_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
      web: DriftWebOptions(
        sqlite3Wasm: Uri.parse('sqlite3.wasm'),
        driftWorker: Uri.parse('drift_worker.dart.js'),
        onResult: (result) {
          if (result.missingFeatures.isNotEmpty) {
            Logger logger = Logger(
              printer: PrettyPrinter(
                methodCount: 0,
                colors: true,
                printEmojis: true,
              ),
            );
            logger.e(
              'Using ${result.chosenImplementation} due to unsupported '
              'browser features: ${result.missingFeatures}',
            );
          }
        },
      ),
      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }
}
