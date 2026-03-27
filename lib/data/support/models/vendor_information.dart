import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vendor_information.g.dart';

@JsonSerializable()
class VendorInformation extends Equatable {
  @JsonKey(name: 'vendorId')
  final String vendorId;

  @JsonKey(name: 'website')
  final String website;

  @JsonKey(name: 'information')
  final String information;

  @JsonKey(name: 'vendorName')
  final String vendorName;

  const VendorInformation({
    required this.vendorName,
    required this.vendorId,
    required this.website,
    required this.information,
  });

  factory VendorInformation.fromJson(Map<String, dynamic> json) =>
      _$VendorInformationFromJson(json);

  Map<String, dynamic> toJson() => _$VendorInformationToJson(this);

  @override
  List<Object> get props => [vendorId, website, information];
}
