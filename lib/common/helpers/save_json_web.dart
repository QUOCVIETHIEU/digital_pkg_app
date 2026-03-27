import 'dart:convert';
import 'dart:js_interop';

import 'package:web/web.dart' as web;

/// Web implementation for saving JSON to file
Future<String?> saveJsonToFileImpl(String jsonData, String filename) async {
  try {
    // Create a Blob from the JSON data
    final bytes = utf8.encode(jsonData);
    final blob = web.Blob(
      [bytes.toJS].toJS,
      web.BlobPropertyBag(type: 'application/json'),
    );

    // Create a download URL
    final url = web.URL.createObjectURL(blob);

    // Create an anchor element and trigger download
    final anchor = web.document.createElement('a') as web.HTMLAnchorElement;
    anchor.href = url;
    anchor.download = filename;
    anchor.style.display = 'none';

    web.document.body?.appendChild(anchor);
    anchor.click();

    // Cleanup
    web.document.body?.removeChild(anchor);
    web.URL.revokeObjectURL(url);

    return filename;
  } catch (e) {
    return null;
  }
}
