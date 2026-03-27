// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorInformation _$VendorInformationFromJson(Map<String, dynamic> json) =>
    $checkedCreate('VendorInformation', json, ($checkedConvert) {
      final val = VendorInformation(
        vendorName: $checkedConvert('vendorName', (v) => v as String),
        vendorId: $checkedConvert('vendorId', (v) => v as String),
        website: $checkedConvert('website', (v) => v as String),
        information: $checkedConvert('information', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$VendorInformationToJson(VendorInformation instance) =>
    <String, dynamic>{
      'vendorId': instance.vendorId,
      'website': instance.website,
      'information': instance.information,
      'vendorName': instance.vendorName,
    };
