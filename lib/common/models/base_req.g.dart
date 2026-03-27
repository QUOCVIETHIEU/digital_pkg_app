// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseReq _$BaseReqFromJson(Map<String, dynamic> json) =>
    $checkedCreate('BaseReq', json, ($checkedConvert) {
      final val = BaseReq(
        isOffLine: $checkedConvert('isOffLine', (v) => v as bool),
        actionIndicator: $checkedConvert(
          'actionIndicator',
          (v) => (v as num).toInt(),
        ),
        updateNote: $checkedConvert('updateNote', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$BaseReqToJson(BaseReq instance) => <String, dynamic>{
  'isOffLine': instance.isOffLine,
  'actionIndicator': instance.actionIndicator,
  'updateNote': instance.updateNote,
};
