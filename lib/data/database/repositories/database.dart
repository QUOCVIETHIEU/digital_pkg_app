import '../../../common/models/listview_config_model.dart';
import '../../../core/constants/enums.dart';
import '../../../domain/database/repositories/app_database.dart';
import '../../../service_locator.dart';
import '../sources/app_database_service.dart';

class DatabaseRepositoryImpl extends AppDatabaseRepository {
  @override
  Future<ListViewConfigModel> getListViewConfig(
    ListViewConfigName listViewConfigName,
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
