// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SigninRes _$SigninResFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SigninRes', json, ($checkedConvert) {
      final val = SigninRes(
        accessToken: $checkedConvert('accessToken', (v) => v as String),
        refreshToken: $checkedConvert('refreshToken', (v) => v as String),
        expireDatetime: $checkedConvert(
          'expireDatetime',
          (v) => (v as num).toInt(),
        ),
        userInfo: $checkedConvert(
          'userInfo',
          (v) => UserInfo.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SigninResToJson(SigninRes instance) => <String, dynamic>{
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
  'expireDatetime': instance.expireDatetime,
  'userInfo': instance.userInfo,
};
