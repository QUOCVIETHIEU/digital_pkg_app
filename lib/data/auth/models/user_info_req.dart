import 'package:json_annotation/json_annotation.dart';

part 'user_info_req.g.dart';

@JsonSerializable()
class UserInfoReq {
  final String userId;
  final String currentPassword;
  final String newPassword;

  UserInfoReq({
    required this.userId,
    required this.currentPassword,
    required this.newPassword,
  });

  factory UserInfoReq.fromJson(Map<String, dynamic> json) =>
      _$UserInfoReqFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoReqToJson(this);
}
