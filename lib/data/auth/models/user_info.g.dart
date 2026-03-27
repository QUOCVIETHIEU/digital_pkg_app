// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UserInfo', json, ($checkedConvert) {
      final val = UserInfo(
        id: $checkedConvert('id', (v) => v as String),
        email: $checkedConvert('email', (v) => v as String),
        userName: $checkedConvert('username', (v) => v as String),
        fullName: $checkedConvert('fullName', (v) => v as String),
        phoneNumber: $checkedConvert('phoneNumber', (v) => v as String),
        address: $checkedConvert('address', (v) => v as String),
        imagePath: $checkedConvert('imagePath', (v) => v as String),
        accessLevel: $checkedConvert(
          'accessLevel',
          (v) => UserInfo.fromJsonAccessLevel(v as String),
        ),
        department: $checkedConvert(
          'department',
          (v) => UserInfo.fromJsonDepartment(v as String),
        ),
        approvalManager: $checkedConvert('approvalManager', (v) => v as String),
        plantArray: $checkedConvert(
          'plantArray',
          (v) => UserInfo.parseIntList(v as String),
        ),
        fullRoleName: $checkedConvert('fullRoleName', (v) => v as String?),
        moduleArray: $checkedConvert(
          'moduleArray',
          (v) => UserInfo.parseIntList(v as String),
        ),
      );
      return val;
    }, fieldKeyMap: const {'userName': 'username'});

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'username': instance.userName,
  'fullName': instance.fullName,
  'phoneNumber': instance.phoneNumber,
  'address': instance.address,
  'imagePath': instance.imagePath,
  'accessLevel': UserInfo.toJsonAccessLevel(instance.accessLevel),
  'department': UserInfo.toJsonDepartment(instance.department),
  'approvalManager': instance.approvalManager,
  'plantArray': UserInfo._parseIntListToJson(instance.plantArray),
  'fullRoleName': instance.fullRoleName,
  'moduleArray': UserInfo._parseIntListToJson(instance.moduleArray),
};
