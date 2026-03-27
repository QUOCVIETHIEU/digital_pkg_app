import '../../../common/helpers/utils.dart';
import '../../../core/constants/constants.dart';
import '../../../core/warning/warning_client.dart';
import '../../../service_locator.dart';

abstract class CommonService {
  bool get isByPassWarningVariant;
  bool get isByPassWarningProcessOrder;
  bool get isByPassWarningBom;
  bool get isByPassWarningRecipe;

  void enableBypassWarningByResultCode(ResultCode resultCode);
  void enableBypassWarningByResultCodesList(List<ResultCode> resultCodes);
  void resetAllBypassWarnings();
  Future<AccessLevel> getAccessLevel();
}

class CommonServiceImpl implements CommonService {
  final WarningClient _warningClient = sl<WarningClient>();

  @override
  bool get isByPassWarningVariant => _warningClient.isByPassWarningVariant;

  @override
  bool get isByPassWarningProcessOrder =>
      _warningClient.isByPassWarningProcessOrder;

  @override
  bool get isByPassWarningBom => _warningClient.isByPassWarningBom;

  @override
  bool get isByPassWarningRecipe => _warningClient.isByPassWarningRecipe;

  @override
  void enableBypassWarningByResultCode(ResultCode resultCode) {
    _warningClient.enableBypassWarningByResultCode(resultCode);
  }

  @override
  void enableBypassWarningByResultCodesList(List<ResultCode> resultCodes) {
    _warningClient.enableBypassWarningByResultCodesList(resultCodes);
  }

  @override
  void resetAllBypassWarnings() {
    _warningClient.resetAllBypassWarnings();
  }

  @override
  Future<AccessLevel> getAccessLevel() async {
    final userInfo = await UserPreferences.getUserInfo();
    return userInfo.accessLevel;
  }
}
