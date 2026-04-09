import 'package:drift/drift.dart';
import 'package:tableview2/tableview2.dart';

import '../../../core/configs/listview/listview_config.dart';
import '../../../service_locator.dart';
import '../models/app_database.dart';

abstract class AppDatabaseService {
  Future<ListViewConfigModel> getListViewConfigModel(String listViewConfigName);
  Future<void> saveListViewConfig(
    String listViewConfigName,
    ListViewConfigModel listViewConfigModel,
  );
}

class AppDatabaseServiceImpl extends AppDatabaseService {
  @override
  Future<ListViewConfigModel> getListViewConfigModel(
    String listViewConfigName,
  ) async {
    try {
      late ListViewConfigModel listViewConfigModel;

      final db = sl<AppDatabase>();
      final row = await (db.select(
        db.listViewConfigs,
      )..where((tbl) => tbl.name.equals(listViewConfigName))).getSingleOrNull();
      if (row != null) {
        listViewConfigModel = row.config;
      } else {
        listViewConfigModel =
            ListViewConfigProvider.configs[listViewConfigName]!;
      }

      return listViewConfigModel;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> saveListViewConfig(
    String listViewConfigName,
    ListViewConfigModel listViewConfigModel,
  ) async {
    try {
      final db = sl<AppDatabase>();
      await db
          .into(db.listViewConfigs)
          .insert(
            ListViewConfig(
              name: listViewConfigName,
              config: listViewConfigModel,
            ),
            mode: InsertMode.insertOrReplace,
          );
    } catch (_) {
      rethrow;
    }
  }
}
