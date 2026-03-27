import 'dart:convert' show jsonEncode, jsonDecode;

import 'package:shared_preferences/shared_preferences.dart';

import '../../data/auth/models/user_info.dart';

class UserPreferences {
  static const String _keyToken = 'token';
  static const String _plantId = 'plantId';
  static const String _baseURL = 'baseURL';
  static const String _expireDatetime = 'expireDatetime';
  static const String _userInfo = 'userInfo';

  static Future<bool> clearSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.clear();
  }

  // save token
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_keyToken, token);
  }

  // get token
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyToken);
  }

  // get token
  static Future<bool> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(_keyToken);
  }

  //save plant
  static Future<bool> savePlantId(int plantId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setInt(_plantId, plantId);
  }

  //save plant
  static Future<int> getPlantId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_plantId) ?? 0;
  }

  static Future<void> setBaseURL(String serverEndpoint) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_baseURL, serverEndpoint);
  }

  static Future<String> getBaseURL() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_baseURL) ?? '';
  }

  static Future<void> saveExpireDatetime(int expireDatetime) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_expireDatetime, expireDatetime);
  }

  static Future<int> getExpireDatetime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_expireDatetime) ?? 0;
  }

  static Future<void> clearExpireDatetime() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_expireDatetime);
  }

  static Future<void> saveUserInfo(UserInfo userInfo) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_userInfo, jsonEncode(userInfo.toJson()));
  }

  static Future<UserInfo> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final userInfo = prefs.getString(_userInfo);
    return userInfo != null
        ? UserInfo.fromJson(jsonDecode(userInfo))
        : UserInfo.empty;
  }

  static Future<void> clearUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_userInfo);
  }
}
