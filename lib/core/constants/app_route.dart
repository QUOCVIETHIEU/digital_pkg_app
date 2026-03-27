enum AppRoute {
  /// 01. Cores rot base
  login(name: 'login', path: '/login'),
  serverConfig(name: 'server-config', path: '/server-config'),

  /// 02. Dashboards
  home(name: 'home', path: '/home'),

  dashboard(name: 'dashboard', path: '/dashboard'),

  ///  Settings
  setting(name: 'setting', path: '/setting'),

  /// Supports
  support(name: 'support', path: '/support'),

  /// Workflows
  workflow(name: 'workflow', path: '/workflow');

  final String name;
  final String path;

  const AppRoute({required this.name, required this.path});
}

enum AppQueryParam {
  mode(name: 'mode'),
  recipeId(name: 'recipeId'),
  isHistory(name: 'isHistory'),
  selectedChip(name: 'selectedChip');

  final String name;
  const AppQueryParam({required this.name});
}
