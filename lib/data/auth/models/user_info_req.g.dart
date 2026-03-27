// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoReq _$UserInfoReqFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UserInfoReq', json, ($checkedConvert) {
      final val = UserInfoReq(
        userId: $checkedConvert('userId', (v) => v as String),
        currentPassword: $checkedConvert('currentPassword', (v) => v as String),
        newPassword: $checkedConvert('newPassword', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$UserInfoReqToJson(UserInfoReq instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'currentPassword': instance.currentPassword,
      'newPassword': instance.newPassword,
    };
