// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_info_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportInfoRes _$SupportInfoResFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SupportInfoRes', json, ($checkedConvert) {
      final val = SupportInfoRes(
        supportInformation: $checkedConvert(
          'supportInformation',
          (v) => SupportInformation.fromJson(v as Map<String, dynamic>),
        ),
        vendorInformation: $checkedConvert(
          'vendorInformation',
          (v) => VendorInformation.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SupportInfoResToJson(SupportInfoRes instance) =>
    <String, dynamic>{
      'supportInformation': instance.supportInformation,
      'vendorInformation': instance.vendorInformation,
    };
