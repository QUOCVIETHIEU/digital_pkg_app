import '../../../common/models/listview_config_model.dart';
import '../../../core/constants/enums.dart';

abstract class AppDatabaseRepository {
  Future<ListViewConfigModel> getListViewConfig(
    ListViewConfigName listViewConfigName,
  );
  Future<void> saveListViewConfig(ListViewConfigModel listViewConfigModel);
}
