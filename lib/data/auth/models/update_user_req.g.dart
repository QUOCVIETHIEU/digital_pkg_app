// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserReq _$UpdateUserReqFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UpdateUserReq', json, ($checkedConvert) {
      final val = UpdateUserReq(
        isOffLine: $checkedConvert('isOffLine', (v) => v as bool),
        actionIndicator: $checkedConvert(
          'actionIndicator',
          (v) => (v as num).toInt(),
        ),
        updateNote: $checkedConvert('updateNote', (v) => v as String),
        userId: $checkedConvert('id', (v) => v as String),
        accessLevel: $checkedConvert('accessLevel', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'userId': 'id'});

Map<String, dynamic> _$UpdateUserReqToJson(UpdateUserReq instance) =>
    <String, dynamic>{
      'isOffLine': instance.isOffLine,
      'actionIndicator': instance.actionIndicator,
      'updateNote': instance.updateNote,
      'id': instance.userId,
      'accessLevel': instance.accessLevel,
    };
