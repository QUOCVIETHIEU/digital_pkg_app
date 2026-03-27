import '../../../common/models/drawer_model.dart';
import '../../../core/constants/app_route.dart';
import '../../../service_locator.dart';
import '../../helpers/access_utils.dart';

class Drawers {
  static List<DrawerModel> getDrawers() {
    List<DrawerModel> drawers = [];
    for (var drawer in _allDrawers) {
      drawer = drawer.copyWith(
        children: drawer.children.where((child) {
          return sl<AccessUtils>().hasRoutePermission(route: child.route);
        }).toList(),
      );
      if (sl<AccessUtils>().hasRoutePermission(route: drawer.route)) {
        drawers.add(drawer);
      }
    }
    return drawers;
  }

  static List<DrawerModel> get drawers => getDrawers();

  static final _allDrawers = [
    DrawerModel(
      route: AppRoute.home,
      title: 'HOME',
      icon: 'ico_drawer_home',
      enabled: true,
      children: [],
    ),
    DrawerModel(
      route: AppRoute.dashboard,
      title: 'DASHBOARD',
      icon: 'ico_drawer_dashboard',
      enabled: true,
      children: [],
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
