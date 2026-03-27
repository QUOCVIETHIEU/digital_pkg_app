import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import '../../core/constants/enums.dart';

class ResponsiveUtil {
  /// Get screen size category based on width
  static ScreenSize getScreenSize(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;

    if (width >= ScreenSize.extraLarge.size) return ScreenSize.extraLarge;
    if (width >= ScreenSize.large.size) return ScreenSize.large;
    if (width >= ScreenSize.normal.size) return ScreenSize.normal;
    return ScreenSize.small;
  }

  /// Platform detection helpers
  static bool get isMobileDevice =>
      !kIsWeb && (Platform.isIOS || Platform.isAndroid);

  static bool get isDesktopDevice =>
      !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);

  static bool get isMobileDeviceOrWeb => kIsWeb || isMobileDevice;

  static bool get isDesktopDeviceOrWeb => kIsWeb || isDesktopDevice;
}
