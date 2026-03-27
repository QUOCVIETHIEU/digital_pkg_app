import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../common/helpers/utils.dart';
import '../../common/models/app_info_model.dart';
import '../../common/models/network.dart';

/// This interceptor is used to show request and response logs
class LoggerInterceptor extends Interceptor {
  Logger logger = Logger(
    printer: PrettyPrinter(methodCount: 0, colors: true, printEmojis: true),
  );

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    logger.e('${options.method} request ==> $requestPath'); //Error log
    logger.d(
      'Error type: ${err.error} \n '
      'Error message: ${err.response?.data}',
    ); //Debug log
    handler.next(AppException.fromDioException(err)); //Continue with the Error
  }

  String _bodyToJsonString(dynamic data) {
    try {
      if (data is String) return data;
      if (data is Map) return jsonEncode(data);
      if (data is List) return jsonEncode(data);
      if (data is FormData) {
        return data.fields.toString();
      }
      if (data is Object) {
        return jsonEncode(data);
      }
      return data.toString();
    } catch (e) {
      return 'Error serializing body: $e';
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';
    logger.i(
      '${options.method} request ==> $requestPath query parameters: ${options.queryParameters}',
    ); //Info log
    if (options.data != null) {
      logger.d('Body: ${_bodyToJsonString(options.data)}');
    }

    handler.next(options); // continue with the Request
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Debug log
    // logger.d(
    //   'STATUS CODE: ${response.statusCode} \n '
    //   'STATUS MESSAGE: ${response.statusMessage} \n'
    //   'HEADERS: ${response.headers} \n'
    //   'Data: ${response.data}',
    // );
    // Extract 'data' if present
    if (response.data is Map<String, dynamic> &&
        response.data['data'] != null) {
      // logger.d('Extracted data: ${response.data['data']}');
      response.data = response.data['data'];
    }
    handler.next(response); // continue with the Response
  }
}

class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final plantId = await UserPreferences.getPlantId();
    final token = await UserPreferences.getToken();
    options.headers['Authorization'] = "Bearer $token";
    options.headers['X-Plant-Id'] = plantId;
    final appVersion = AppInfoModel.instance;
    options.headers['X-App-Version'] =
        '${appVersion.fullVersion} (${appVersion.buildNumber})';
    handler.next(options); // continue with the Request
  }
}
