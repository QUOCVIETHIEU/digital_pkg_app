import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../core/constants/constants.dart';

part 'network.g.dart';

@JsonSerializable()
class ErrorModel {
  @JsonKey(
    name: 'resultCode',
    fromJson: fromJsonResultCode,
    toJson: toJsonResultCode,
  )
  final List<ResultCode>? resultCode;
  final String responseCode;
  final List<String> errorMessage;

  ErrorModel({
    required this.responseCode,
    required this.errorMessage,
    this.resultCode,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
  static List<String>? toJsonResultCode(List<ResultCode>? resultCode) =>
      resultCode?.map((e) => e.name).toList();
  static List<ResultCode>? fromJsonResultCode(String? resultCode) {
    List<String> codes = [];

    if (resultCode == null) return null;

    codes = resultCode
        .split(',')
        .map((code) => code.trim())
        .where((code) => code.isNotEmpty)
        .toList();

    return codes
        .map(
          (code) => ResultCode.values.firstWhere(
            (e) => e.name.toLowerCase() == code.toLowerCase(),
            orElse: () => ResultCode.none,
          ),
        )
        .toList();
  }
}

class AppException extends DioException {
  final String? customMessage;
  final List<ResultCode>? resultCode;
  AppException({
    required super.requestOptions,
    super.response,
    super.type = DioExceptionType.unknown,
    super.error,
    this.customMessage,
    this.resultCode,
  });
  AppException.fromMessage(String msg, {this.resultCode})
    : customMessage = msg,
      super(
        requestOptions: RequestOptions(path: ''),
        type: DioExceptionType.unknown,
        error: null,
      );

  @override
  String toString() {
    return customMessage ?? super.message ?? 'Đã xảy ra lỗi không xác định';
  }

  bool get isExpireToken => response?.statusCode == 401;

  factory AppException.fromDioException(DioException exception) {
    String? message;
    List<ResultCode>? resultCode;
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        message = 'Hết thời gian kết nối';
        break;
      case DioExceptionType.sendTimeout:
        message = 'Hết thời gian gửi dữ liệu';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Hết thời gian nhận dữ liệu';
        break;
      case DioExceptionType.badCertificate:
        message = 'Chứng chỉ không hợp lệ';
        break;
      case DioExceptionType.badResponse:
        if (exception.response != null) {
          final data = exception.response?.data;
          ErrorModel? error;
          try {
            error = ErrorModel.fromJson(data);
            resultCode = error.resultCode;
          } catch (_) {}
          switch (exception.response?.statusCode) {
            case 301:
              message =
                  'Không tìm thấy tài nguyên: ${exception.response?.data}';
              break;
            case 400:
              message =
                  '${error?.errorMessage.join('\n') ?? exception.response?.data}';
              break;
            case 401:
              message =
                  'Không có quyền truy cập: ${ErrorModel.fromJson(exception.response?.data).errorMessage.join('\n')}';
              break;
            case 403:
              message = 'Bị cấm truy cập: ${exception.response?.data}';
              break;
            case 404:
              message = 'Không tìm thấy: ${exception.response?.data}';
              break;
            case 500:
              message = 'Lỗi máy chủ nội bộ';
              break;
            default:
              message =
                  'Mã trạng thái không hợp lệ: ${exception.response?.statusCode}';
          }
        } else {
          message = 'Phản hồi không hợp lệ từ máy chủ';
        }
        break;
      case DioExceptionType.cancel:
        message = 'Yêu cầu đã bị hủy';
        break;
      case DioExceptionType.connectionError:
        message = 'Đã xảy ra lỗi kết nối';
        break;
      case DioExceptionType.unknown:
        message = exception.message ?? 'Đã xảy ra lỗi không xác định';
    }
    return AppException(
      requestOptions: exception.requestOptions,
      response: exception.response,
      type: exception.type,
      error: exception.error,
      customMessage: message,
      resultCode: resultCode,
    );
  }
}

extension AppExceptionExtensions on AppException {
  bool get isResultCodeWarning =>
      resultCode?.any(
        (code) =>
            code == ResultCode.wr001 ||
            code == ResultCode.wr002 ||
            code == ResultCode.wr003 ||
            code == ResultCode.wr004,
      ) ??
      false;
}
