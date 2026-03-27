import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'support_information.dart';
import 'vendor_information.dart';

part 'support_info_res.g.dart';

@JsonSerializable()
class SupportInfoRes extends Equatable {
  @JsonKey(name: 'supportInformation')
  final SupportInformation supportInformation;

  @JsonKey(name: 'vendorInformation')
  final VendorInformation vendorInformation;

  const SupportInfoRes({
    required this.supportInformation,
    required this.vendorInformation,
  });

  factory SupportInfoRes.fromJson(Map<String, dynamic> json) =>
      _$SupportInfoResFromJson(json);

  Map<String, dynamic> toJson() => _$SupportInfoResToJson(this);

  @override
  List<Object> get props => [supportInformation, vendorInformation];
}
