import 'package:json_annotation/json_annotation.dart';

import '../../../common/models/network.dart';
import '../../../core/constants/constants.dart';
import '../../../core/network/dio_client.dart';
import '../../../service_locator.dart';
import '../models/support_info_res.dart';

abstract class SupportApiService {
  Future<SupportInfoRes> getSupportInfo();
}

class SupportApiServiceImpl implements SupportApiService {
  @override
  Future<SupportInfoRes> getSupportInfo() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.supportInfo);
      return SupportInfoRes.fromJson(response.data);
    } on CheckedFromJsonException catch (message) {
      throw AppException.fromMessage(message.toString());
    } catch (e) {
      rethrow;
    }
  }
}
