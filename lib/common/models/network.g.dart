// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ErrorModel', json, ($checkedConvert) {
      final val = ErrorModel(
        responseCode: $checkedConvert('responseCode', (v) => v as String),
        errorMessage: $checkedConvert(
          'errorMessage',
          (v) => (v as List<dynamic>).map((e) => e as String).toList(),
        ),
        resultCode: $checkedConvert(
          'resultCode',
          (v) => ErrorModel.fromJsonResultCode(v as String?),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ErrorModelToJson(ErrorModel instance) =>
    <String, dynamic>{
      'resultCode': ErrorModel.toJsonResultCode(instance.resultCode),
      'responseCode': instance.responseCode,
      'errorMessage': instance.errorMessage,
    };
