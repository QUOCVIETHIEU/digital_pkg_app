import 'dart:ui' show Size;

import 'package:web/web.dart' as web;

/// Get the browser's full screen resolution (physical pixels)
Future<Size> getDeviceScreenSize() async {
  final screen = web.window.screen;
  final width = (screen.width).toDouble();
  final height = (screen.height).toDouble();
  return Size(width, height);
}
