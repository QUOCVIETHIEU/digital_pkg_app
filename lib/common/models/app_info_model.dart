import 'package:package_info_plus/package_info_plus.dart';

class AppInfoModel {
  String appShortName;
  String appFullName;
  String slogan;
  String packageName;
  String shortVersion;
  String fullVersion;
  String buildNumber;

  AppInfoModel({
    this.appShortName = 'SYRUP MIXING',
    this.appFullName = 'SYRUP MIXING CONTROL SYSTEM',
    this.slogan = 'Higher Productivity, Faster Decisions',
    this.packageName = '',
    this.shortVersion = '',
    this.fullVersion = '',
    this.buildNumber = '',
  });
  static late AppInfoModel instance;
  static Future<void> loadAppInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();

    instance = AppInfoModel(
      packageName: '(${packageInfo.packageName})',
      shortVersion: 'V${packageInfo.version}',
      fullVersion: 'Version V${packageInfo.version}',
      buildNumber: packageInfo.buildNumber,
    );
  }
}
