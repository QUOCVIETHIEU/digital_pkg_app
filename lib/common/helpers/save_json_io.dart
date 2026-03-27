import 'dart:io';

import 'package:path_provider/path_provider.dart';

/// Non-web (mobile/desktop) implementation for saving JSON to file
Future<String?> saveJsonToFileImpl(String jsonData, String filename) async {
  final path = await _getDownloadPath();
  if (path == null) return null;
  final file = File('$path/$filename');
  try {
    final result = await file.writeAsString(jsonData);
    return result.path;
  } catch (e) {
    return null;
  }
}

Future<String?> _getDownloadPath() async {
  Directory? directory;
  try {
    if (Platform.isAndroid) {
      directory = Directory('/storage/emulated/0/Download');
      // Put file in global download folder, if for an unknown reason it didn't exist, we fallback

      if (!await directory.exists()) {
        directory = await getExternalStorageDirectory();
      }
    } else {
      directory = await getApplicationDocumentsDirectory();
    }
  } catch (err) {
    return null;
  }
  return directory?.path;
}
