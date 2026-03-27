// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportInformation _$SupportInformationFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SupportInformation', json, ($checkedConvert) {
      final val = SupportInformation(
        supporterId: $checkedConvert('supporterId', (v) => v as String),
        supporterFullName: $checkedConvert(
          'supporterFullName',
          (v) => v as String,
        ),
        supporterPhone: $checkedConvert('supporterPhone', (v) => v as String),
        supporterEmail: $checkedConvert('supporterEmail', (v) => v as String),
        isActive: $checkedConvert('isActive', (v) => v as bool),
      );
      return val;
    });

Map<String, dynamic> _$SupportInformationToJson(SupportInformation instance) =>
    <String, dynamic>{
      'supporterId': instance.supporterId,
      'supporterFullName': instance.supporterFullName,
      'supporterPhone': instance.supporterPhone,
      'supporterEmail': instance.supporterEmail,
      'isActive': instance.isActive,
    };
