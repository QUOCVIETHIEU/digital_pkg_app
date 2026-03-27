import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'support_information.g.dart';

@JsonSerializable()
class SupportInformation extends Equatable {
  @JsonKey(name: 'supporterId')
  final String supporterId;

  @JsonKey(name: 'supporterFullName')
  final String supporterFullName;

  @JsonKey(name: 'supporterPhone')
  final String supporterPhone;

  @JsonKey(name: 'supporterEmail')
  final String supporterEmail;

  @JsonKey(name: 'isActive')
  final bool isActive;

  const SupportInformation({
    required this.supporterId,
    required this.supporterFullName,
    required this.supporterPhone,
    required this.supporterEmail,
    required this.isActive,
  });

  factory SupportInformation.fromJson(Map<String, dynamic> json) =>
      _$SupportInformationFromJson(json);

  Map<String, dynamic> toJson() => _$SupportInformationToJson(this);

  @override
  List<Object> get props => [
    supporterId,
    supporterFullName,
    supporterPhone,
    supporterEmail,
    isActive,
  ];
}
