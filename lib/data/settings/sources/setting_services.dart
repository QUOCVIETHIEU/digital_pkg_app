import 'package:json_annotation/json_annotation.dart';

import '../../../common/models/models.dart';
import '../../../core/constants/constants.dart';
import '../../../core/network/dio_client.dart';
import '../../../service_locator.dart';
import '../../auth/models/models.dart';
import '../../auth/models/update_user_req.dart';
import '../../auth/models/user_info_res.dart';

abstract class SettingsService {
  Future<List<UserInfo>> getUsers();
  Future<void> updateUser({
    required String userId,
    required String accessLevel,
  });
}

class SettingsServiceImpl extends SettingsService {
  @override
  Future<List<UserInfo>> getUsers() async {
    try {
      final response = await sl<DioClient>().get(ApiUrl.accountUsers);
      return UserInfoRes.fromJson(response.data).userInfos;
    } on CheckedFromJsonException catch (message) {
      throw AppException.fromMessage(message.toString());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateUser({
    required String userId,
    required String accessLevel,
  }) async {
    try {
      await sl<DioClient>().post(
        ApiUrl.accountUpdateUser,
        data: UpdateUserReq(
          isOffLine: false,
          actionIndicator: ActionIndicator.update.index,
          updateNote: '',
          userId: userId,
          accessLevel: accessLevel,
        ),
      );
    } on CheckedFromJsonException catch (message) {
      throw AppException.fromMessage(message.toString());
    } catch (e) {
      rethrow;
    }
  }
}
