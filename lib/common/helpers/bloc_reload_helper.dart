import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
import '../../domain/common/repositories/common.dart';
import '../../service_locator.dart';

/// Helper class to reload blocs based on route
class BlocReloadHelper {
  /// Map to track navigation count for each route
  static final Map<AppRoute, int> _navigationCount = {};

  /// Reload the appropriate bloc based on the route
  static void reloadByRoute(BuildContext context, AppRoute route) {
    // Get current count for this route (default to 0 if not exists)
    final count = _navigationCount[route] ?? 0;

    // Increment the navigation count
    _navigationCount[route] = count + 1;

    try {
      switch (route) {
        default:
          // No reload needed for other routes
          break;
      }
    } catch (e) {
      // Bloc might not be available in the context, ignore
      debugPrint(
        'BlocReloadHelper: Failed to reload bloc for route ${route.name}: $e',
      );
    }
  }

  static void resetAllBypassWarnings() {
    final commonRepository = sl<CommonRepository>();
    commonRepository.resetAllBypassWarnings();
  }
}
