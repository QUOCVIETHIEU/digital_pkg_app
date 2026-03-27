import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../../../common/helpers/utils.dart';
import '../../../common/models/models.dart';
import '../../../core/constants/api_url.dart';
import '../../../core/network/dio_client.dart';
import '../../../service_locator.dart';
import '../models/models.dart';

abstract class AuthService {
  Future<SigninRes> signin(SigninReqParams params);
  Future<bool> isLoggedIn();
  Future<void> updatePassword({
    required String userId,
    required String currentPassword,
    required String newPassword,
  });
}

class AuthApiServiceImpl extends AuthService {
  @override
  Future<SigninRes> signin(SigninReqParams params) async {
    try {
      // var response = await sl<DioClient>().post(
      //   ApiUrl.login,
      //   data: params.toJson(),
      // );
      final res = '''{
    "apiVersion": "1.0.0.17",
    "responseCode": "S",
    "data": {
        "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmZTYwOWZkYy0zMTUzLTRiMjMtYzIyNC0wOGRkZDg5NGRiYTMiLCJlbWFpbCI6ImRhbW1pbmgudHVhbkBxdW9jdmlldC5jb20udm4iLCJuYW1lIjoiU1lSVVBTVVBFUlZJU09SIiwianRpIjoiZTBkNWNlYzgtZGE1Yi00YjA5LTg0YWYtZjJkZjRjNDZkYWViIiwiaWF0IjoxNzcyMDIzNjI2LCJuYmYiOjE3NzIwMjM2MjYsImV4cCI6MTc3MjA1MjQyNiwiaXNzIjoiaHR0cHM6Ly9xdW9jdmlldC1hcGkuY29tL21peGluZy1zeXJ1cCIsImF1ZCI6Imh0dHBzOi8vcXVvY3ZpZXQtYXBpLmNvbS9taXhpbmctc3lydXAvYXBpIn0.RA-URkQ4hTeNXIUHp1JT3e_j-720X4pUyTnLQBbYLzE",
        "refreshToken": "4a9385cc8e4d4ab286bf5956cfa891b2",
        "expireDatetime": 1772052426,
        "userInfo": {
            "id": "fe609fdc-3153-4b23-c224-08ddd894dba3",
            "email": "damminh.tuan@quocviet.com.vn",
            "username": "syrupSupervisor",
            "fullName": "SAP SYSTEM",
            "phoneNumber": "",
            "address": "",
            "imagePath": "",
            "accessLevel": "syrupSupervisor",
            "department": "productionSyrup",
            "approvalManager": "",
            "plantArray": "[1030, 1020, 1040, 1050, 1060]",
            "fullRoleName": "Syrup Supervisor",
            "moduleArray": "[1100, 900, 1200]"
        }
    }
}''';
      final response = json.decode(res) as Map<String, dynamic>;
      return SigninRes.fromJson(response['data']);
    } on CheckedFromJsonException catch (message) {
      throw AppException.fromMessage(message.toString());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    final expireDatetime = await UserPreferences.getExpireDatetime();
    if (expireDatetime == 0) return false;
    DateTime expiration = DateTime.fromMillisecondsSinceEpoch(
      expireDatetime * 1000,
      isUtc: true,
    );
    final isLoggedIn = expiration.isAfter(DateTime.now().toUtc());
    if (!isLoggedIn) {
      await UserPreferences.clearExpireDatetime();
    }
    return isLoggedIn;
  }

  @override
  Future<void> updatePassword({
    required String userId,
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      await sl<DioClient>().post(
        ApiUrl.updatePass,
        data: UserInfoReq(
          userId: userId,
          currentPassword: currentPassword,
          newPassword: newPassword,
        ),
      );
    } on CheckedFromJsonException catch (message) {
      throw AppException.fromMessage(message.toString());
    } catch (e) {
      rethrow;
    }
  }
}
