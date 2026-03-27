import '../constants/enums.dart';

class WarningClient {
  static final WarningClient _instance = WarningClient._internal();

  factory WarningClient() => _instance;

  WarningClient._internal();

  bool _isByPassWarningProcessOrder = false;
  bool _isByPassWarningBom = false;
  bool _isByPassWarningRecipe = false;
  bool _isByPassWarningVariant = false;

  bool get isByPassWarningProcessOrder => _isByPassWarningProcessOrder;
  bool get isByPassWarningBom => _isByPassWarningBom;
  bool get isByPassWarningRecipe => _isByPassWarningRecipe;
  bool get isByPassWarningVariant => _isByPassWarningVariant;
  void enableBypassWarningByResultCode(ResultCode resultCode) {
    switch (resultCode) {
      case ResultCode.wr001:
        _isByPassWarningProcessOrder = true;
        break;
      case ResultCode.wr002:
        _isByPassWarningBom = true;
        break;
      case ResultCode.wr003:
        _isByPassWarningRecipe = true;
        break;
      case ResultCode.wr004:
        _isByPassWarningVariant = true;
        break;
      case ResultCode.none:
        break;
    }
  }

  void enableBypassWarningByResultCodesList(List<ResultCode> resultCodes) {
    for (final resultCode in resultCodes) {
      enableBypassWarningByResultCode(resultCode);
    }
  }

  void resetAllBypassWarnings() {
    _isByPassWarningProcessOrder = false;
    _isByPassWarningBom = false;
    _isByPassWarningRecipe = false;
    _isByPassWarningVariant = false;
  }
}
