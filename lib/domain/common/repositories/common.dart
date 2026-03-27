import '../../../core/constants/constants.dart';

abstract class CommonRepository {
  bool get isByPassWarningVariant;
  bool get isByPassWarningProcessOrder;
  bool get isByPassWarningBom;
  bool get isByPassWarningRecipe;

  void enableBypassWarningByResultCode(ResultCode resultCode);
  void enableBypassWarningByResultCodesList(List<ResultCode> resultCodes);
  void resetAllBypassWarnings();

  Future<AccessLevel> getAccessLevel();
}
