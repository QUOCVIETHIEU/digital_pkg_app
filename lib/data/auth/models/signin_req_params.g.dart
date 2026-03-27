// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_req_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SigninReqParams _$SigninReqParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SigninReqParams', json, ($checkedConvert) {
      final val = SigninReqParams(
        username: $checkedConvert('username', (v) => v as String),
        password: $checkedConvert('password', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$SigninReqParamsToJson(SigninReqParams instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
