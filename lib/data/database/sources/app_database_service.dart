import 'package:drift/drift.dart';

import '../../../common/models/listview_config_model.dart';
import '../../../core/configs/listview/listview_config.dart';
import '../../../core/constants/enums.dart';
import '../../../service_locator.dart';
import '../models/app_database.dart';

abstract class AppDatabaseService {
  Future<ListViewConfigModel> getListViewConfigModel(
    ListViewConfigName listViewConfigName,
  );
  Future<void> saveListViewConfig(
    ListViewConfigName listViewConfigName,
    ListViewConfigModel listViewConfigModel,
  );
}

class AppDatabaseServiceImpl extends AppDatabaseService {
  @override
  Future<ListViewConfigModel> getListViewConfigModel(
    ListViewConfigName listViewConfigName,
  ) async {
    try {
      late ListViewConfigModel listViewConfigModel;

      final db = sl<AppDatabase>();
      final row =
          await (db.select(db.listViewConfigs)
                ..where((tbl) => tbl.name.equals(listViewConfigName.name)))
              .getSingleOrNull();
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
    ListViewConfigName listViewConfigName,
    ListViewConfigModel listViewConfigModel,
  ) async {
    try {
      final db = sl<AppDatabase>();
      await db
          .into(db.listViewConfigs)
          .insert(
            ListViewConfig(
              name: listViewConfigName.name,
              config: listViewConfigModel,
            ),
            mode: InsertMode.insertOrReplace,
          );
    } catch (_) {
      rethrow;
    }
  }
}
