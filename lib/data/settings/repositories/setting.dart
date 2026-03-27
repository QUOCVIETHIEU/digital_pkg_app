import '../../../domain/settings/repositories/settings.dart';
import '../../../service_locator.dart';
import '../../auth/models/models.dart';
import '../sources/setting_services.dart';

class SettingsRepositoryImpl extends SettingsRepository {
  @override
  Future<List<UserInfo>> getUsers() async {
    return await sl<SettingsService>().getUsers();
  }

  @override
  Future<void> updateUser({
    required String userId,
    required String accessLevel,
  }) async {
    await sl<SettingsService>().updateUser(
      userId: userId,
      accessLevel: accessLevel,
    );
  }
}
