import '../../../domain/server/repositories/server_config.dart';
import '../../../service_locator.dart';
import '../sources/server_config_api_service.dart';

class ServerConfigRepositoryImpl extends ServerConfigRepository {
  @override
  Future<bool> pingServer(String serverConfigUrl) async {
    try {
      var data = await sl<ServerConfigService>().pingServer(serverConfigUrl);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
