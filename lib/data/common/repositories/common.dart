import '../../../core/constants/constants.dart';
import '../../../domain/common/repositories/common.dart';
import '../../../service_locator.dart';
import '../sources/common_service.dart';

class CommonRepositoryImpl implements CommonRepository {
  @override
  bool get isByPassWarningVariant => sl<CommonService>().isByPassWarningVariant;
  @override
  bool get isByPassWarningProcessOrder =>
      sl<CommonService>().isByPassWarningProcessOrder;

  @override
  bool get isByPassWarningBom => sl<CommonService>().isByPassWarningBom;

  @override
  bool get isByPassWarningRecipe => sl<CommonService>().isByPassWarningRecipe;

  @override
  void enableBypassWarningByResultCode(ResultCode resultCode) {
    sl<CommonService>().enableBypassWarningByResultCode(resultCode);
  }

  @override
  void enableBypassWarningByResultCodesList(List<ResultCode> resultCodes) {
    sl<CommonService>().enableBypassWarningByResultCodesList(resultCodes);
  }

  @override
  void resetAllBypassWarnings() {
    sl<CommonService>().resetAllBypassWarnings();
  }

  @override
  Future<AccessLevel> getAccessLevel() => sl<CommonService>().getAccessLevel();
}
