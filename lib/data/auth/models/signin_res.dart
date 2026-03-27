import 'package:json_annotation/json_annotation.dart';

import 'user_info.dart';

part 'signin_res.g.dart';

@JsonSerializable()
class SigninRes {
  final String accessToken;
  final String refreshToken;
  final int expireDatetime;
  final UserInfo userInfo;
  SigninRes({
    required this.accessToken,
    required this.refreshToken,
    required this.expireDatetime,
    required this.userInfo,
  });

  factory SigninRes.fromJson(Map<String, dynamic> json) =>
      _$SigninResFromJson(json);
  Map<String, dynamic> toJson() => _$SigninResToJson(this);
}
