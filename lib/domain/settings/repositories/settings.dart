import '../../../data/auth/models/models.dart';

abstract class SettingsRepository {
  Future<List<UserInfo>> getUsers();
  Future<void> updateUser({
    required String userId,
    required String accessLevel,
  });
}
