import 'package:tableview2/tableview2.dart';

import '../../../domain/database/repositories/app_database.dart';
import '../../../service_locator.dart';
import '../sources/app_database_service.dart';

class DatabaseRepositoryImpl extends AppDatabaseRepository {
  @override
  Future<ListViewConfigModel> getListViewConfig(
    String listViewConfigName,
  ) async {
    try {
      return await sl<AppDatabaseService>().getListViewConfigModel(
        listViewConfigName,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> saveListViewConfig(
    ListViewConfigModel listViewConfigModel,
  ) async {
    try {
      await sl<AppDatabaseService>().saveListViewConfig(
        listViewConfigModel.name,
        listViewConfigModel,
      );
    } catch (e) {
      rethrow;
    }
  }
}
