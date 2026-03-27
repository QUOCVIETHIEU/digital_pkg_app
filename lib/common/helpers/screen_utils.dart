import 'dart:ui' show Size;

// Conditional import: use web implementation on web, IO implementation elsewhere
import 'screen_utils_io.dart'
    if (dart.library.html) 'screen_utils_web.dart'
    as impl;

class ScreenUtils {
  /// Returns the full device/monitor screen size in physical pixels
  static Future<Size> getDeviceScreenSize() => impl.getDeviceScreenSize();
}
