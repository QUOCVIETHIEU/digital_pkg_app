import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'user_info_res.g.dart';

@JsonSerializable()
class UserInfoRes {
  @JsonKey(name: 'userInfo')
  final List<UserInfo> userInfos;
  UserInfoRes({required this.userInfos});

  factory UserInfoRes.fromJson(Map<String, dynamic> json) =>
      _$UserInfoResFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoResToJson(this);
}
