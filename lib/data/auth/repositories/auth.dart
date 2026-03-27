import '../../../domain/auth/repositories/auth.dart';
import '../../../service_locator.dart';
import '../models/models.dart';
import '../sources/auth_api_service.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<SigninRes> signIn(SigninReqParams params) async {
    try {
      var data = await sl<AuthService>().signin(params);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthService>().isLoggedIn();
  }

  @override
  Future<void> updatePassword({
    required String userId,
    required String currentPassword,
    required String newPassword,
  }) async {
    await sl<AuthService>().updatePassword(
      userId: userId,
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }
}
