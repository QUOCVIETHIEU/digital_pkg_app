import 'package:package_info_plus/package_info_plus.dart';

import '../models/app_info_model.dart';

class IUtilVersion {
  // Factory constructor async
  static Future<AppInfoModel> loadAppInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();

    return AppInfoModel(
      packageName: '(${packageInfo.packageName})',
      shortVersion: 'V${packageInfo.version}',
      fullVersion: 'Version V${packageInfo.version}',
      buildNumber: packageInfo.buildNumber,
    );
  }
}
