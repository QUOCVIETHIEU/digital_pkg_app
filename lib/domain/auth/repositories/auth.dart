import '../../../data/auth/models/models.dart';

abstract class AuthRepository {
  Future<SigninRes> signIn(SigninReqParams signInReq);
  Future<bool> isLoggedIn();
  Future<void> updatePassword({
    required String userId,
    required String currentPassword,
    required String newPassword,
  });
}
