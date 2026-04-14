import '../../../common/models/drawer_model.dart';
import '../../../core/constants/app_route.dart';

class Drawers {
  static List<DrawerModel> getDrawers() {
    List<DrawerModel> drawers = [];
    for (var drawer in _allDrawers) {
      drawer = drawer.copyWith();
      drawers.add(drawer);
    }
    return drawers;
  }

  static List<DrawerModel> get drawers => getDrawers();

  static final _allDrawers = [
    DrawerModel(
      route: AppRoute.dashboard,
      title: 'DASHBOARD',
      icon: 'ico_drawer_home',
      enabled: true,
      children: [],
    ),
    DrawerModel(
      route: AppRoute.workflow,
      title: 'WORKFLOW',
      icon: 'ico_drawer_workflow',
      enabled: true,
      children: [
        DrawerModel(
          route: AppRoute.requestManager,
          title: 'REQUEST MANAGER',
          icon: 'ico_drawer_request_manager',
          enabled: true,
          children: [],
        ),
      ],
    ),
    DrawerModel(
      route: AppRoute.setting,
      title: 'SETTINGS',
      icon: 'ico_drawer_setting',
      enabled: true,
      children: [],
    ),
    DrawerModel(
      route: AppRoute.support,
      title: 'SUPPORT',
      icon: 'ico_drawer_support',
      enabled: true,
      children: [],
    ),
  ];
}
