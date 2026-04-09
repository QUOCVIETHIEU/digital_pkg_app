import 'package:tableview2/tableview2.dart';

abstract class AppDatabaseRepository {
  Future<ListViewConfigModel> getListViewConfig(String listViewConfigName);
  Future<void> saveListViewConfig(ListViewConfigModel listViewConfigModel);
}
