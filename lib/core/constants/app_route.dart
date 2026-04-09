enum AppRoute {
  /// 01. Cores rot base
  login(name: 'login', path: '/login'),
  serverConfig(name: 'server-config', path: '/server-config'),

  /// workflow
  workflow(name: 'workflow', path: '/workflow'),

  dashboard(name: 'dashboard', path: '/dashboard'),

  ///  Settings
  setting(name: 'setting', path: '/setting'),

  /// Supports
  support(name: 'support', path: '/support');

  final String name;
  final String path;

  const AppRoute({required this.name, required this.path});
}
