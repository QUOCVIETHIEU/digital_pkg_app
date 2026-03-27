import '../../../domain/support/repositories/support.dart';
import '../../../service_locator.dart';
import '../models/support_info_res.dart';
import '../sources/support_api_service.dart';

class SupportRepositoryImpl extends SupportRepository {
  @override
  Future<SupportInfoRes> getSupportInfo() async {
    try {
      return await sl<SupportApiService>().getSupportInfo();
    } catch (e) {
      rethrow;
    }
  }
}
