import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/widgets.dart';
import 'package:screen_retriever/screen_retriever.dart';

Future<Size> getDeviceScreenSize() async {
  // Guard in case this file is accidentally used on web
  if (kIsWeb) {
    throw UnsupportedError('screen_utils_io used on web');
  }

  if (Platform.isAndroid || Platform.isIOS) {
    final dispatcher = WidgetsBinding.instance.platformDispatcher;
    final view = dispatcher.views.isNotEmpty ? dispatcher.views.first : null;
    if (view != null) {
      final physicalSize = view.physicalSize;
      return Size(physicalSize.width, physicalSize.height);
    }
    // Fallback: zero size
    return const Size(0, 0);
  }

  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    // Prefer monitor resolution via screen_retriever

    final display = await ScreenRetriever.instance.getPrimaryDisplay();
    final displaySize = display.size;
    return Size(displaySize.width, displaySize.height);
  }

  throw UnsupportedError('Unknown platform');
}
