// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModel _$BaseModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('BaseModel', json, ($checkedConvert) {
      final val = BaseModel(
        statusName: $checkedConvert('statusName', (v) => v as String? ?? ''),
        note: $checkedConvert('note', (v) => v as String? ?? ''),
        userCreatedId: $checkedConvert(
          'userCreatedId',
          (v) => v as String? ?? '',
        ),
        userCreatedFullName: $checkedConvert(
          'userCreatedFullName',
          (v) => v as String? ?? '',
        ),
        createdDatetime: $checkedConvert(
          'createdDatetime',
          (v) => v == null
              ? DateTime.now()
              : const ApiDateTimeConverter().fromJson(v as String),
        ),
        userDeActiveId: $checkedConvert('userDeActiveId', (v) => v as String?),
        userDeActiveFullName: $checkedConvert(
          'userDeActiveFullName',
          (v) => v as String?,
        ),
        deActiveDatetime: $checkedConvert(
          'deActiveDatetime',
          (v) => const ApiDateTimeNullableConverter().fromJson(v as String?),
        ),
      );
      return val;
    });

Map<String, dynamic> _$BaseModelToJson(BaseModel instance) => <String, dynamic>{
  'statusName': instance.statusName,
  'note': instance.note,
  'userCreatedId': instance.userCreatedId,
  'userCreatedFullName': instance.userCreatedFullName,
  'createdDatetime': const ApiDateTimeConverter().toJson(
    instance.createdDatetime,
  ),
  'userDeActiveId': instance.userDeActiveId,
  'userDeActiveFullName': instance.userDeActiveFullName,
  'deActiveDatetime': const ApiDateTimeNullableConverter().toJson(
    instance.deActiveDatetime,
  ),
};
