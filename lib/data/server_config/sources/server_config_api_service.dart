import 'package:dio/dio.dart';

import '../../../core/network/dio_client.dart';
import '../../../service_locator.dart';

abstract class ServerConfigService {
  Future<bool> pingServer(String serverConfigUrl);
}

class ServerConfigServiceImpl extends ServerConfigService {
  @override
  Future<bool> pingServer(String serverConfigUrl) async {
    try {
      var response = await sl<DioClient>().get(serverConfigUrl);
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
