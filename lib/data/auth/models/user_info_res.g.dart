// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoRes _$UserInfoResFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UserInfoRes', json, ($checkedConvert) {
      final val = UserInfoRes(
        userInfos: $checkedConvert(
          'userInfo',
          (v) => (v as List<dynamic>)
              .map((e) => UserInfo.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'userInfos': 'userInfo'});

Map<String, dynamic> _$UserInfoResToJson(UserInfoRes instance) =>
    <String, dynamic>{'userInfo': instance.userInfos};
